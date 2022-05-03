package com.Quan.TryJWT.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderStatus;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	public List<Order> findAllByStatusId(OrderStatus status);
}
