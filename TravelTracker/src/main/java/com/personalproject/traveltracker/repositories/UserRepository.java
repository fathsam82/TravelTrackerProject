package com.personalproject.traveltracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.personalproject.traveltracker.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
