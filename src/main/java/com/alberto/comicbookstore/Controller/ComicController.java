package com.alberto.comicbookstore.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alberto.comicbookstore.Models.Comic;
import com.alberto.comicbookstore.Services.ComicService;
import com.alberto.comicbookstore.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ComicController {

	@Autowired
	UserService userService;

	@Autowired
	ComicService comicService;

	// Home Page
	@GetMapping("/Home")
	public String homepage(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getLoggedInUser(userId));
		List<Comic> comicList = comicService.allComics();
		model.addAttribute("comics", comicList);
		return "homepage.jsp";
	}

	// Takes you to a form to create a new comic
	@GetMapping("/comics/new")
	public String newComic(@ModelAttribute("comic") Comic comic, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		return "newComic.jsp";
	}

	@PostMapping("/newComic")
    public String createComic(@Valid @ModelAttribute("comic") Comic comic, BindingResult result,
            @RequestParam("coverPicture") MultipartFile file, HttpSession session) {
        if (result.hasErrors()) {
            return "newComic.jsp";
        }

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        
        String uploadDir = "uploads/cover_pictures/";
        Path uploadPath = Paths.get(uploadDir);
        
        try {
            // Create the directory if it doesn't exist
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Handle file upload
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                Path path = Paths.get(uploadDir + fileName);
                try {
                    // Save file to a directory
                    Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                    comic.setCoverImage(fileName); // Set path to comic entity
                } catch (IOException e) {
                    e.printStackTrace(); // Handle error, maybe show a message to the user
                }
            }

            comicService.createComic(comic);
            return "redirect:/Home";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/comics/new";
        }
    }
}
