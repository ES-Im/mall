package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.AddressMapper;
import com.example.mall.vo.Address;

//Author : 김은서
@Service
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// customer/getCartListByChecked 에서 결제 전 배송지 선택 리스트 출력에 사용
	public List<Address> getAddressList(String customerEmail) {
		Address address = new Address();
		address.setCustomerEmail(customerEmail);
		return addressMapper.selectAddressList(address);
	}
	
	
	// /customer/addAddress : 배송지 등록 전 현재 등록된 배송지의 수 확인
	public Integer getAddressCount(String customerEmail) {
		
		Integer addressCount = addressMapper.selectAddressCount(customerEmail);
		
		return addressCount;
	}
	
	// /customer/addAddress : 배송지 등록  
	public Integer addAddress(Address address) {
		
		Integer result = addressMapper.insertAddress(address);
		
		return result;
	}
	
	// /customer/addAddress : 배송지 삭제 
	public Integer removeAddress(Integer addressNo) {
		
		Integer result = addressMapper.deleteAddress(addressNo);
		
		return result;
	}
	
	
	
	
}

