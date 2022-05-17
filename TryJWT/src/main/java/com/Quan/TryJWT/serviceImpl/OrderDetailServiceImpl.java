package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.OrderDetail;
import com.Quan.TryJWT.repository.OrderDetailRepository;
import com.Quan.TryJWT.repository.OrderRepository;
import com.Quan.TryJWT.repository.OrderStatusRepository;
import com.Quan.TryJWT.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	OrderStatusRepository orderStatusRepository;
	
	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Override
	public List<OrderDetail> saveListOrderDetail(List<OrderDetail> orderDetails) {
		return orderDetailRepository.saveAll(orderDetails);
	}
	
}
