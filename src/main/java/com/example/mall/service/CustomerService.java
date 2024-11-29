package com.example.mall.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.Mapping;

import com.example.mall.mapper.CustomerMapper;
import com.example.mall.vo.Customer;
//Author : 김문정, 김은서
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	//Author : 김문정
	public String login(String id, String pw) {
		Customer customer = new Customer();
		customer.setCustomerEmail(id);
		customer.setCustomerPw(pw);
		  
		return customerMapper.login(customer);
	}
	
	//Author : 김은서 
	// /customer/modifyCustomerPw 고객 비밀번호 변경 시 사용
	public int modifyCustomerPw(String customerEmail, String prePw, String newPw) {
		Map<String, String> customerInfoAndNewPw = new HashMap<>();
		customerInfoAndNewPw.put("customerEmail", customerEmail);
		customerInfoAndNewPw.put("prePw", prePw);
		customerInfoAndNewPw.put("newPw", newPw);
		
		return customerMapper.updateCustomerPw(customerInfoAndNewPw);
	}
}
