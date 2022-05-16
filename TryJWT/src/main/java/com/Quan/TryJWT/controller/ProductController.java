package com.Quan.TryJWT.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Quan.TryJWT.Exception.AppUtils;
import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.dto.ProductOutput;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.service.BrandService;
import com.Quan.TryJWT.service.CategoryService;
import com.Quan.TryJWT.service.ProductService;

import io.swagger.annotations.ApiOperation;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;

//	@GetMapping(value = { "/{pageNo}", "/" })
//	public ResponseEntity<ProductOutput> getProductInOnePage(@PathVariable(required = false) Optional<Integer> pageNo) {
//		int pageNoOffical = 1;
//		if (pageNo.isPresent())
//			pageNoOffical = pageNo.get();
//		String sortDir = "desc";
//		String sortField = "productId";
//		int pageSize = 20;
//		List<Product> products = productService.findPaginated(pageNoOffical, pageSize, sortField, sortDir).getContent();
//
//		ProductOutput output = new ProductOutput();
//		output.setPage(pageNoOffical);
//		output.setTotalPage((int) Math.ceil((double) (productService.totalItem()) / pageSize));
//		output.setListResult(products);
//		return ResponseEntity.ok(output);
//	}

	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getProductById(@PathVariable("id") long id) {
		Product product = null;
		
		product = productService.findById(id);
		
		if(product == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product is unavaiable", product);
		}
		return ResponseEntity.ok(product);
	}

	@RequestMapping(value = "image/{imageName}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<?> getImage(@PathVariable("imageName") String imageName) throws IOException {

		try {
			ClassPathResource imgFile = new ClassPathResource("images/products/" + imageName);
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG)
					.body(new InputStreamResource(imgFile.getInputStream()));
		} catch (Exception e) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Image not found", null);
		}
	}

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
		Product product = null;
		
		product = productService.findById(id);
		
		if(product == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product is unavaiable", product);
		}
		
		if (product.getOrderDetails().size() > 0)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Product is in use", null);
			
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

	@GetMapping("")
	public ResponseEntity<ProductOutput> findProducts(
			@RequestParam(value = "pageNo", required = false) Optional<Integer> pPageNo,
			@RequestParam(value = "pageSize", required = false) Optional<Integer> pPageSize,
			@RequestParam(value = "sortField", required = false) Optional<String> pSortField,
			@RequestParam(value = "sortDirection", required = false) Optional<String> pSortDir,
			@RequestParam(value = "categoryId", required = false) Optional<Long> pCategoryId) {
		int pageNo = 1;
		int pageSize = 10;
		String sortField = "productId";
		String sortDirection = "ASC";
		if (pPageNo.isPresent()) {
			pageNo = pPageNo.get();
		}
		if (pPageSize.isPresent()) {
			pageSize = pPageSize.get();
		}
		if (pSortField.isPresent()) {
			sortField = pSortField.get();
		}
		if (pSortDir.isPresent()) {
			sortDirection = pSortDir.get();
		}

		int totalPage;
		List<Product> products = new ArrayList<Product>();
		if (pCategoryId.isPresent()) {
			long categoryId = pCategoryId.get();
			totalPage = (int) Math.ceil((double) (productService.getCountByCategoryId(categoryId)) / pageSize);
			products = productService.getAllByCategoryId(categoryId, pageNo, pageSize, sortField, sortDirection);
		} else {
			totalPage = (int) Math.ceil((double) (productService.getCount()) / pageSize);
			products = productService.getAllByStatus(true, pageNo, pageSize, sortField, sortDirection);
		}

		ProductOutput output = new ProductOutput();
		output.setPage(pageNo);
		output.setTotalPage(totalPage);
		output.setListResult(products);
		return ResponseEntity.ok(output);
	}
	
	@ApiOperation(value="Lấy tất cả danh sách sản phẩm")
    @GetMapping("/all")
    public ResponseEntity<List<Product>> getAllProduct(){
        return ResponseEntity.ok(productService.getAllProduct());
    }
}
