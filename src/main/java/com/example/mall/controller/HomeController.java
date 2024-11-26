package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/off/home")
	public String getMethodName() {
		return "/off/home";
	}
	
	@GetMapping("/off/header")
	public String getheader() {
		return "/inc/header";
	}
	
	@GetMapping("/off/footer")
	public String getfooter() {
		return "/inc/footer";
	}
	
	@GetMapping("/off/staffLeftMenu")
	public String getstaffLeftMenu() {
		return "/inc/staffLeftMenu";
	}
	
	@GetMapping("/off/staff")
	public String getstaff() {
		return "/staff/staff";
	}


	@GetMapping("/off/join")
	public String getjoin() {
		return "/off/join";
	}
	
	@GetMapping("/off/addStaff")
	public String getaddStaff() {
		return "/staff/addStaff";
	}
	
	@GetMapping("/off/goodsOne")
	public String getgoodsOne() {
		return "/off/goodsOne";
	}
	@GetMapping("/off/cart")
	public String getcart() {
		return "customer/cart";
	}
	
	
	
	
	
	
}
