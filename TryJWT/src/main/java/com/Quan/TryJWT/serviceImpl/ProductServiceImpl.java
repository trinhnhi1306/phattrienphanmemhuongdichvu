package com.Quan.TryJWT.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.models.Product;
import com.Quan.TryJWT.repository.ProductRepository;
import com.Quan.TryJWT.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public Page<Product> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) 
				? Sort.by(sortField).ascending() : Sort.by(sortField).descending() ;
		
		Pageable pageable = PageRequest.of(pageNo -1, pageSize,sort);
		return productRepository.findAll(pageable);
	}

}
