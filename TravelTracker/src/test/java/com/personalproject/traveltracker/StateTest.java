package com.personalproject.traveltracker;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.personalproject.traveltracker.entities.State;

import jakarta.persistence.EntityManager;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class StateTest {

    @Autowired
    private EntityManager em;

    @Test
    void test_basic_shipping_address_attributes() {
        State state = em.find(State.class, 1);
        
        assertNotNull(state);
        assertEquals("Alabama", state.getName());
    }
}
