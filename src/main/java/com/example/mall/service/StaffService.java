package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.StaffMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Page;
import com.example.mall.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService { // Author : 김동현
	
	@Autowired StaffMapper staffMapper;
	
	// 스태프 로그인
	public String staffLogin(String id, String pw) {
		Staff staff = new Staff();
		staff.setStaffId(id);
		staff.setStaffPw(pw);
		  
		return staffMapper.staffLogin(staff);
	}
	
	// 스태프 리스트 조회
	public List<Staff> getStaffList() {
		return staffMapper.selectStaffList();
	}
	
	// 스태프 추가
	public Integer addStaff(Staff staff) {
		return staffMapper.insertStaff(staff);
	}
	
	// 스태프 삭제
	public Integer removeStaff(Integer staffNo) {
		return staffMapper.deleteStaff(staffNo);
	}
	
	// 고객 리스트 조회
	public Map<String, Object> getCustomerListByStaff(Page page) {
		
		page.setRowPerPage(3);
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// customerList
		List<Customer> customerList = staffMapper.selectCustomerListByStaff(paramMap);
		
		Integer totalCount = staffMapper.selectCountCustomer();
		
		Integer lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		log.debug( TeamColor.KDH + "CustomerListLastPage : " + lastPage + TeamColor.RESET ); // debug
		page.setLastPage(lastPage);
		
		Map<String, Object> customerListMap = new HashMap<>();
		customerListMap.put("customerList", customerList);
		customerListMap.put("page", page);
		
		return customerListMap;
	}
	
	// 고객 리스트 삭제
	public Integer removeCustomerByStaff(String customerEmail) {
		return staffMapper.deleteCustomerByStaff(customerEmail);
	}

}
