package com.kitamura.club.service.impl;

import com.kitamura.club.entity.Artist;
import com.kitamura.club.entity.Band;
import com.kitamura.club.entity.Live;
import com.kitamura.club.repository.ArtistRepository;
import com.kitamura.club.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ArtistServiceImpl implements ArtistService {

    private final ArtistRepository artistRepository;

    @Autowired
    public ArtistServiceImpl(ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    @Override
    public Artist saveArtist(Artist artist) {
        return artistRepository.save(artist);
    }

    @Override
    public Artist addFavouriteBand(String artistId, Band band) {
        Optional<Artist> artistOptional = artistRepository.findById(artistId);
        if (artistOptional.isPresent()) {
            Artist artist = artistOptional.get();

            // Ensure favouriteBands is initialized
            if (artist.getFavouriteBands() == null) {
                artist.setFavouriteBands(new ArrayList<>());
            }

            // Add band to favouriteBands
            artist.getFavouriteBands().add(band);

            return artistRepository.save(artist);
        }
        return null;
    }

    @Override
    public Artist addLiveToHistory(String artistId, Live live) {
        Optional<Artist> artistOptional = artistRepository.findById(artistId);
        if (artistOptional.isPresent()) {
            Artist artist = artistOptional.get();
            if (artist.getHistoryLives() == null) {
                artist.setHistoryLives(new ArrayList<>()); // Initialize if null
            }
            artist.getHistoryLives().add(live);            return artistRepository.save(artist);
        }
        return null;
    }

    @Override
    public List<Artist> getAllArtists() {
        return artistRepository.findAll();
    }

    @Override
    public Artist createArtist(Artist artist) {
        return artistRepository.save(artist);
    }

    @Override
    public Artist getArtistById(String id) {
        return artistRepository.findById(id).orElse(null);
    }

    @Override
    public Artist updateArtist(Artist artist) {
        return artistRepository.save(artist);
    }

    @Override
    public void deleteArtist(String id) {
        artistRepository.deleteById(id);
    }
}