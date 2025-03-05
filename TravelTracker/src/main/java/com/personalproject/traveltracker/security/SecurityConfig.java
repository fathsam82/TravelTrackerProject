package com.personalproject.traveltracker.security;

import static org.springframework.security.config.Customizer.withDefaults;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	@Bean
	public SecurityFilterChain createFilterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable())
		.authorizeHttpRequests(
		auth -> auth.requestMatchers("/login","/register").permitAll().anyRequest().authenticated())
		.httpBasic(withDefaults());
		return http.build();
	}

	@Autowired
	public void configure(AuthenticationManagerBuilder auth, DataSource dataSource, PasswordEncoder passwordEncoder)
			throws Exception {
		String userQuery = "SELECT username, password, enabled FROM user WHERE username=?";
		String authQuery = "SELECT username, role FROM user WHERE username=?";

		auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(userQuery)
				.authoritiesByUsernameQuery(authQuery).passwordEncoder(passwordEncoder);
	}
}
