package com.Quan.TryJWT.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.CartSupport;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;
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
	@ResponseBody
	public String addToCart(HttpSession session, @RequestParam long id, @RequestParam Optional<Integer> quantity,
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

		return "true";
	}

	@PostMapping("/update-cart")
	@ResponseBody
	public String updateCart(HttpSession session, @RequestParam long id, @RequestParam Optional<Integer> quantity,
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
		int maximumQuantity = product.getQuantity();
		if (quantityofProduct > maximumQuantity) {
			return "1"; // vượt quá số lượng hiện có
		}
		CartSupport cartSupport = new CartSupport(cartService.getCartByUser(user));
		cartSupport.updateItem(product, quantityofProduct);

		if (principal != null) {

			cartService.updateItemsCartChangeQuatity(user, product, quantityofProduct);
		}

		return "";
	}

	@PostMapping("/remove-item")
	@ResponseBody
	public String removeItem(HttpSession session, @RequestParam long id, Principal principal) {
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
		return  "";
	}

	
}
