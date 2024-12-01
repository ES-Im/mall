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
import com.example.mall.vo.Page;
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
	public String getPaymentList(Model model, HttpSession session, Page page) {
		page.setRowPerPage(1);
		// 1) 로그인한 고객의 paymentList 출력
		List<Map<String,Object>> paymentList = paymentService.getPaymentList(page ,(String) session.getAttribute("loginCustomer"));

		// 2) 1)의 라스트 페이지 출력 및 Page 객체에 sets
		page.setLastPage(paymentService.getlastPageOnPaymentList(page, (String) session.getAttribute("loginCustomer")));
		log.debug(TeamColor.KES + "페이먼트 라스트 페이지 : " +page.getLastPage() + TeamColor.RESET);
		
		// 3) 1)에서 출력된 paymentList 인덱스 별 상세정보 출력 (Payment 별 orders + goods + category 정보) 
		List<Map<String,Object>> PayInfoListByPaymentNo = new ArrayList<>();
		
		for(Map<String, Object> p : paymentList) {
			PayInfoListByPaymentNo = paymentService.getPayInfoListByPaymentNo( Integer.parseInt(String.valueOf(p.get("paymentNo"))));
		}
		//log.debug(TeamColor.KES + ((String) session.getAttribute("loginCustomer")) + "의 결제 상세 정보 리스트 : " + PayInfoListByPaymentNo.get(0).toString() + TeamColor.RESET);
		//log.debug(TeamColor.KES + ((String) session.getAttribute("loginCustomer")) + "의 결제리스트 : " + paymentList.toString() + TeamColor.RESET);
		
		model.addAttribute("page", page);
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("PayInfoListByPaymentNo", PayInfoListByPaymentNo);
		
		return "customer/getPaymentList";
	}
	
	// Author : 김은서
	// 직원용 : /customer/modifyPaymentStatus 에서 특정 paymentNo에 따라 paymentStatus 변경
	@GetMapping("/customer/modifyPaymentStatus")
	public String modifyPaymentStatus(Payment payment, HttpSession session) {
		//g.debug(TeamColor.KES + "받아온 payment 값" + payment.toString() + TeamColor.RESET);
		
		// 고객이 '결제완료' -> '배송중' 바꾸지 못하도록 막기
		if(payment.getPaymentStatus().equals("배송중")) {
			return "redirect:/customer/getPaymentList";
		}
		// paymentStatus 변경
		int checkSuccess = paymentService.modifyPaymentStatus(payment, (String) session.getAttribute("loginCustomer"));
		log.debug(TeamColor.KES + "modify PayStatus 결과" + checkSuccess + TeamColor.RESET);	// 1일시 정상 실행
		
		return "redirect:/customer/getPaymentList";
	}
	

	// getPaymentList
	@GetMapping("/staff/getPaymentList")
	public String getPaymentList(Model model, Page page) {
		log.debug(TeamColor.KMJ + "[PaymentController]");
		log.debug(TeamColor.KMJ + "[GET - getPaymentList]");
		
		page.setRowPerPage(3);
		
		// 직원용 paymentList 가져오기
		List<Map<String,Object>> paymentList = paymentService.getPaymentList(page);
		log.debug(TeamColor.KMJ + "paymentList : "+ paymentList.toString() + TeamColor.RESET);
		
		List<Map<String, Object>> PayInfoListByPaymentNo = new ArrayList<>();
		
		for(int i=0; i<paymentList.size(); i++) {
			
			Integer paymentNo = Integer.parseInt(String.valueOf(paymentList.get(i).get("paymentNo")));
			PayInfoListByPaymentNo = paymentService.getPayInfoListByPaymentNo(paymentNo);
			
		}
		
		model.addAttribute("PayInfoListByPaymentNo", PayInfoListByPaymentNo);
		log.debug(TeamColor.KMJ + "PayInfoListByPaymentNo : "+ PayInfoListByPaymentNo + TeamColor.RESET);	
		
		model.addAttribute("paymentList", paymentList);
		
		// lastpage 
		Integer lastPage = paymentService.getlastPageOnPaymentList(page);
		page.setLastPage(lastPage);
		model.addAttribute("page", page);
		
		
		return "/staff/getPaymentList";
	}
	
	
	// modifyPaymentStatus : getPaymentList - '결제완료' => '배송중' or '결제취소'로 변경
	@GetMapping("/staff/modifyPaymentStatus")
	public String modifyPaymentStatus(Payment payment) {
		log.debug(TeamColor.KMJ + "[PaymentController]");
		log.debug(TeamColor.KMJ + "[GET - modifyPaymentStatus]");
		
		log.debug(TeamColor.KMJ + "payment : "+ payment.toString() + TeamColor.RESET);	

		
		Integer result = paymentService.modifyPaymentStatus(payment);
		
		log.debug(TeamColor.KMJ + "result : "+ result + TeamColor.RESET);	
		
		if(result == 0) {
			
			return "redirect:/staff/getPaymentList";
		}
	
		return "redirect:/staff/getPaymentList";
	}
	
	
	
	
}
