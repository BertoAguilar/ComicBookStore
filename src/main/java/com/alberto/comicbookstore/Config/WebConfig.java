package com.alberto.comicbookstore.Config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Map '/uploads/coverImage/**' to the physical directory 'uploads/coverImage/'
        registry.addResourceHandler("/uploads/coverImage/**")
                .addResourceLocations("file:uploads/coverImage/");
    }
}

