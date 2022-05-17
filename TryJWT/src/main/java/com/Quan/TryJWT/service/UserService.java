package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.User;

public interface UserService {
	public Boolean existsByUsername(String username);

	public int getCount();

	public List<User> getAllByStatus(boolean status, int pageNo, int pageSize, String sortField, String sortDirection);

	public User findById(long idUser);

	public User getUserByUsername(String username);

	Boolean existsByEmail(String email);

	Boolean existsByPhone(String phone);

	void updateProfile(User user);
	
	public List<User> getAllUserByStatus(boolean status); 
	public void addUser(User user);
	public void saveUser(User user);
	public boolean checkExistEmailInfo(String email, String username);
	public boolean checkExistPhoneInfo(String phone, String username); 
	public int deleteUser(User user);
	
}
