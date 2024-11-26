package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Customer;

@Mapper
public interface CustomerMapper {
	// off/login 
	public String login(Customer customer);
}
