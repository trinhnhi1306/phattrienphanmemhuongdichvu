package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Feedback;

public interface FeedbackService {
	public List<Feedback> getFeedbacksByProductId(int productId);
}
