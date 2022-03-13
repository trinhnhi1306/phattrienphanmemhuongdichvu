package com.Quan.TryJWT.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.models.User;
import com.Quan.TryJWT.payload.response.MessageResponse;
import com.Quan.TryJWT.repository.UserRepository;
import com.Quan.TryJWT.security.UpdatePasswordRequest;
import com.Quan.TryJWT.service.UserService;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/admin")
public class ManageUserController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
    PasswordEncoder encoder;
	
	@PutMapping("/update-new-password")
    @PreAuthorize("hasRole('MODERATOR')")
    public ResponseEntity<?> updatePassword(@Valid @RequestBody UpdatePasswordRequest request){
        if(request.getPassword().trim().length()<6) return ResponseEntity.badRequest().body("The length of the password must be least at 6 charaters");
        if (!userRepository.existsByUsername(request.getUsername())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Username is not exist!"));
        }
        User user = userRepository.findByUsername(request.getUsername()).get();
        user.setPassword(encoder.encode(request.getPassword().trim()));
        userRepository.save(user);
        return ResponseEntity.ok().body("Update password successfully!");
    }
}
