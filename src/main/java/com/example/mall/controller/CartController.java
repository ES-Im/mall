package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.AddressService;
import com.example.mall.service.CartService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Address;
import com.example.mall.vo.Cart;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

// Author : 김은서
@Controller
@Slf4j
public class CartController {
	@Autowired CartService cartService;
	@Autowired AddressService addressService;
	
	// customer/getCartListByCustomerId 에서 장바구니 리스트 출력시 사용
	@GetMapping("/customer/getCartList")
	public String getCartList(Model model, HttpSession session) {
		String customerEmail = (String) session.getAttribute("loginCustomer");
		//log.debug(TeamColor.KES + "customerEmail = " + customerEmail);
		
		List<Map<String, Object>> cartList = cartService.getCartList(customerEmail);
		log.debug(TeamColor.KES + "cartList = " + cartList.toString());
		model.addAttribute("cartList", cartList);
		
		Integer countCart = cartService.getCountCartByCustomerEmail(customerEmail);
		log.debug(TeamColor.KES + "회원 장바구니 = " + countCart  + TeamColor.RESET);
		session.setAttribute("countCart", countCart);
		
		return "customer/getCartList";
	}
	
	@GetMapping("/customer/getCartListByChecked")
	public String getCartListByChecked(Model model, HttpSession session, @RequestParam Integer[] cartNo) {
		// 선택한 CartNo 리스팅 + 총 합계
		Map<String, Object> cartInfoByCheckedMap = cartService.getCartListByChecked(cartNo);
		
		// 해당 고객의 배송지리스트 출력
		List<Address> addressList = addressService.getAddressList((String)session.getAttribute("loginCustomer"));
		
		model.addAttribute("cartListByChecked", cartInfoByCheckedMap.get("cartList"));
		model.addAttribute("totalSum", cartInfoByCheckedMap.get("totalSum"));
		model.addAttribute("addressList", addressList);
		
		return "customer/getCartListByChecked";
	}
	 
	// customer/addCart : cart에 상품 추가시 사용
	@GetMapping("/customer/addCart") 
	public String addCart(Cart cart) {
		log.debug(TeamColor.KES + "addCart 실행" + TeamColor.RESET);
		cartService.addCart(cart);
		return "redirect:/customer/getCartList";
	}
	
	// customer/removeCart : customer-Email, cart_no 매개변수를 받아서 카트 삭제
	@GetMapping("/customer/removeCart")
	public String removeCart(@RequestParam Integer cartNo) {
		log.debug(TeamColor.KES + "삭제 대상 카드 넘버 = " + cartNo  + TeamColor.RESET);
		int checkResult = cartService.removeCart(cartNo);
		log.debug(TeamColor.KES + "삭제 Result = " + checkResult + TeamColor.RESET);
		
		return "redirect:/customer/getCartList";
	}

}
