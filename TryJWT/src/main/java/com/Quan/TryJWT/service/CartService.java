package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Cart;

public interface CartService {
	public List<Cart> getAllByUserId(long userId);
	public Cart addCart(Cart cart);
	public Cart updateCart(Cart cart);
	public void deleteCart(Cart cart);
}
