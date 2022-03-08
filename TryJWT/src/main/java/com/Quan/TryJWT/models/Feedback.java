package com.Quan.TryJWT.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
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
@Table(name = "feedback")
@Getter
@Setter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Feedback {

	@EmbeddedId
	private FeedbackId feedbackId; 
	
	@ManyToOne
	@JoinColumn(name = "product_id",insertable = false, updatable = false)
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "user_id",insertable = false, updatable = false)
	private User user;
	
	private Date date;
	
	private String comment;
	
	private int vote;
}
