package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.CartService;
import com.example.mall.vo.Cart;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired CartService cartService;
	
	// customer/getCartListByCustomerId 에서 장바구니 리스트 출력시 사용
	@GetMapping("/customer/getCartList")
	public String getCartList(Model model, HttpSession session) {
		String customerEmail = (String) session.getAttribute("loginStaff");
		List<Map<String, Object>> cartList = cartService.getCartList(customerEmail);
		model.addAttribute("cartList", cartList);
		
		return "customer/getCartListByCustomerId";
	}
	 
	// customer/addCart : cart에 상품 추가시 사용
	@GetMapping("/customer/addCart")
	public String addCart(Cart cart) {
		cartService.addCart(cart);
		return "redirect :/customer/getCartList";
	}
	
}
