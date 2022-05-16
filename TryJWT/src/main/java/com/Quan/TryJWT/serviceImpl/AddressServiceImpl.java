package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.Quan.TryJWT.model.Address;
import com.Quan.TryJWT.model.User;
import com.Quan.TryJWT.repository.AddressRepository;
import com.Quan.TryJWT.repository.DistrictRepository;
import com.Quan.TryJWT.repository.ProvinceRepository;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.repository.WardRepository;
import com.Quan.TryJWT.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private ProvinceRepository provinceRepository;
	@Autowired
	private DistrictRepository districtRepository;
	@Autowired
	private WardRepository wardRepository;
	@Autowired
	AddressRepository addressRepository;

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<Address> findAllByUserId(long userId) {
		User user = userRepository.getById(userId);
		if (user == null) {
			return null;
		}
		return addressRepository.findByUser(user);
	}

	@Override
	public Address addAddress(Address address) {
		return addressRepository.save(address);
	}

	@Override
	public Address findById(long id) {
		return addressRepository.findById(id).get();
	}

	@Override
	public void deleteAddress(Address address) {
		addressRepository.delete(address);
	}

	@Override
	public void deleteById(Long id) {
		try {
			boolean isFound = addressRepository.existsById(id);
			if(isFound) {
				addressRepository.deleteById(id);
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
