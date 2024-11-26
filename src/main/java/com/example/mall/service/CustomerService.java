package com.example.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CustomerMapper;
import com.example.mall.vo.Customer;

@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public String login(String id, String pw) {
		Customer customer = new Customer();
		customer.setCustomerEmail(id);
		customer.setCustomerPw(pw);
		 
		return customerMapper.login(customer);
	}
}
