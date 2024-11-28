package com.example.mall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.PaymentService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

//Author : 김동현, 김은서
@Controller
@Slf4j
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	// Author : 김은서
	// 고객용 : /customer/addPayment 에서 결제 완료시 출력되는 화면
	@GetMapping("/customer/payResult")
	public String getPaymentResult() {
		return "customer/payResult";
	}
	
	// Author : 김은서
	// 고객용 : /customer/addPayment에서 '결제하기' 클릭 시 사용
	@PostMapping("/customer/addPayment") 
	public String addPayment(Payment payment, Integer[] cartNo) {
		paymentService.addPayment(payment, cartNo);
		return "redirect:/customer/payResult";
	}
	
	// Author : 김은서
	// 고객용 : /customer/getPaymentList에서 '결제이력' 리스팅 출력
	@GetMapping("/customer/getPaymentList")
	public String getPaymentList(Model model, HttpSession session) {
		// 1) 로그인한 고객의 paymentList 출력
		List<Payment> paymentList = paymentService.getPaymentList((String) session.getAttribute("loginCustomer"));
		
		// 2) 1)에서 출력된 paymentList 인덱스 별 상세정보 출력 (Payment 별 orders + goods + category 정보) 
		List<Map<String,Object>> PayInfoListByPaymentNo = new ArrayList<>();
		for(Payment p : paymentList) {
			PayInfoListByPaymentNo = paymentService.getPayInfoListByPaymentNo(p.getPaymentNo());
		}
		log.debug(TeamColor.KES + ((String) session.getAttribute("loginCustomer")) + "의 결제 상세 정보 리스트 : " + PayInfoListByPaymentNo.get(0).toString() + TeamColor.RESET);
		//log.debug(TeamColor.KES + ((String) session.getAttribute("loginCustomer")) + "의 결제리스트 : " + paymentList.toString() + TeamColor.RESET);
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("PayInfoListByPaymentNo", PayInfoListByPaymentNo);
		return "customer/getPaymentList";
	}
	

	
}
