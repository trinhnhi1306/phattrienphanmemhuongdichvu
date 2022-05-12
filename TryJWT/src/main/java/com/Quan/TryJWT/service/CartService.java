package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Cart;

public interface CartService {
	public Cart findById(long id);
	public List<Cart> findByUserId(long userId);
	public Cart findByUserIdAndProductId(long userId, long productId);
	
	public Cart saveCart(Cart cart);
	public Cart updateCart(Cart cart);
	public void deleteCart(long id);
}
