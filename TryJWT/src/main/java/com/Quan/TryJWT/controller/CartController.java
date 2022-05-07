package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.service.CartService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("")
	public ResponseEntity<List<Cart>> getCartByUserId(@RequestParam("userId") int userId) 
	{
		List<Cart> list = cartService.getAllByUserId(userId);
		return ResponseEntity.ok(list);
	}
}
