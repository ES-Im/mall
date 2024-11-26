package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.StaffMapper;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Staff;

@Service
@Transactional
public class StaffService {
	
	@Autowired StaffMapper staffMapper;
	
	// 스태프 리스트 조회
	public List<Staff> getStaffList() {
		return staffMapper.selectStaffList();
	}
	
	// 스태프 추가
	public Integer addStaff(Staff staff) {
		return staffMapper.insertStaff(staff);
	}
	
	// 스태프 삭제
	public Integer removeStaff(Integer staffId) {
		return staffMapper.deleteStaff(staffId);
	}
	
	// 고객 리스트 조회
	public List<Customer> getCustomerListByStaff() {
		return staffMapper.selectCustomerListByStaff();
	}

}
