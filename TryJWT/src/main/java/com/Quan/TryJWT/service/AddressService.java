package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Address;

public interface AddressService {
	public List<Address> findAllByUserId(long userId);

	public Address addAddress(Address address);

	public Address findById(long id);

	public void deleteAddress(Address address);
	
	public void deleteById(Long id);
}