package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.payload.request.CartRequest;
import com.Quan.TryJWT.payload.response.ResponseBody;
import com.Quan.TryJWT.service.CartService;
import com.Quan.TryJWT.service.ProductService;
import com.Quan.TryJWT.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("")
	public ResponseEntity<List<Cart>> getCartByUserId(@RequestParam("userId") int userId) 
	{
		List<Cart> list = cartService.getAllByUserId(userId);
		return ResponseEntity.ok(list);
	}
	
	@PostMapping
	public ResponseEntity<?> postCart(CartRequest cartRequest) {
		Product product = productService.findById(cartRequest.getProductId());
		if (product == null) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "Product not found!", null));
		}
		User user = userService.findById(cartRequest.getUserId());
		if (user == null) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "User not found!", null));
		}
		int quantity = cartRequest.getQuantity();
		if (quantity <= 0) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "Quantity must be positive!", null));
		}
		if (quantity > product.getQuantity()) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "The requested quantity exceeds the remaining quantity of this product!", null));
		}
		Cart cart = new Cart(null, product, user, quantity);
		cart = cartService.addCart(cart);
		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "Add cart successfully!", cart));
	}
}
