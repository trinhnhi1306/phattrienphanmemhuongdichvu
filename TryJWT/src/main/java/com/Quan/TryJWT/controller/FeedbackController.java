package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.Feedback;
import com.Quan.TryJWT.service.FeedbackService;

@RestController
@RequestMapping("/api/feedbacks")
public class FeedbackController {
	
	@Autowired
	FeedbackService feedbackService;
	
	@GetMapping("")
	public ResponseEntity<List<Feedback>> getFeedbacksByProductId(@RequestParam("productId") int productId) 
	{
		List<Feedback> list = feedbackService.getFeedbacksByProductId(productId);
		return ResponseEntity.ok(list);
	}
}
