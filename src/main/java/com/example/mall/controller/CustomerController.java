package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.mall.service.CustomerService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
// Author : 김은서
@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/customer/getCustomerOne")
	public String getCustomerOne(Model model, HttpSession session) {
		// 로그인 한 고객의 정보 반환
		model.addAttribute("customer", customerService.getCustomerOne((String) session.getAttribute("loginCustomer")));
		//log.debug(TeamColor.KES + "result : "+ customerService.getCustomerOne((String) session.getAttribute("loginCustomer")).toString() + TeamColor.RESET);	

		return "customer/getCustomerOne";
	}
	
	// 비밀번호 변경 클릭시 변경전 비밀번호를 리다이렉트로 노출없이 옳기는 역할 : getCustomerOne.jsp - (Post방식 전달) -> postModifyCustomerPw - (addFlashAttribute) -> modifyCustomerPw 
	@PostMapping("/customer/postModifyCustomerPw")
	public String postModifyCustomerPw(@RequestParam String prePw, RedirectAttributes redirectAttributes) {
	    redirectAttributes.addFlashAttribute("prePw", prePw);
	    return "redirect:/customer/modifyCustomerPw";
	}
	
	@GetMapping("/customer/modifyCustomerPw")
	public String modifyCustomerPw(Model model, @ModelAttribute("prePw") String prePw) {
		//log.debug(TeamColor.KES + "받아온 값 : prePw : "+ prePw + TeamColor.RESET);
		// 변경 전 비밀번호 전달
		return "customer/modifyCustomerPw"; 
	}
	
	@PostMapping("/customer/modifyCustomerPw")
	public String modifyCustomerPw(Model model, HttpSession session, @RequestParam String newPw, @RequestParam String prePw) {
		String alertFailedMsg = null;

		Integer checkSuccess = customerService.modifyCustomerPw((String)session.getAttribute("loginCustomer"), prePw, newPw);
		
		if(checkSuccess != 1) {
			alertFailedMsg = "비밀번호 변경에 실패하였습니다.";
			model.addAttribute("alertFailedMsg", alertFailedMsg);
			return "customer/modifyCustomerPw";
		}
		
		return "redirect:/customer/getCustomerOne";
	}
	
	@PostMapping("/customer/removeCustomer")
	public String removeCustomer(Model model, Customer customer) {
		String alertFailedMsg = null;
		Integer checkSuccess = customerService.removeCustomer(customer);
		
		if(checkSuccess != 1) {
			alertFailedMsg = "회원 탈퇴에 실패하였습니다.";
			model.addAttribute("alertFailedMsg", alertFailedMsg);
			return "redirect:/customer/getCustomerOne";
		}
		
		return "redirect:/customer/getCustomerOne";
	}
	
	@GetMapping("/off/addCustomer")
	public String addCustomer() {
		return "off/addCustomer";
	}
	
	@PostMapping("/off/addCustomer")
	public String addCustomer(Customer customer) {
		
		return "redirect:/off/login";
	}
}
