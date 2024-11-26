package com.example.mall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CartMapper;

@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper; 
	
	public List<Map<String, Object>> getCartListByCustomerId(String CustomerEmail) {
		return cartMapper.selectCartListByCustomerId(CustomerEmail);
	}
}
