package com.personalproject.traveltracker.services;

import com.personalproject.traveltracker.entities.User;

public interface AuthService {

	User register(User user);

	User getUserbyUsername(String username);

	User authenticateUser(String username, String password);

}
