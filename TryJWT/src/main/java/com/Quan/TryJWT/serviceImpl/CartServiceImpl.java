package com.Quan.TryJWT.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.CartRepository;
import com.Quan.TryJWT.repository.CategoryRepository;
import com.Quan.TryJWT.repository.ProductRepository;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.CartService;
import com.Quan.TryJWT.service.ProductService;


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
}
