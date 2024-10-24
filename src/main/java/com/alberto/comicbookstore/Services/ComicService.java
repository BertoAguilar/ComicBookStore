package com.alberto.comicbookstore.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alberto.comicbookstore.Models.Comic;
import com.alberto.comicbookstore.Repository.ComicRepository;


@Service
public class ComicService {
	@Autowired
	ComicRepository comicRepo;

	// returns all the comics
	public List<Comic> allComics() {
		return comicRepo.findAll();
	}

	// creates a comic
	public void createComic(Comic comic) {
		comicRepo.save(comic);
	}
}
