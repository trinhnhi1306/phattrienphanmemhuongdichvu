package com.Quan.TryJWT.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.dto.ProductOutput;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.service.ProductService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@GetMapping(value = { "/{pageNo}", "/" })
	public ResponseEntity<ProductOutput> getProductInOnePage(@PathVariable(required = false) Optional<Integer> pageNo) {
		int pageNoOffical = 1;
		if (pageNo.isPresent())
			pageNoOffical = pageNo.get();
		String sortDir = "desc";
		String sortField = "productId";
		int pageSize = 20;
		List<Product> products = productService.findPaginated(pageNoOffical, pageSize, sortField, sortDir).getContent();

		ProductOutput output = new ProductOutput();
		output.setPage(pageNoOffical);
		output.setTotalPage((int) Math.ceil((double) (productService.totalItem()) / pageSize));
		output.setListResult(products);
		return ResponseEntity.ok(output);
	}

	@GetMapping(value = { "/get-product" })
	public ResponseEntity<?> getProductById(@RequestParam(name = "idProduct") long idProduct) {
		Product product = null;
		try {
			product = productService.findById(idProduct);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Product is unavaiable");
		}
		return ResponseEntity.ok(product);
	}
	
	@RequestMapping(value = "get-image/{imageName}", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<?> getImage(@PathVariable("imageName") String imageName) throws IOException {

		try {
			ClassPathResource imgFile = new ClassPathResource("images/products/" + imageName);
			return ResponseEntity
	                .ok()
	                .contentType(MediaType.IMAGE_JPEG)
	                .body(new InputStreamResource(imgFile.getInputStream()));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Image not found!");
		}       
    }
}
