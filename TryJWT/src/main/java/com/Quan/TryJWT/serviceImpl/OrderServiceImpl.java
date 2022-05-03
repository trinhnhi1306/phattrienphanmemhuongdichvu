package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderDetail;
import com.Quan.TryJWT.model.OrderStatus;
import com.Quan.TryJWT.repository.OrderDetailRepository;
import com.Quan.TryJWT.repository.OrderRepository;
import com.Quan.TryJWT.repository.OrderStatusRepository;
import com.Quan.TryJWT.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	OrderStatusRepository orderStatusRepository;
	
	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Override
	public Order findById(long id) {
		return orderRepository.getById(id);
	}

	@Override
	public List<Order> findByStatusId(long statusId) {
		OrderStatus orderStatus = orderStatusRepository.getById(statusId);
		return orderRepository.findAllByStatusId(orderStatus);
	}

	@Override
	public List<OrderDetail> findOrderDetailByOrderId(long orderId) {
		Order order = orderRepository.getById(orderId);
		List<OrderDetail> list = orderDetailRepository.findByOrder(order);
		return list;
	}

	@Override
	public void updateOrder(Order order, long statusId) {
		OrderStatus status = orderStatusRepository.getById(statusId);
		order.setStatusId(status);
		orderRepository.save(order);
	}
	
}
