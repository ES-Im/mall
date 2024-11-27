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
}

