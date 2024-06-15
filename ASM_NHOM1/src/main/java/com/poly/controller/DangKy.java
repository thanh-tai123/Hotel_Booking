package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poly.DAO.UserDAO;
import com.poly.Entity.User;

@Controller
public class DangKy {
	@Autowired
	UserDAO userDao;
	@RequestMapping("/user/dangky")
	public String dangky(Model model) {
		User u = new User();
		model.addAttribute("item", u);
		return "account/dangky";
	}
	@RequestMapping("/user/create")
	public String create(User u) {
		userDao.save(u);
		return "redirect:/room/index";
	}
}
