package com.Quan.TryJWT.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
@Embeddable
public class FeedbackId implements Serializable{
	@Column(name="user_id")
	private long userId;
	
	@Column(name="id_product")
	private long idBook;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getIdBook() {
		return idBook;
	}

	public void setIdBook(long idBook) {
		this.idBook = idBook;
	}

	public FeedbackId(long userId, long idBook) {
		super();
		this.userId = userId;
		this.idBook = idBook;
	}

	public FeedbackId() {
		super();
	} 
	
	
}
