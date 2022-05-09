package com.Quan.TryJWT.serviceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRespository;

	@Override
	public User findById(long userId) {
		Optional<User> user = userRespository.findById(userId);
		if(!user.isPresent()) {
			throw new NotFoundException("User not found by id"); 
		}
		return user.get();
	}
	
	@Override
	public Boolean existsByUsername(String username) {
		return userRespository.existsByUsername(username);
	}

	@Override
	public Boolean existsByEmail(String email) {
		return userRespository.existsByEmail(email);
	}

	@Override
	public Boolean existsByPhone(String phone) {
		return userRespository.existsByPhone(phone);
	}

	@Override
	public void updateProfile(User user) {
		userRespository.save(user);
	}

}
