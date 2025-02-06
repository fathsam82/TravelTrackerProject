package com.personalproject.traveltracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.personalproject.traveltracker.entities.State;

public interface StateRepository extends JpaRepository<State, Integer> {

}
