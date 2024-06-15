package com.poly.service;


import com.poly.DAO.UserDAO;
import com.poly.Entity.User;
import com.poly.dto.LoginDto;
import com.poly.dto.RegisterDto;

import com.poly.util.EmailUtil;
import com.poly.util.OtpUtil;

import jakarta.mail.MessagingException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

  @Autowired
  private OtpUtil otpUtil;
  @Autowired
  private EmailUtil emailUtil;
  @Autowired
  private UserDAO AccountRepository;

  public String register(RegisterDto registerDto) {
    String otp = otpUtil.generateOtp();
    try {
      emailUtil.sendOtpEmail(registerDto.getEmail(), otp);
    } catch (MessagingException e) {
      throw new RuntimeException("Unable to send otp please try again");
    }
    User Account = new User();
    Account.setNameUsers(registerDto.getName());
    Account.setEmail(registerDto.getEmail());
    Account.setPasswordUsers(registerDto.getPassword());
    Account.setOtp(otp);
    Account.setOtpGeneratedTime(LocalDateTime.now());
    AccountRepository.save(Account);
    return "Account registration successful";
  }

  public String verifyAccount(String email, String otp) {
    User Account = AccountRepository.findByEmail(email)
        .orElseThrow(() -> new RuntimeException("Account not found with this email: " + email));
    if (Account.getOtp().equals(otp) && Duration.between(Account.getOtpGeneratedTime(),
        LocalDateTime.now()).getSeconds() < (1 * 60)) {
      Account.setActivated(true);
      AccountRepository.save(Account);
      return "OTP verified you can <a href=\"/user/login\">login</a>";
    }
    return "Please regenerate otp and try again" ;
  }

  public String regenerateOtp(String email) {
    User Account = AccountRepository.findByEmail(email)
        .orElseThrow(() -> new RuntimeException("Account not found with this email: " + email));
    String otp = otpUtil.generateOtp();
    try {
      emailUtil.sendOtpEmail(email, otp);
    } catch (MessagingException e) {
      throw new RuntimeException("Unable to send otp please try again");
    }
    Account.setOtp(otp);
    Account.setOtpGeneratedTime(LocalDateTime.now());
    AccountRepository.save(Account);
    return "Email sent... please verify account within 1 minute <a href=\"/user/login\">login</a>";
  }

  public String login(String email, String password) {
	    Optional<User> AccountOptional = AccountRepository.findByEmail(email);
	    if (AccountOptional.isPresent()) {
	        User Account = AccountOptional.get();
	        if (password.equals(Account.getPasswordUsers())) {
	            if (Account.getActivated()) {
	                return "Login successful"; // Trạng thái đăng nhập thành công
	            } else {
	            	 return "redirect:/user/login"; // Tài khoản chưa được xác minh
	            }
	        } else {
	            return "Password incorrect"; // Sai mật khẩu
	        }
	    } else {
	        return "Account not found"; // Không tìm thấy người dùng
	    }
	}
public String forgotPassword(String email) {
	User Account = AccountRepository.findByEmail(email)
			.orElseThrow(
					()-> new RuntimeException("Account not found with this email: "+email));
			try {
				emailUtil.sendSetPasswordEmail(email);
			} catch (Exception e) {
			throw new RuntimeException("Unable to send password");
			}
			return "Please check your email to set new password" + "return <a href=\"/user/login\">login</a>";
}
public String setPassword(String email, String newPassword) {
	User Account = AccountRepository.findByEmail(email)
			.orElseThrow(
					()-> new RuntimeException("Account not found with this email: "+email));
			Account.setPasswordUsers(newPassword);
			AccountRepository.save(Account);
			return "New Passoword is successfully" + "return <a href=\"/user/login\">login</a>";
}
}
