package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Quan.TryJWT.models.Feedback;
import com.Quan.TryJWT.models.FeedbackId;


public interface FeedbackRepository extends JpaRepository<Feedback, FeedbackId>{

}