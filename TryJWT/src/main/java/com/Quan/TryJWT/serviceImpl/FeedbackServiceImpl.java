package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.Feedback;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.repository.FeedbackRepository;
import com.Quan.TryJWT.repository.ProductRepository;
import com.Quan.TryJWT.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	FeedbackRepository feedbackRepository;

	@Override
	public List<Feedback> getFeedbacksByProductId(int productId) {
		Product product = productRepository.getById((long)productId);
		return feedbackRepository.findAllByProduct(product);
	}

}
