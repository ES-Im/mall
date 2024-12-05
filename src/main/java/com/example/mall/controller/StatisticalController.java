package com.example.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.StatisticalService;
import com.example.mall.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StatisticalController {
	
	@Autowired StatisticalService statisticalService;
	
	@GetMapping("/staff/statistical")
	public String getStatistical(Model model) {
		
		Map<String, Object> result = statisticalService.getStatistical();
		
		log.debug(TeamColor.KDH + "result : " + result.toString() + TeamColor.RESET);
		model.addAttribute("result", result);
		
		return "staff/statistical";
	}
	

}
