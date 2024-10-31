package com.alberto.comicbookstore.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alberto.comicbookstore.Models.Comic;
import com.alberto.comicbookstore.Models.Genre;

@Repository
public interface ComicRepository extends CrudRepository<Comic, Long> {
	// this method retrieves all the comics from the database
	List<Comic> findAll();
	
	List<Comic> findComicByTitleContaining(String title);
	
	List<Comic> findComicByGenres(String[] genres);
}
