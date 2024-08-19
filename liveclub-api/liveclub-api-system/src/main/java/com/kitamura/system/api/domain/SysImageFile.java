package com.kitamura.system.api.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 图片文件信息
 *
 */
public class SysImageFile
{
    /**
     * 图片地址
     */
    private List<String> images;

    /**
     * 图片类型
     */
    private String image_type;

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getImage_type() {
        return image_type;
    }

    public void setImage_type(String image_type) {
        this.image_type = image_type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("images", getImages())
            .append("image_type", getImage_type())
            .toString();
    }
}
