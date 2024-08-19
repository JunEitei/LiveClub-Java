package com.kitamura.club.service.impl;

import com.kitamura.club.entity.Artist;
import com.kitamura.club.entity.Band;
import com.kitamura.club.entity.Live;
import com.kitamura.club.entity.Program;
import com.kitamura.club.repository.LiveRepository;
import com.kitamura.club.service.ArtistService;
import com.kitamura.club.service.LiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class LiveServiceImpl implements LiveService {

    private final LiveRepository liveRepository;
    private final ArtistService artistService;

    @Autowired
    public LiveServiceImpl(LiveRepository liveRepository, ArtistService artistService) {
        this.liveRepository = liveRepository;
        this.artistService = artistService;
    }

    @Override
    public Live createLiveEvent(Live live) {
        return liveRepository.insert(live);
    }

    @Override
    public List<Live> getAllLiveEvents() {
        return liveRepository.findAll();
    }

    @Override
    public Optional<Live> getLiveEventById(String id) {
        return liveRepository.findById(id);
    }

    @Override
    public Live updateLiveEvent(Live live) {
        return liveRepository.save(live);
    }

    @Override
    public void deleteLiveEvent(String id) {
        Optional<Live> optionalLive = liveRepository.findById(id);
        optionalLive.ifPresent(liveRepository::delete);
    }
    @Override
    public void completeLiveEvent(String liveId) {
        // Get the Live event by its ID
        Optional<Live> liveOptional = liveRepository.findById(liveId);
        if (liveOptional.isPresent()) {
            Live live = liveOptional.get();

            // Save bands to artists' favoriteBands
            List<Band> bands = live.getPrograms().stream()
                    .map(Program::getBand)
                    .distinct()
                    .collect(Collectors.toList());

            for (Band band : bands) {
                for (Artist artist : band.getMembers()) {
                    // Check if artist exists, create if not
                    Artist existingArtist = artistService.getArtistById(artist.getId());
                    if (existingArtist == null) {
                        // Create new artist object or handle creation logic
                        existingArtist = new Artist();
                        existingArtist.setId(artist.getId());
                        existingArtist.setName(artist.getName()); // Copy other necessary fields
                        // Save new artist to database
                        existingArtist = artistService.saveArtist(existingArtist);
                    }

                    // Add band to artist's favoriteBands
                    artistService.addFavouriteBand(existingArtist.getId(), band);
                }
            }

            // Save live information to artists' historyLives
            for (Program program : live.getPrograms()) {
                for (Artist artist : program.getBand().getMembers()) {
                    artistService.addLiveToHistory(artist.getId(), live);
                }
            }
        } else {
            throw new RuntimeException("Live event not found for id: " + liveId);
        }
    }
}