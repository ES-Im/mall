package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Cart;

// Author : 김은서
@Mapper
public interface CartMapper {
	// customer/getCartList 에서 장바구니 리스트 출력시 사용 (Cart.customerEmail 이용)
	List<Map<String, Object>> selectCartList(Cart cart);
	
	// customer/getCartListByChecked 에서 선택한 장바구니 결제페이지에 사용 (Cart.CartNo 이용)
	Map<String, Object> selectCartListByChecked(Cart cart);
	
	// customer/addCart : cart에 상품 추가시 사용
	int insertCart(Cart cart);
	 
	int deleteCart(Integer cartNo);
}
