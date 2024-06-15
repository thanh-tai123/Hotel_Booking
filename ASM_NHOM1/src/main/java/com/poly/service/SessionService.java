package com.poly.service;

public interface SessionService {
	
	    public <T> T get(String key); // Get value by key
	    public void set(String key, Object value); // Set key and value
	    public void remove(String key); // Remove key
	

	
}	
