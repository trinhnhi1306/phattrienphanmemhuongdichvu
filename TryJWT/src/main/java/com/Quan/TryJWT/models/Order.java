package com.Quan.TryJWT.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "orders")
@Getter
@Setter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Order {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
	private long orderId;
	
	private Date date;
	
	@Column(name = "total_price")
	private float totalPrice;
	
	@ManyToOne
	 @JoinColumn(name = "status_id")
	private OrderStatus statusId;
	
	@ManyToOne
	 @JoinColumn(name = "user_id")
	 private User user;
}
