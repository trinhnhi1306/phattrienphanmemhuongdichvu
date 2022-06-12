package com.Quan.TryJWT.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Quan.TryJWT.Exception.AppUtils;
import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.service.BrandService;
import com.Quan.TryJWT.service.CategoryService;
import com.Quan.TryJWT.service.ProductService;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/admin/product")
public class ManageProductController {
	
	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;
	
	@PostMapping
	public ResponseEntity<?> postProduct(@Valid @RequestBody Product product, BindingResult bindingResult) {
		if (productService.existsByName(product.getName())) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product name is already taken!", null);
		}
		
		if (bindingResult.hasErrors())
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
		
		Product newProduct = product;
		newProduct.setBrand(brandService.findById(product.getBrand().getBrandId()));
		newProduct.setCategory(categoryService.findById(product.getCategory().getCategoryId()));
		productService.addProduct(newProduct);
		return AppUtils.returnJS(HttpStatus.OK, "Add product successfully!", newProduct);
	}
	
	@PostMapping(value = "/test")
	public ResponseEntity<?> postTestProduct(@Valid @RequestBody Product product, @RequestParam("file") MultipartFile file, BindingResult bindingResult) {
		if (productService.existsByName(product.getName())) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product name is already taken!", null);
		}
		
		if (bindingResult.hasErrors())
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
		
//		
//		Product newProduct = product;
//		newProduct.setBrand(brandService.findById(product.getBrand().getBrandId()));
//		newProduct.setCategory(categoryService.findById(product.getCategory().getCategoryId()));
//		productService.addProduct(newProduct);
		
		System.out.println(file.getOriginalFilename());
		return AppUtils.returnJS(HttpStatus.OK, "Add product successfully!", null);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteProduct(@PathVariable("id") long id) {
		Product product = productService.findById(id);
		if(product == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product is unavaiable", product);
		}
		
		int size;
		size = product.getCarts().size();
		if (size > 0)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, 
					String.format("Cannot delete this product! This product relate to %s carts", size), null);
		
		size = product.getOrderDetails().size();
		if (size > 0)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, 
					String.format("Cannot delete this product! This product relate to %s order details", size), null);
		
		size = product.getFeedBacks().size();
		if (size > 0)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, 
					String.format("Cannot delete this product! This product relate to %s feedbacks", size), null);
		
		if(product.getCategory() != null) {
			Category category = categoryService.findById(product.getCategory().getCategoryId());
			category.getProducts().remove(product);
			categoryService.updateCategory(category);
		}
		if(product.getBrand() != null) {
			Brand brand = brandService.findById(product.getCategory().getCategoryId());
			brand.getProducts().remove(product);
			brandService.updateBrand(brand);
		}
		
		productService.deleteProduct(product);
		return AppUtils.returnJS(HttpStatus.OK, "Delete product successfully!", null);
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putProduct(@PathVariable("id") long id, @Valid @RequestBody Product newProduct,
			BindingResult bindingResult) {
		Product oldProduct = null;
		
		oldProduct = productService.findById(id);
		
		if(oldProduct == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product is unavaiable", oldProduct);
		}
		
		if (productService.existsByName(newProduct.getName())
				&& !newProduct.getName().equals(oldProduct.getName())) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product name is already taken!", null);
		}
		if (bindingResult.hasErrors())
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
		
		newProduct.setBrand(brandService.findById(newProduct.getBrand().getBrandId()));
		newProduct.setCategory(categoryService.findById(newProduct.getCategory().getCategoryId()));

		productService.updateProduct(newProduct);
		return AppUtils.returnJS(HttpStatus.OK, "Update product successfully!", newProduct);
	}
}
