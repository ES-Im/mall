package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.CartService;
import com.example.mall.vo.Customer;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired CartService cartService;
	@GetMapping("/customer/getCartListByCustomerId")
	public String getCartListByCustomerId(HttpSession session) {
		String customerEmail = (String) session.getAttribute("loginStaff");
		List<Map<String, Object>> cartList = cartService.getCartListByCustomerId(customerEmail);
		return "customer/getCartListByCustomerId";
	}
	

}
