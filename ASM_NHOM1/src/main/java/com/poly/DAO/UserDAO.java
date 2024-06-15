package com.poly.DAO;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entity.User;
import org.springframework.data.jpa.repository.Query;


public interface UserDAO extends JpaRepository<User, String> {
	 User findByNameUsersAndPasswordUsers(String name, String password);
	  Optional<User> findByEmail(String email);

	  @Query("select count(*)  from User")
	  Double getcount();



}
