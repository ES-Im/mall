package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.mall.service.CustomerService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
// Author : 김은서
@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/customer/getCustomerOne")
	public String getCustomerOne(HttpSession session) {
		return "customer/getCustomerOne";
	}
	
	//Author : 김은서
	@GetMapping("/customer/modifyCustomerPw")
	public String modifyCustomerPw() {
		return "customer/modifyCustomerPw"; 
	}
	
	//Author : 김은서	
	@PostMapping("/customer/modifyCustomerPw")
	public String modifyCustomerPw(Model model, HttpSession session, String prePw, String newPw) {
		String alertFailedMsg = null;
		
		Integer checkSuccess = customerService.modifyCustomerPw((String)session.getAttribute("loginCustomer"), prePw, newPw);
		
		if(checkSuccess != 1) {
			alertFailedMsg = "비밀번호 변경에 실패하였습니다.";
			model.addAttribute(alertFailedMsg);
			return "customer/modifyCustomerPw";
		}
		
		model.addAttribute(alertFailedMsg);
		return "redirect:/customer/getCustomerOne";
	}
}
