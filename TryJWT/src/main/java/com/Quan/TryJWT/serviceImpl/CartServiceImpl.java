package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.CartRepository;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.CartService;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	UserRepository userRepository;


	@Override
	public List<Cart> getAllByUserId(long userId) {
		User user = userRepository.getById(userId);
		return cartRepository.findAllByUser(user);
	}


	@Override
	public Cart addCart(Cart cart) {
		return cartRepository.save(cart);
	}


	@Override
	public Cart updateCart(Cart cart) {
		return cartRepository.save(cart);
	}


	@Override
	public void deleteCart(Cart cart) {
		cartRepository.delete(cart);
	}
}
