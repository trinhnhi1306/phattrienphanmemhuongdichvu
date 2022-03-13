package com.Quan.TryJWT.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.models.Product;
import com.Quan.TryJWT.service.ProductService;




@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	
	 @GetMapping(value = {"/{pageNo}", "/"})
	    public ResponseEntity<List<Product>> getProductInOnePage(@PathVariable(required = false) Optional<Integer> pageNo) {
	        int pageNoOffical = 1;
	        if (pageNo.isPresent()) pageNoOffical = pageNo.get();
	        String sortDir = "desc";
	        String sortField = "productId";
	        int pageSize = 10;
	        List<Product> products = productService.findPaginated(pageNoOffical, pageSize, sortField, sortDir).getContent();
	        return ResponseEntity.ok(products);
	    }
	 
	 @GetMapping(value = {"/get-product"})
	    public ResponseEntity<?> getProductById(@RequestParam(name = "idProduct") long idProduct) {
	        Product product = null;
	        try {
	            product = productService.findById(idProduct);
	        } catch (NotFoundException e) {
	            return ResponseEntity.badRequest().body("Product is unavaiable");
	        }
	        return ResponseEntity.ok(product);
	    }
}
