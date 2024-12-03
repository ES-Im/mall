package com.example.mall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.vo.Cart;

// Author : 김은서
@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper; 
	// /customer/getCartListByCustomerId 에서 장바구니 리스트 출력시 사용
	public List<Map<String, Object>> getCartList(String CustomerEmail) {
		Cart cart = new Cart();
		cart.setCustomerEmail(CustomerEmail);
		return cartMapper.selectCartList(cart);
	}
	
	// /customer/getCartListByChecked 에서 선택한 장바구니 결제페이지에서 리스트와 총 합계를 맵으로 담아서 반환
	public Map<String,Object> getCartListByChecked(Integer[] cartNo) {
		 Map<String,Object> resultMap = new HashMap<>();

		 List<Map<String,Object>> cartList = new ArrayList<>();
		 Integer totalSum = 0;
		 for(Integer c : cartNo) {
			 Map<String,Object> cartOne = new HashMap<>();
			 Cart cart = new Cart();
			 cart.setCartNo(c);
			 cartOne = cartMapper.selectCartListByChecked(cart);
			 
			 // 선택한 CartNo 리스팅
			 cartList.add(cartOne);

			 // 선택한 CartNo의 총합계
			 totalSum += Integer.parseInt(String.valueOf(cartOne.get("totalPrice")));
		 }
		 
		 resultMap.put("totalSum", totalSum);
		 resultMap.put("cartList", cartList);
		 
		 return resultMap;
	}
	
	// /customer/addCart : cart에 상품 추가시 사용
	public int addCart(Cart cart) {
		return cartMapper.insertCart(cart);
	}
	
	// /customer/removeCart : 장바구니에서 선택한 리스트 삭제 
	public int removeCart(Integer cartNo) {
		Cart cart = new Cart();
		cart.setCartNo(cartNo);
		
		
		return cartMapper.deleteCart(cart);
	}
	
	// inc/header 에 표시되는 장바구니 수
	public int getCountCartByCustomerEmail(String customerEmail) {
		return cartMapper.selectCountCartByCustomerEmail(customerEmail);
	}
	
}
