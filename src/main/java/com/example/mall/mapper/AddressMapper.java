package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Address;

// Author : 김은서
@Mapper
public interface AddressMapper {
	
	// customer/getCartListByChecked 에서 결제 전 배송지 선택 리스트 출력에 사용
	List<Address> selectAddressList(Address address);
}
