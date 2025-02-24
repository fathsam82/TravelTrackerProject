package com.personalproject.traveltracker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.personalproject.traveltracker.entities.State;
import com.personalproject.traveltracker.repositories.StateRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class StateServiceImpl implements StateService {
	
	@Autowired
	private StateRepository stateRepo;

	@Override
	public List<State> listAllStates() {
		List<State> states = stateRepo.findAll();
		if(states.isEmpty()) {
			throw new EntityNotFoundException("States not found");
		}
		return states;
	}

}
