package com.personalproject.traveltracker.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.personalproject.traveltracker.entities.User;
import com.personalproject.traveltracker.repositories.UserRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private AuthenticationManager authenticationManager;

	@Override
	public User register(User user) {
		user.setEnabled(true);
		user.setRole("standard");
		String encrypted = encoder.encode(user.getPassword());
		user.setPassword(encrypted);
		User savedUser = userRepo.saveAndFlush(user);

		return savedUser;
	}

	@Override
	public User getUserbyUsername(String username) {
		Optional<User> userOpt = userRepo.findByUsername(username);
		return userOpt.orElseThrow(() -> new EntityNotFoundException("User not found for " + username));

	}
	
	@Override
	public User authenticateUser(String username, String password) {
        UsernamePasswordAuthenticationToken authToken =
                new UsernamePasswordAuthenticationToken(username, password);

      //  Authentication authentication = 
        		authenticationManager.authenticate(authToken);

        return getUserbyUsername(username);
    }

}
