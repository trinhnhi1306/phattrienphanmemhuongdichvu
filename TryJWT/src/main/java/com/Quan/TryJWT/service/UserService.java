package com.Quan.TryJWT.service;

import com.Quan.TryJWT.model.User;

public interface UserService {
	User findById(long userId);
	Boolean existsByUsername(String username);

	public User findById(Long id);
	public User getUserByUsername(String username); 

	Boolean existsByEmail(String email);
	Boolean existsByPhone(String phone);
	void updateProfile(User user);

}
