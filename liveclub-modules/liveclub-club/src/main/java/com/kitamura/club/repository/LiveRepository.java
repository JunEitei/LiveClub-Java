package com.kitamura.club.repository;

import java.util.List;
import java.util.Optional;

import com.kitamura.club.entity.Live;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LiveRepository {

    private final MongoTemplate mongoTemplate;

    @Autowired
    public LiveRepository(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    // 插入文档
    public Live insert(Live live) {
        return mongoTemplate.insert(live);
    }

    // 查询所有文档
    public List<Live> findAll() {
        return mongoTemplate.findAll(Live.class);
    }

    // 根据ID查询文档
    public Optional<Live> findById(String id) {
        return Optional.ofNullable(mongoTemplate.findById(id, Live.class));
    }

    // 更新文档
    public Live save(Live live) {
        return mongoTemplate.save(live);
    }

    // 删除文档
    public void delete(Live live) {
        mongoTemplate.remove(live);
    }
}