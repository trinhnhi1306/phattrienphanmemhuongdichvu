package com.Quan.TryJWT.serviceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRepository;

	@Override
	public Boolean existsByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findById(Long id) {
		// TODO Auto-generated method stub
		return userRepository.getById(id);
	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Optional<User> option = userRepository.findByUsername(username) ;
		if(option.isEmpty()) {
			 return null;
		}
		return  option.get() ;
		
	}

}
