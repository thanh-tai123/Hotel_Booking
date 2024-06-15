package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.UserDAO;
import com.poly.Entity.User;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class DangNhap {
	 @Autowired
	    private UserDAO userDao;
	 @Autowired
	 HttpSession session;
//	    @GetMapping("/user/login")
//	    public String showLoginForm(Model model) {
//	        model.addAttribute("u", new User());
//	        return "account/dangnhap";
//	    }

//	    @PostMapping("/user/login")
//	    public String login(@Valid @ModelAttribute("u") User user, BindingResult result, Model model) {
//	      
//	        // Query the database to find the user by username and password
//	        User foundUser = userDao.findByNameUsersAndPasswordUsers(user.getNameUsers(), user.getPasswordUsers());
//	        if (foundUser != null) {
//	            // User authenticated, redirect to home page or dashboard
//	        	session.setAttribute("username", foundUser.getNameUsers());
//	        	 session.setAttribute("roleE", foundUser.isRoleE());
//	            return "redirect:/room/index";
//	        } else {
//	            // User authentication failed, show error message
//	            model.addAttribute("error", "Invalid username or password.");
//	            return "account/dangnhap";
//	        }
//	    }
}
