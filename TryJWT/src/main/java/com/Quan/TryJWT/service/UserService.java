package com.Quan.TryJWT.service;

import com.Quan.TryJWT.model.User;

public interface UserService {
	User findById(long userId);
	Boolean existsByUsername(String username);
	Boolean existsByEmail(String email);
	Boolean existsByPhone(String phone);
	void updateProfile(User user);
}
