package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Order;
import com.Quan.TryJWT.model.OrderDetail;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.service.OrderService;
import com.Quan.TryJWT.service.ProductService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getOrderById(@PathVariable("id") long id) {
		Order order = null;
		try {
			order = orderService.findById(id);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Order is unavaiable");
		}
		return ResponseEntity.ok(order);
	}
	
	@GetMapping
	public ResponseEntity<?> getOrderByStatus(@RequestParam("statusId") long statusId) {
		List<Order> order = null;
		try {
			order = orderService.findByStatusId(statusId);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Order is unavaiable");
		}
		return ResponseEntity.ok(order);
	}
	
	@GetMapping(value = "/order-detail")
	public ResponseEntity<?> getOrderDetailById(@RequestParam("orderId") long orderId) {
		List<OrderDetail> list = null;
		try {
			list = orderService.findOrderDetailByOrderId(orderId);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Order is unavaiable");
		}
		return ResponseEntity.ok(list);
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putOrder(@PathVariable("id") long id, @RequestParam("statusId") long statusId) {
		Order order = null;
		try {
			order = orderService.findById(id);
			orderService.updateOrder(order, statusId);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Order is unavaiable");
		}
		return ResponseEntity.ok("Update order successfully!");
	}
	
}
