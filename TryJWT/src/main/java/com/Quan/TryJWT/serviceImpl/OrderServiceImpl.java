package com.Quan.TryJWT.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderDetail;
import com.Quan.TryJWT.model.OrderStatus;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.OrderDetailRepository;
import com.Quan.TryJWT.repository.OrderRepository;
import com.Quan.TryJWT.repository.OrderStatusRepository;
import com.Quan.TryJWT.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	OrderStatusRepository orderStatusRepository;
	
	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Override
	public Order findById(long id) {
		Optional<Order> order = orderRepository.findById(id);
		if(!order.isPresent()) {
			return null;
		}
		return order.get();
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
	public Order updateOrder(Order order, long statusId) {
		OrderStatus status = orderStatusRepository.getById(statusId);
		order.setStatusId(status);
		return orderRepository.save(order);
	}

	@Override
	public List<Order> findByUserAndStatusOrderByDateDesc(User user, OrderStatus orderStatus) {
		return orderRepository.findByUserAndStatusIdOrderByDateDesc(user, orderStatus);
	}

	@Override
	public List<Order> getAllByUser(User user) {
		// TODO Auto-generated method stub
		return orderRepository.findByUser(user);
	}
}
