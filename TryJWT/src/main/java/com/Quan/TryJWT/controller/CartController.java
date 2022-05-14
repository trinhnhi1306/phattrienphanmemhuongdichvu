package com.Quan.TryJWT.controller;


import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.CartSupport;
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
	ProductService productService;
	


	@Autowired
	CartService cartService;
	
	@Autowired
	UserService userService;
	

	@PostMapping("/add-to-cart")
	public ResponseEntity<?> addToCart(HttpSession session, @RequestParam long id, @RequestParam Optional<Integer> quantity,
			Principal principal) {
		Product product = null;
		
		try {
			product = productService.getProductById(id);
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		String username = principal.getName();
		User user = userService.getUserByUsername(username);
		int quantityofProduct = quantity.orElse(1);
		CartSupport cartSupport = new CartSupport(cartService.getCartByUser(user));

		int action = cartSupport.addItem(product, quantityofProduct); // 1: update 2:insert

		if (action == 1 && principal != null) {
			
			cartService.updateItemsCartIncreaseQuatity(user, product, quantityofProduct);

		} else if (action == 2 && principal != null) {

			
			cartService.addNewItem(user, product, quantityofProduct);

		}

		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "Add cart successfully!", null));
	}

	@PostMapping("/update-cart")
	public ResponseEntity<?> updateCart(HttpSession session, @RequestParam long id, @RequestParam Optional<Integer> quantity,
			Principal principal) {
		Product product = null;
		try {
			product = productService.getProductById(id);
		} catch (NotFoundException e) {
			e.printStackTrace();

		}
		String username = principal.getName();
		User user = userService.getUserByUsername(username);
		int quantityofProduct = quantity.orElse(1);
		int maximumQuantity = product.getQuantity();
		if (quantityofProduct > maximumQuantity) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "The requested quantity exceeds the remaining quantity of this product!", null));
		}
		CartSupport cartSupport = new CartSupport(cartService.getCartByUser(user));
		cartSupport.updateItem(product, quantityofProduct);

		if (principal != null) {

			cartService.updateItemsCartChangeQuatity(user, product, quantityofProduct);
		}

		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "update cart successfully!", null));
	}

	@PostMapping("/remove-item")
	public ResponseEntity<?> removeItem(HttpSession session, @RequestParam long id, Principal principal) {
		Product product = null;
		try {
			product = productService.getProductById(id);
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		String username = principal.getName();
		User user = userService.getUserByUsername(username);
		
		int maximumQuantity = product.getQuantity();
		
		CartSupport cartSupport = new CartSupport(cartService.getCartByUser(user));
		
		if (principal != null) {
			
			cartService.deleteItems(user, product);
		}
		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "remove cart successfully!", null));
	}

	

	
	@GetMapping("")
	public ResponseEntity<List<Cart>> getCartByUserId(@RequestParam("userId") int userId) 
	{
		List<Cart> list = cartService.findByUserId(userId);
		return ResponseEntity.ok(list);
	}
	
	@PostMapping
	public ResponseEntity<?> postCart(@RequestBody CartRequest cartRequest) {
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
		Cart cart = cartService.findByUserIdAndProductId(cartRequest.getUserId(), cartRequest.getProductId());
		if (cart == null) {
			if (quantity > 0 ) {
				cart = new Cart(null, product, user, quantity);
			}
			else {
				return ResponseEntity
						.status(HttpStatus.BAD_REQUEST)
		                .body(new ResponseBody(400, "Quantity of cart item must be greater than 0!", null));
			}
		}
		else {
			int afterQuantity = cart.getQuantity() + quantity;
			afterQuantity = (afterQuantity <= 0) ? 0 : afterQuantity;
			if (afterQuantity > cart.getProduct().getQuantity()) {
				return ResponseEntity
						.status(HttpStatus.BAD_REQUEST)
		                .body(new ResponseBody(400, "The remaining quantity of this product is not enough!", null));
			}
			cart.setQuantity(afterQuantity);
		}
		cart = cartService.saveCart(cart);
		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "Add cart successfully!", cart));
	}
	
	@PutMapping
	public ResponseBody putCart(@RequestBody CartRequest cartRequest) {
		Product product = productService.findById(cartRequest.getProductId());
		if (product == null) {
			return new ResponseBody(400, "Product not found!", null);
		}
		User user = userService.findById(cartRequest.getUserId());
		if (user == null) {
			return new ResponseBody(400, "User not found!", null);
		}
		int quantity = cartRequest.getQuantity();
		Cart cart = cartService.findByUserIdAndProductId(cartRequest.getUserId(), cartRequest.getProductId());
		if (cart == null) {
			if (quantity > 0 ) {
				cart = new Cart(null, product, user, quantity);
			}
			else {
				return new ResponseBody(400, "Quantity of cart item must be greater than 0!", null);
			}
		}
		else {
			int productQuantity = cart.getProduct().getQuantity();
			if (quantity > productQuantity) {
				cart.setQuantity(productQuantity);
				cart = cartService.saveCart(cart);
				return new ResponseBody(201, "There are only " + productQuantity + " quantity remaining for this item!", cart);
			}			
		}
		cart.setQuantity(quantity);
		cart = cartService.saveCart(cart);
		return new ResponseBody(200, "Edit cart successfully!", cart);
	}
	
	// NOT WORKING!!!
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteCart(@PathVariable("id") long id) {
		Cart cart = cartService.findById(id);
		if (cart == null) {
			return ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
	                .body(new ResponseBody(400, "Cart item not found!", null));
		}
		cartService.deleteCart(id);		
		return ResponseEntity
				.status(HttpStatus.OK)
                .body(new ResponseBody(200, "Delete cart item successfully!", cart));
	}

}