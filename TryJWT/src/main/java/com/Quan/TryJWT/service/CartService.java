package com.Quan.TryJWT.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.Product;


public interface CartService {
	public List<Cart> getAllByUserId(long userId);
}
