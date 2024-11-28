package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.StaffService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Page;
import com.example.mall.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController { // Author : 김동현
	
	@Autowired StaffService staffService;
	
	// addStaff Form
	@GetMapping("/staff/addStaff") 
	public String addStaff(Model model) {
		return "staff/addStaff";
	}
	
	// addStaff Action
	@PostMapping("/staff/addStaff")
	public String addStaff(Staff staff) {
		
		log.debug(TeamColor.KDH + "addStaffInfo : " + staff.toString() + TeamColor.RESET); // debug
		int addStaffRow = staffService.addStaff(staff);
		if(addStaffRow == 0) {
			return "staff/addStaff";
		}
		
		return "redirect:/staff/getStaffList";
	}
	
	// staffList Form
	@GetMapping("/staff/getStaffList")
	public String getStaffList(Model model) {
		
		List<Staff> staffList = staffService.getStaffList();
		log.debug(TeamColor.KDH + "StaffList : " + staffList.toString() + TeamColor.RESET); // debug
		
		model.addAttribute("staffList", staffList);
		
		return "staff/getStaffList";
	}
	
	// removeStaff
	@GetMapping("/staff/removeStaff")
	public String removeStaff(@RequestParam Integer staffNo) {
		
		log.debug(TeamColor.KDH + "removeStaffId : " + staffNo + TeamColor.RESET); // debug
		int removeStaffRow = staffService.removeStaff(staffNo);
		if(removeStaffRow == 0) {
			return "redirect:/staff/getStaffList";
		}
		return "redirect:/staff/getStaffList";
	}
	
	// customerList Form
	@GetMapping("/staff/getCustomerListByStaff")
	public String getCustomerListByStaff(Model model, Page page) {
		
		Map<String, Object> customerList = staffService.getCustomerListByStaff(page);
		log.debug(TeamColor.KDH + "CustomerList" + customerList.toString() + TeamColor.RESET); // debug
		
		if(page.getCurrentPage() > page.getLastPage()) {
			return "redirect:/staff/getCustomerListByStaff?currentPage=" + page.getLastPage();
		}
		
		model.addAttribute("customerList", customerList.get("customerList"));
		model.addAttribute("page", customerList.get("page"));
		
		return "staff/getCustomerListByStaff";
	}
	
	// removeCustomerByStaff
		@GetMapping("/staff/removeCustomerByStaff")
		public String removeCustomerByStaff(@RequestParam String customerEmail) {
			
			log.debug(TeamColor.KDH + "removeCustomerEmail : " + customerEmail + TeamColor.RESET); // debug
			int removeCustomerRow = staffService.removeCustomerByStaff(customerEmail);
			if(removeCustomerRow == 0) {
				return "redirect:/staff/getCustomerListByStaff";
			}
			return "redirect:/staff/getCustomerListByStaff";
		} 
	
	
	
	
	
	

}
