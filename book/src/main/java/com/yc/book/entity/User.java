package com.yc.book.entity;

public class User {
	private String id;
	private String username;
	private String userpwd;
	private String status;
	
	public User() {
	}

	public User(String username, String userpwd) {
		this.username = username;
		this.userpwd = userpwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userpwd=" + userpwd + ", status=" + status + "]";
	}

	
}
