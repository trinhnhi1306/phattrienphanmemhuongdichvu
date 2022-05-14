package com.Quan.TryJWT.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;

import com.Quan.TryJWT.dto.UserOutput;
import com.Quan.TryJWT.model.User;

import com.Quan.TryJWT.payload.request.UpdatePasswordRequest;
import com.Quan.TryJWT.payload.request.UpdateProfileRequest;
import com.Quan.TryJWT.repository.UserRepository;

import com.Quan.TryJWT.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	PasswordEncoder encoder;

	@RequestMapping(value = "image/{imageName}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<?> getImage(@PathVariable("imageName") String imageName) throws IOException {
		try {
			ClassPathResource imgFile = new ClassPathResource("images/users/" + imageName);
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG)
					.body(new InputStreamResource(imgFile.getInputStream()));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Image not found!");
		}
	}

	@GetMapping
	public ResponseEntity<UserOutput> findUsers(
			@RequestParam(value = "pageNo", required = false) Optional<Integer> uPageNo,
			@RequestParam(value = "pageSize", required = false) Optional<Integer> uPageSize,
			@RequestParam(value = "sortField", required = false) Optional<String> uSortField,
			@RequestParam(value = "sortDirection", required = false) Optional<String> uSortDir) {
		int pageNo = 1;
		int pageSize = 10;
		String sortField = "id";
		String sortDirection = "ASC";
		if (uPageNo.isPresent()) {
			pageNo = uPageNo.get();
		}
		if (uPageSize.isPresent()) {
			pageSize = uPageSize.get();
		}
		if (uSortField.isPresent()) {
			sortField = uSortField.get();
		}
		if (uSortDir.isPresent()) {
			sortDirection = uSortDir.get();
		}

		int totalPage;
		List<User> users = new ArrayList<User>();

		totalPage = (int) Math.ceil((double) (userService.getCount()) / pageSize);
		users = userService.getAllByStatus(true, pageNo, pageSize, sortField, sortDirection);

		UserOutput output = new UserOutput();
		output.setPage(pageNo);
		output.setTotalPage(totalPage);
		output.setListResult(users);
		return ResponseEntity.ok(output);
	}

	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getUserById(@PathVariable("id") long id) {
		User user = null;
		try {
			user = userService.findById(id);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("User is unavaiable");
		}
		return ResponseEntity.ok(user);
	}

	@PutMapping(value = "edit-profile")
	public ResponseEntity<?> editProfile(@Valid @RequestBody UpdateProfileRequest request,
			BindingResult bindingResult) {
		try {
			User user = userService.findById(request.getId());
			String username = request.getUsername();
			if (!username.equals(user.getUsername()) && userService.existsByUsername(username)) {
				return ResponseEntity.badRequest().body("Error: Username is already taken!");
			}
			String email = request.getEmail();
			if (!email.equals(user.getEmail()) && userService.existsByEmail(email)) {
				return ResponseEntity.badRequest().body("Error: Email is already taken!");
			}
			String phone = request.getPhone();
			if (!phone.equals(user.getPhone()) && userService.existsByPhone(phone)) {
				return ResponseEntity.badRequest().body("Error: Phone is already taken!");
			}
			if (bindingResult.hasErrors()) {
				return ResponseEntity.badRequest()
						.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
			}
			String firstName = request.getFirstName();
			String lastName = request.getLastName();
			user.setUsername(username);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmail(email);
			user.setPhone(phone);

			userService.updateProfile(user);
			return ResponseEntity.ok("Update user successfully!");
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("User not found!");
		}
	}

	@PutMapping("change-password")
	public ResponseEntity<?> updatePassword(@Valid @RequestBody UpdatePasswordRequest request,
			BindingResult bindingResult) {
		User user = userRepository.getById(request.getId());
		if (user == null) {
			return ResponseEntity.badRequest().body("Error: User not found!");
		}
		if (!encoder.matches(request.getOldPassword(), user.getPassword())) {
			System.out.println(encoder.encode(request.getOldPassword()));
			System.out.println(encoder.encode(user.getPassword()));
			return ResponseEntity.badRequest().body("Error: Old password is incorrect!");
		}
		if (bindingResult.hasErrors()) {
			return ResponseEntity.badRequest()
					.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
		}
		if (request.getNewPassword().trim().length() < 6) {
			return ResponseEntity.badRequest().body("The length of the password must be least at 6 charaters");
		}

		user.setPassword(encoder.encode(request.getNewPassword().trim()));
		userRepository.save(user);
		return ResponseEntity.ok().body("Update password successfully!");
	}
}
