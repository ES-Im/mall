package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Customer;
import com.example.mall.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staff/getStaffList.jsp
	List<Staff> selectStaffList();
	
	// staff/addStaff.jsp
	Integer insertStaff(Staff staff);
	
	// staff/getStaffList.jsp → removeStaff
	Integer deleteStaff(Integer staffId);
	
	// staff/getCustomerListByStaff.jsp
	List<Customer> selectCustomerListByStaff();
	
	// staff/getCustomerList.jsp → removeCustomerByStaff
	Integer deleteCustomerByStaff(String customerEmail);

}
