package com.kitamura.club.service;

import com.kitamura.club.entity.Artist;
import com.kitamura.club.entity.Band;
import com.kitamura.club.entity.Live;

import java.util.List;

public interface ArtistService {

    Artist addFavouriteBand(String artistId, Band band);

    Artist saveArtist(Artist artist);

    Artist addLiveToHistory(String artistId, Live live);

    List<Artist> getAllArtists();

    Artist createArtist(Artist artist);

    Artist getArtistById(String id);

    Artist updateArtist(Artist artist);

    void deleteArtist(String id);
}