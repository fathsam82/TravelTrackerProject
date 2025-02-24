package com.personalproject.traveltracker.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.personalproject.traveltracker.entities.State;
import com.personalproject.traveltracker.services.StateService;

@RestController
@CrossOrigin({"*", "http://localhost/" })
@RequestMapping("api")

public class StateController {
	
@Autowired
private StateService stateService;
	
	
@GetMapping("states")
public ResponseEntity<?> listAllStates() {
	try {
		List<State> states = stateService.listAllStates();
		
		if(states == null || states.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No states found");
		} else {
			return ResponseEntity.ok(states);
		}
	} catch (Exception e) {
		e.printStackTrace();
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occured while fetching states");
	}
	
}

}
