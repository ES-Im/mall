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
		
		Map<String, Object> resultStatistical = statisticalService.getStatistical();
		
		log.debug(TeamColor.KDH + "getDailySales : " + resultStatistical.get("getDailySales").toString() + TeamColor.RESET); // debug
		log.debug(TeamColor.KDH + "getGenderRatio : " + resultStatistical.get("getGenderRatio").toString() + TeamColor.RESET); // debug
		
		model.addAttribute("getDailySales", resultStatistical.get("getDailySales"));
		model.addAttribute("getGenderRatio", resultStatistical.get("getGenderRatio"));
		
		return "staff/statistical";
	}
	

}
