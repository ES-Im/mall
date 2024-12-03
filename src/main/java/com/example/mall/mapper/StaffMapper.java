package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Customer;
import com.example.mall.vo.Staff;

@Mapper
public interface StaffMapper { // Author : 김동현
	
	// off/login.jsp
	String staffLogin(Staff staff);
	
	// staff/getStaffList.jsp
	List<Staff> selectStaffList();
	
	// staff/addStaff.jsp
	Integer insertStaff(Staff staff);
	
	// staff/addStaff.jsp → staffId 중복확인
	Boolean existsByStaffId(String staffId);
	
	// staff/getStaffList.jsp → removeStaff
	Integer deleteStaff(Integer staffNo);
	
	// staff/getCustomerListByStaff.jsp
	List<Customer> selectCustomerListByStaff(Map<String, Object> paramMap);
	
	// staff/getCustomerListByStaff.jsp → lastPage 구하기 위한 Count 구하기
	Integer selectCountCustomer();
	
	// staff/getCustomerList.jsp → removeCustomerByStaff
	// Integer deleteCustomerByStaff(String customerEmail); // customerService.removeCustomer 재사용

}
