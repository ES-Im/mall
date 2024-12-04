package com.example.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StatisticalController {
	
	@GetMapping("/staff/statistical")
	public String getStatistical(Model model) {
		return "staff/statistical";
	}
	

}
