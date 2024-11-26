package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staff/getStaffList.jsp
	List<Staff> selectStaffList();

}
