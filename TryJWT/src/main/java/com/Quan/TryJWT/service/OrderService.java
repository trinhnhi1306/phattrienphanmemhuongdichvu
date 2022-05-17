package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderDetail;

public interface OrderService {

	public Order findById(long id);
	public List<Order> findByStatusId(long statusId);
	public List<OrderDetail> findOrderDetailByOrderId(long statusId);
	public Order updateOrder(Order order, long statusId);
}
