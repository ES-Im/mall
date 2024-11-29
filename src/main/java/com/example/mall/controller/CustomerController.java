package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
// Author : 김은사
@Slf4j
@Controller
public class CustomerController {

	@GetMapping("/customer/getCustomerOne")
	public String getCustomerOne(HttpSession session) {
		return "customer/getCustomerOne";
	}
}
