package com.example.mall.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.Mapping;

import com.example.mall.mapper.AddressMapper;
import com.example.mall.mapper.CartMapper;
import com.example.mall.mapper.CustomerMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Address;
import com.example.mall.vo.Cart;
import com.example.mall.vo.Customer;

import lombok.extern.slf4j.Slf4j;
//Author : 김문정, 김은서
@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	@Autowired CartMapper cartMapper;
	@Autowired AddressMapper addressMapper;
	
	//Author : 김문정
	public String login(String id, String pw) {
		Customer customer = new Customer();
		customer.setCustomerEmail(id);
		customer.setCustomerPw(pw);
		  
		return customerMapper.login(customer);
	}
	
	public Customer getCustomerOne(String customerEmail) {
		return customerMapper.selectCustomerOne(customerEmail);
	}
	
	//Author : 김은서 
	// /customer/modifyCustomerPw 고객 비밀번호 변경 시 사용
	public int modifyCustomerPw(String customerEmail, String prePw, String newPw) {
		log.debug("prePw = " + prePw);
		Map<String, String> customerInfoAndNewPw = new HashMap<>();
		customerInfoAndNewPw.put("customerEmail", customerEmail);
		customerInfoAndNewPw.put("prePw", prePw);
		customerInfoAndNewPw.put("newPw", newPw);
		return customerMapper.updateCustomerPw(customerInfoAndNewPw);
	}
	
	//Author : 김은서 
	// /customer/deleteCustomer 회원삭제 : (1)고객에 매칭되는 Address 정보 수정 (customerEmail = '-1') (2) 고객에 매칭되는 Cart 정보 삭제 (3) 고객 삭제
	public int removeCustomer(Customer customer) {
		Cart cart = new Cart();
		cart.setCustomerEmail(customer.getCustomerEmail());
		Address address = new Address();
		address.setCustomerEmail(customer.getCustomerEmail());
		
		int checkCartDelete = cartMapper.deleteCart(cart);
		// 트랜잭션 디버깅
		if(checkCartDelete != 2) {
			throw new RuntimeException("Cart 쿼리에서 오류 checkCartDelete = " + checkCartDelete);
		}
		
		//addressMapper.deleteAddress(customerEmail);		// deleteAddress -> where 동적쿼리 변경 필요
		int checkAddressDelete = customerMapper.deleteAddress(address);
		// 트랜잭션 디버깅
		if(checkAddressDelete != 9) {
			throw new RuntimeException("Address 쿼리에서 오류 checkAddressDelete = " + checkAddressDelete);
		}
		
		int checkSuccess = customerMapper.deleteCustomer(customer);
		// 트랜잭션 디버깅
		if(checkSuccess != 1) {
			throw new RuntimeException("deleteCustomer 쿼리에서 오류 checkSuccess = " + checkSuccess);
		}
		
		return checkSuccess;
	}
	
	
}
