package com.Quan.TryJWT.serviceImpl;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.CartRepository;
import com.Quan.TryJWT.repository.ProductRepository;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.CartService;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public List<Cart> findByUserId(long userId) {
		return cartRepository.findByUserId(userId);
	}
	
	@Override
	public Cart findByUserIdAndProductId(long userId, long productId) {
		User user = userRepository.getById(userId);
		Product product = productRepository.getById(productId);
		return cartRepository.findByUserAndProduct(user, product);
	}

	@Override
	public Cart saveCart(Cart cart) {
		return cartRepository.save(cart);
	}


	@Override
	public Cart updateCart(Cart cart) {
		return cartRepository.save(cart);
	}

	@Override
	@Transactional
	public void deleteCart(long id) {
		cartRepository.deleteById(id);
	}

	@Override
	public Cart findById(long id) {
		Optional<Cart> cartObject = cartRepository.findById(id);
		if(!cartObject.isPresent()) {
			return null; 
		}
		return cartObject.get();
	}
}
