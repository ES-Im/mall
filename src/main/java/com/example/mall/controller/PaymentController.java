package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaymentController {
	
	// Author : 김은서
	// /customer/addPayment 에서 결제 완료시 출력되는 화면
	@GetMapping("/customer/payResult")
	public String getPaymentResult() {
		return "customer/payResult";
	}
	
	// Author : 김은서
//	@PostMapping("/customer/addPayment") 
//	public String addPayment(@RequestParam Integer[] cartNo, @RequestParam String paymentMethod) {
//		
//	}
	
	
}
