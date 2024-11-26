package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.mall.service.StaffService;
import com.example.mall.vo.Staff;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class StaffController {
	
	@Autowired StaffService staffService;
	
	
	@GetMapping("/staff/addStaff")
	public String addStaff() {
		return "staff/addStaff";
	}
	
	@PostMapping("/staff/addStaff")
	public String addStaff(Model model) {
		
		return "redirect:/staff/getStaffList";
	}
	
	// staffList Form
	@GetMapping("/staff/getStaffList")
	public String getStaffList(Model model) {
		
		List<Staff> staffList = staffService.getStaffList();
		log.debug("StaffList : " + staffList.toString());
		
		model.addAttribute("staffList", staffList);
		
		return "staff/getStaffList";
	}
	
	

}
