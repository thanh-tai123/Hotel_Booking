package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Service {
@RequestMapping("/service")
public String service() {
	return "service";
}
}
