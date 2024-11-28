package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.PaymentService;
import com.example.mall.vo.Payment;

import lombok.extern.slf4j.Slf4j;

//Author : 김동현, 김은서
@Controller
@Slf4j
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	// Author : 김은서
	// /customer/addPayment 에서 결제 완료시 출력되는 화면
	@GetMapping("/customer/payResult")
	public String getPaymentResult() {
		return "customer/payResult";
	}
	
	// Author : 김은서
	// customer/addPayment에서 '결제하기' 클릭 시 사용
	@PostMapping("/customer/addPayment") 
	public String addPayment(Payment payment, Integer[] cartNo) {
		paymentService.addPayment(payment, cartNo);
		return "redirect:/customer/payResult";
	}
	
	// Author : 김은서
	// customer/getPaymentList에서 '결제이력' 리스팅 출력
	@GetMapping("/customer/getPaymentList")
	public String getPaymentList() {
		
		return "customer/getPaymentList";
	}
	
	
	
}
