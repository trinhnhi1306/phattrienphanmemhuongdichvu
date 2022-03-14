package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Feedback;
import com.Quan.TryJWT.model.FeedbackId;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, FeedbackId>{

}