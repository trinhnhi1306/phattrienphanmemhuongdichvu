package com.Quan.TryJWT.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.ERole;
import com.Quan.TryJWT.model.Role;

import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	public User findById(long userId) {
		Optional<User> user = userRepository.findById(userId);
		if (!user.isPresent()) {
			throw new NotFoundException("User not found by id");
		}
		return user.get();
	}

	@Override
	public Boolean existsByUsername(String username) {
		return userRepository.existsByUsername(username);
	}

	@Override
	public Boolean existsByEmail(String email) {
		return userRepository.existsByEmail(email);
	}

	@Override
	public Boolean existsByPhone(String phone) {
		return userRepository.existsByPhone(phone);
	}

	@Override
	public void updateProfile(User user) {
		userRepository.save(user);
	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Optional<User> option = userRepository.findByUsername(username);
		if (!option.isPresent()) {
			return null;
		}
		return option.get();

	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return (int) userRepository.count();
	}

	@Override
	public List<User> getAllByStatus(boolean status, int pageNo, int pageSize, String sortField, String sortDirection) {
		// TODO Auto-generated method stub
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending()
				: Sort.by(sortField).descending();
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
		List<User> temp = userRepository.findAllByStatus(status, pageable);
		List<User> users = new ArrayList<User>();
		for (User user : temp) {
			Set<Role> roles = user.getRoles();
			for (Role role : roles) {
				if (role.getName() == ERole.ROLE_USER) {
					users.add(user);
				}
			}
		}
		return users;
	}
}
