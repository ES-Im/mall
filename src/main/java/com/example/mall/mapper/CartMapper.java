package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Cart;

@Mapper
public interface CartMapper {  // Author : 김은서
	// customer/getCartList 에서 장바구니 리스트 출력시 사용 
	List<Map<String, Object>> selectCartList(String customerEmail);
	
	// customer/addCart : cart에 상품 추가시 사용
	int insertCart(Cart cart);
	 
	int deleteCart(Cart cart);
}
