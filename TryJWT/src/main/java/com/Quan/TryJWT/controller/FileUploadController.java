package com.Quan.TryJWT.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/image")
public class FileUploadController {
	
	public String saveFile(String fileName, MultipartFile file, String folder) {
		Path uploadDirectory = Paths.get("src\\main\\resources\\images\\" + folder);
		fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHHmmss")) + fileName;
		try(InputStream inputStream = file.getInputStream()) {
			Path filePath = uploadDirectory.resolve(fileName);
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	@PostMapping("/product")
	public ResponseEntity<?> postProductImage(@RequestParam("file") MultipartFile file) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		
		saveFile(fileName, file, "products");
		
		return ResponseEntity.ok(fileName);
	}
	
	@PostMapping("/category")
	public ResponseEntity<?> postCategoryImage(@RequestParam("file") MultipartFile file) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		
		String newFileName = saveFile(fileName, file, "categories");
		
		return ResponseEntity.ok(newFileName);
	}
	
}
