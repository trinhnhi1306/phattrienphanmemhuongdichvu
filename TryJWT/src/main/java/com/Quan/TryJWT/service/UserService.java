package com.Quan.TryJWT.service;

import com.Quan.TryJWT.model.User;

public interface UserService {
	Boolean existsByUsername(String username);
	public User findById(Long id);
	public User getUserByUsername(String username); 
}
