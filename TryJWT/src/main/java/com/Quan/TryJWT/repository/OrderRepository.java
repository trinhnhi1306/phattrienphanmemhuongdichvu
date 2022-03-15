package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{

}
