package com.kitamura.club.repository;

import com.kitamura.club.entity.Artist;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistRepository extends MongoRepository<Artist, String> {
}