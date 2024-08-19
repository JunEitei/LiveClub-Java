package com.kitamura.club.service;


import com.kitamura.club.entity.Live;

import java.util.List;
import java.util.Optional;

public interface LiveService {

    Live createLiveEvent(Live live);

    List<Live> getAllLiveEvents();

    Optional<Live> getLiveEventById(String id);

    Live updateLiveEvent(Live live);

    void deleteLiveEvent(String id);

    void completeLiveEvent(String liveId);
}