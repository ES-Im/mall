package com.example.mall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Customer;
// Author : 김문정, 김은서
@Mapper
public interface CustomerMapper {
	// Author : 김문정
	// off/login  
	String login(Customer customer);
	
	// Author : 김은서
	// /customer/getCustomerOne 에서 회원 기본 정보 출력시 사용
	Customer selectCustomerOne(String customerEmail);
	
	// Author : 김은서
	// /customer/modifyCustomerPw 에서 회원 비밀번호 확인 후 비밀번호 변경
	Integer updateCustomerPw(Map<String, String> customerInfoAndNewPw);
	
	// Author : 김은서
	// /customer/modifyCustomerPw 에서 회원 비밀번호 확인 후 비밀번호 변경
	Integer deleteCustomerByCustomer(String customerPw);
}
