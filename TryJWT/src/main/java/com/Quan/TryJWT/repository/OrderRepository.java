package com.Quan.TryJWT.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderStatus;
import com.Quan.TryJWT.model.User;


@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
	public List<Order> findAllByStatusId(OrderStatus status);

	public List<Order> findByUser(User user);

	public long countByDate(Date date);
	public long countByStatusId(OrderStatus statusId);
	
	public List<Order> findByUserAndStatusIdOrderByDateDesc(User user, OrderStatus orderStatus);

}
