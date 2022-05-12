package com.Quan.TryJWT.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Cart;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.model.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
	public List<Cart> findByUser(User user);
	
	public List<Cart> findAllByProduct(Product product);
	public Cart findByUserAndProduct(User user, Product product);
	
	public void deleteByUser(User user);

}
