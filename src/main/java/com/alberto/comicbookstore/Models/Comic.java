package com.alberto.comicbookstore.Models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "comics")
public class Comic {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Please Enter Comic Book Title")
	@Size(min = 1, max = 128, message = "Comic Book Title must be between 1 and 128 characters")
	private String title;
	
	@NotEmpty(message = "Please Enter Author")
	@Size(min = 3, max = 50, message = "Author must be between 3 and 50 characters")
	private String author;
	
	@NotEmpty(message = "Please Enter a Publisher")
	@Size(min = 1, max = 128, message = "Publisher must be between 2 and 128 characters")
	private String publisher;
	
	@NotNull(message = "Please Enter a Number of Pages")
	@Min(value = 1, message = "Comic Book Must Have At Least One Page")
	@Max(value = 500, message = "Comic Book Must Have Fewer Than 500 Pages")
	private Integer numOfPages;
	
	// URL to the image of the comic's cover
	@NotEmpty(message = "Please Provide Cover Photo")
	private String coverImageUrl;
	
	@Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToMany
	@JoinTable(
		name = "comic_genre",
		joinColumns = @JoinColumn(name = "comic_id"),
		inverseJoinColumns = @JoinColumn(name = "genre_id")
	)
	private List<Genre> genres;

	public Comic() {}

	public Comic(
			@NotEmpty(message = "Please Enter Comic Book Title") @Size(min = 1, max = 128, message = "Comic Book Title must be between 1 and 128 characters") String title,
			@NotEmpty(message = "Please Enter Author") @Size(min = 3, max = 50, message = "Author must be between 3 and 50 characters") String author,
			@NotEmpty(message = "Please Enter a Publisher") @Size(min = 1, max = 128, message = "Publisher must be between 2 and 128 characters") String publisher,
			@NotNull(message = "Please Enter a Number of Pages") @Min(value = 1, message = "Comic Book Must Have At Least One Page") @Max(value = 500, message = "Comic Book Must Have Fewer Than 500 Pages") Integer numOfPages,
			@NotEmpty(message = "Please Provide Cover Photo") String coverImageUrl, User user, List<Genre> genres) {
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.numOfPages = numOfPages;
		this.coverImageUrl = coverImageUrl;
		this.user = user;
		this.genres = genres;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Integer getNumOfPages() {
		return numOfPages;
	}

	public void setNumOfPages(Integer numOfPages) {
		this.numOfPages = numOfPages;
	}

	public String getCoverImageUrl() {
		return coverImageUrl;
	}

	public void setCoverImageUrl(String coverImageUrl) {
		this.coverImageUrl = coverImageUrl;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

}