package com.personalproject.traveltracker.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.personalproject.traveltracker.dtos.LoginRequestDTO;
import com.personalproject.traveltracker.entities.User;
import com.personalproject.traveltracker.services.AuthService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin({ "*", "http://localhost/" })
public class AuthController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private AuthService authService;

	@PostMapping("register")
	public User register(@RequestBody User user, HttpServletResponse res) {
		if (user == null) {
			res.setStatus(400);
			return null;
		}
		user = authService.register(user);
		return user;

	}

	@PostMapping("authenticate")
	public ResponseEntity<?> authenticate(@RequestBody LoginRequestDTO loginRequest) {
		try {
			UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
					loginRequest.getUsername(), loginRequest.getPassword());
			Authentication authentication = authenticationManager.authenticate(authToken);
			User authenticatedUser = authService.getUserbyUsername(loginRequest.getUsername());
			return ResponseEntity.ok(authenticatedUser);
		} catch (AuthenticationException e) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
		}

	}

}
