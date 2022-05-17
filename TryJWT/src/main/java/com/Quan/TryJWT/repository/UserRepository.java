package com.Quan.TryJWT.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	public Optional<User> findByUsername(String username);

	public Boolean existsByUsername(String username);

	public Boolean existsByEmail(String email);

	public List<User> findAllByStatus(boolean status, Pageable pageable);
	public List<User> findAllByStatus(boolean status);
	Boolean existsByPhone(String phone);
	
	@Query(value = "select u.* from users u where u.email = :email and u.username NOT LIKE :username ", nativeQuery = true)
	public List<User> verifyDuplicateEmail(@Param("email") String email, @Param("username") String username); 
	
	@Query(value = "select u.* from users u where u.phone = :phone and u.username NOT LIKE :username ", nativeQuery = true)
	public List<User> verifyDuplicatePhone(@Param("phone") String phone, @Param("username") String username); 
	

}
