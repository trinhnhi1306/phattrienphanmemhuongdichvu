package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Cart;

import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;

public interface CartService {
	public List<Cart> getCartByUser(User user);
	
	
	public void updateItemsCartIncreaseQuatity(User user,Product product, int quatity);
	public void updateItemsCartChangeQuatity(User user , Product product, int quatity);
	public void addNewItem(User user, Product product, int quatity);
	public void deleteItems(User user, Product product);
	public void deleteCartAfterBuy(User user);
	

	public List<Cart> getAllByUserId(long userId);
	public Cart addCart(Cart cart);
	public Cart updateCart(Cart cart);
	public void deleteCart(Cart cart);
}
