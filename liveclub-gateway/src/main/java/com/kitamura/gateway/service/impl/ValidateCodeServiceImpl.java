package com.kitamura.gateway.service.impl;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;
import com.google.code.kaptcha.Producer;
import com.kitamura.common.core.constant.CacheConstants;
import com.kitamura.common.core.constant.Constants;
import com.kitamura.common.core.exception.CaptchaException;
import com.kitamura.common.core.utils.StringUtils;
import com.kitamura.common.core.utils.sign.Base64;
import com.kitamura.common.core.utils.uuid.IdUtils;
import com.kitamura.common.core.web.domain.AjaxResult;
import com.kitamura.common.redis.service.RedisService;
import com.kitamura.gateway.config.properties.CaptchaProperties;
import com.kitamura.gateway.service.ValidateCodeService;

/**
 * 验证码实现处理
 *
 * @author damao
 */
@Service
public class ValidateCodeServiceImpl implements ValidateCodeService
{
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisService redisService;

    @Autowired
    private CaptchaProperties captchaProperties;

    /**
     * 生成验证码
     */
    @Override
    public AjaxResult createCaptcha() throws IOException, CaptchaException
    {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = captchaProperties.getEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        String captchaType = captchaProperties.getType();
        // 生成验证码
        if ("math".equals(captchaType))
        {
            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            image = captchaProducerMath.createImage(capStr);
        }
        else if ("char".equals(captchaType))
        {
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }

        redisService.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // ストリーム情報を変換して書き込みます
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return AjaxResult.error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }

    /**
     * 確認コードを確認する
     */
    @Override
    public void checkCaptcha(String code, String uuid) throws CaptchaException
    {
        if (StringUtils.isEmpty(code))
        {
            throw new CaptchaException("验证码不能为空");
        }
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisService.getCacheObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaException("验证码已失效");
        }
        redisService.deleteObject(verifyKey);
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException("验证码错误");
        }
    }
}
