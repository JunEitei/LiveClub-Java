package com.kitamura.club.controller;

import com.kitamura.club.entity.Live;
import com.kitamura.club.service.LiveService;
import com.kitamura.common.core.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/live")
public class LiveController {

    private final LiveService liveService;

    @Autowired
    public LiveController(LiveService liveService) {
        this.liveService = liveService;
    }

    @PostMapping("/create")
    public R<Live> createLiveEvent(@RequestBody Live live) {
        Live createdLive = liveService.createLiveEvent(live);
        return R.ok(createdLive);
    }


    @GetMapping("/list")
    public R<List<Live>> getAllLiveEvents() {
        List<Live> liveList = liveService.getAllLiveEvents();
        return R.ok(liveList);
    }

    @GetMapping("/{id}")
    public R<Live> getLiveEventById(@PathVariable String id) {
        Optional<Live> liveOptional = liveService.getLiveEventById(id);
        return liveOptional.map(R::ok).orElseGet(R::fail);
    }

    @PutMapping("/update")
    public R<Live> updateLiveEvent(@RequestBody Live live) {
        Live updatedLive = liveService.updateLiveEvent(live);
        return R.ok(updatedLive);
    }

    @DeleteMapping("/{id}")
    public R<Void> deleteLiveEvent(@PathVariable String id) {
        liveService.deleteLiveEvent(id);
        return R.ok();
    }

    @PostMapping("/complete")
    public R<Void> completeLiveEvent(@RequestParam String liveId) {
        liveService.completeLiveEvent(liveId);
        return R.ok();
    }
}