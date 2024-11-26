package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.StaffMapper;
import com.example.mall.vo.Staff;

@Service
@Transactional
public class StaffService {
	
	@Autowired StaffMapper staffMapper;
	
	// 스태프 리스트 조회
	public List<Staff> getStaffList() {
		return staffMapper.selectStaffList();
	}

}
