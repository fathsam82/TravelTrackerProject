package com.personalproject.traveltracker.dtos;

public class LoginResponseDTO {

	private int id;

	private String username;

	private String email;

	private Boolean enabled;

	private String role;

	LoginResponseDTO() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "LoginResponseDTO [id=" + id + ", username=" + username + ", email=" + email + ", enabled=" + enabled
				+ ", role=" + role + "]";
	}
	
	

}
