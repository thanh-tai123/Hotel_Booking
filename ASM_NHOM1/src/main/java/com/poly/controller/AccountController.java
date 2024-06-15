package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.DAO.UserDAO;
import com.poly.Entity.User;

import com.poly.dto.RegisterDto;

import com.poly.service.SessionService;
import com.poly.service.UserService;

import jakarta.servlet.http.HttpSession;






@Controller
public class AccountController {
	@Autowired
	UserDAO dao;
	
	 @Autowired
	    private UserService userService;
	@Autowired
	SessionService session;
	  @RequestMapping("/forgot-password")
	    public String showForgotForm() {
	        return "forgot-password";
	    }
	
	    @RequestMapping("/set-password")
	    public String showSetPasswordForm() {
	        return "set-password";
	    }
	@GetMapping("/user/login")
	public String login() {
		return "account/sign-in";
	}



	@GetMapping("/admin/index")
	public String adminInex() {
		return "admin/index";
	}
	@GetMapping("/admin/loginIndex") // la vao trang them, xoa, sua
	public String loginIndex() {
		return "admin/loginIndex";
	}

	@GetMapping("/admin/themxoasua") // la vao trang them, xoa, sua
	public String loginIndex1() {
		return "admin/themxoasua";
	}
//	@GetMapping("/user/logout")
//    public String accountLogout(HttpSession session) {
//        session.invalidate(); // Xóa session hoàn toàn
//        return "redirect:/user/login"; // Chuyển hướng người dùng đến trang đăng nhập
//    }
	 @GetMapping("/user/logout")
	    public String accountLogout(HttpSession session) {
	        session.removeAttribute("user"); // Xóa thông tin người dùng khỏi session
	        return "redirect:/user/login"; // Chuyển hướng người dùng đến trang đăng nhập
	    }
	 @PostMapping("/user/login")
	 public String login(@RequestParam String email, @RequestParam String password, Model model) {
	     String result = userService.login(email, password);
	     if (result.equals("Login successful")) {
	         // Retrieve and store the user object in the session
	         Optional<User> accountOptional = dao.findByEmail(email);
	         if (accountOptional.isPresent()) {
	             User account = accountOptional.get();
	             session.set("user", account);  // Storing user object in the session

	             String uri = (String) session.get("security-uri");
	             if (uri != null) {
	                 return "redirect:" + uri;
	             } else {
	                 if (account.isRoleE()) {  // Checking the role with a simple method call
	                     return "redirect:/admin";
	                 } else {
	                     return "redirect:/room/index";
	                 }
	             }
	         } else {
	             model.addAttribute("error", result);
	             return "account/dangnhap";
	         }
	     } else {
	         model.addAttribute("error", result);
	         return "account/dangnhap";
	     }
	 }

	
	 @GetMapping("/register")
	    public String showRegisterForm(@ModelAttribute RegisterDto registerDto

	 ) {
	        return "account/dangky";
	    }

	    @PostMapping("/register")
	    public String register(@ModelAttribute RegisterDto registerDto) {
	        userService.register(registerDto);
	        return "redirect:/user/login"; // Sau khi đăng ký, chuyển hướng người dùng đến trang đăng nhập
	    }

	    @GetMapping("/verify-account")
	    public String showVerifyAccountForm() {
	        return "verifyAccount";
	    }

	    @PostMapping("/verify-account")
	    public ResponseEntity<String> verifyAccount(@RequestParam String email, @RequestParam String otp) {
	        String result = userService.verifyAccount(email, otp);
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    }

	    @GetMapping("/regenerate-otp")
	    public String showRegenerateOtpForm() {
	        return "regenerateOtp";
	    }

	    @PostMapping("/regenerate-otp")
	    public ResponseEntity<String> regenerateOtp(@RequestParam String email) {
	        String result = userService.regenerateOtp(email);
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    }
	    @PostMapping("/forgot-password")
	    public ResponseEntity<String> forgotPassword(@RequestParam String email){
	    	return new ResponseEntity<>(userService.forgotPassword(email),HttpStatus.OK);
	    }
	    @PostMapping("/set-password")
	    public ResponseEntity<String> setPassword(@RequestParam String email, @RequestParam String newPassword){
	    	return new ResponseEntity<>(userService.setPassword(email, newPassword),HttpStatus.OK);
	    }
}