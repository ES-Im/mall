package com.example.mall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;
import com.example.mall.vo.Cart;

@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper; 
	// /customer/getCartListByCustomerId 에서 장바구니 리스트 출력시 사용
	public List<Map<String, Object>> getCartList(String CustomerEmail) {
		return cartMapper.selectCartList(CustomerEmail);
	}
	
	// /customer/addCart : cart에 상품 추가시 사용
	public int addCart(Cart cart) {
		return cartMapper.insertCart(cart);
	}
	
//	// /customer/removeCart : 장바구니에서 선택한 리스트 삭제
//	public 
//	CartService.removeCart()
}
