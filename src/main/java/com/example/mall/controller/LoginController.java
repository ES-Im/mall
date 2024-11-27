package com.example.mall.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.CustomerService;
import com.example.mall.service.StaffService;
import com.example.mall.util.TeamColor;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;


@Controller
@Slf4j
public class LoginController {
	
	@Autowired StaffService staffService;
	@Autowired CustomerService customerService;
	
	
	// login.jsp로 이동
	@GetMapping("/off/login")
	public String login(HttpSession session) {
		log.debug( TeamColor.KMJ + "GET[LoginController]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "/off/login 실행" + TeamColor.RESET);
		
		return "off/login";
	}
	
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(@RequestParam String id, @RequestParam String pw, Model model, HttpSession session) {
		
		log.debug(TeamColor.KMJ + "POST[LoginController]" +TeamColor.RESET);
		
		// 유효성 검사
		if(id == null || id.equals("") || pw == null || pw.equals("") ) {
			
			return "off/login";
		}

		log.debug(TeamColor.KMJ + "id : " + id + TeamColor.RESET);
		log.debug(TeamColor.KMJ + "pw : " + pw + TeamColor.RESET);
		
		
		
		// 넘어온 id가 staffId인지 확인하기
		String firstChar = ""+id.charAt(0);
		
		if(firstChar.equals("@")) {
			
			String staffId = staffService.staffLogin(id, pw);
			
			log.debug(TeamColor.KMJ + "staff" + staffId.toString() + TeamColor.RESET);
					
			session.setAttribute("loginStaff", staffId);		
			
			return "redirect:/staff/getGoodsList";
					
	
		}else {
			
			// customer 로그인
			String customerEmail = customerService.login(id, pw);
			
			log.debug(TeamColor.KMJ + "customer" + customerEmail.toString() + TeamColor.RESET);

			
			session.setAttribute("loginCustomer", customerEmail);
			
			return "redirect:/customer/main";
			
		}


	}
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String getMethodName(HttpSession session) {
		
		session.invalidate();
		
		log.debug("/logout 실행 - 로그아웃 성공");
		
		return"redirect:/off/login";
		

	}
	
	
	
	
	// 테스트용 로그인 화면 ( 완성 후 삭제 필요 )
	
	// login.jsp로 이동
	@GetMapping("/off/loginC")
	public String loginC(HttpSession session) {
		log.debug( TeamColor.KMJ + "GET[LoginController]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "/off/login 실행" + TeamColor.RESET);
		
		return "off/loginC";
	}
	
	// 로그인 액션
	@PostMapping("/off/loginC")
	public String loginC(@RequestParam String id, @RequestParam String pw, Model model, HttpSession session) {
		
		log.debug(TeamColor.KMJ + "POST[LoginController]" +TeamColor.RESET);
		
		// 유효성 검사
		if(id == null || id.equals("") || pw == null || pw.equals("") ) {
			
			return "off/loginC";
		}

		log.debug(TeamColor.KMJ + "id : " + id + TeamColor.RESET);
		log.debug(TeamColor.KMJ + "pw : " + pw + TeamColor.RESET);
		
		
		
		String customerEmail = customerService.login(id, pw);
			
		log.debug(TeamColor.KMJ + "customer" + customerEmail.toString() + TeamColor.RESET);

		
		session.setAttribute("loginCustomer", customerEmail);
		
		return "redirect:/customer/main";
			
	}
	
	// 테스트용 로그인 화면 ( 완성 후 삭제 필요 )
	
	// login.jsp로 이동
	@GetMapping("/off/loginS")
	public String loginS(HttpSession session) {
		log.debug( TeamColor.KMJ + "GET[LoginController]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "/off/login 실행" + TeamColor.RESET);
		
		return "off/loginS";
	}
	
	// 로그인 액션
	@PostMapping("/off/loginS")
	public String loginS(@RequestParam String id, @RequestParam String pw, Model model, HttpSession session) {
		
		log.debug(TeamColor.KMJ + "POST[LoginController]" +TeamColor.RESET);
		
		// 유효성 검사
		if(id == null || id.equals("") || pw == null || pw.equals("") ) {
			
			return "off/loginS";
		}

		log.debug(TeamColor.KMJ + "id : " + id + TeamColor.RESET);
		log.debug(TeamColor.KMJ + "pw : " + pw + TeamColor.RESET);
		
		
		
		// 넘어온 id가 staffId인지 확인하기
		String firstChar = ""+id.charAt(0);
		
			
		String staffId = staffService.staffLogin(id, pw);
		
		log.debug(TeamColor.KMJ + "staff" + staffId.toString() + TeamColor.RESET);
				
		session.setAttribute("loginStaff", staffId);		
		
		return "redirect:/staff/getGoodsList";
	
	}
	

}
