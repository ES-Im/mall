package com.example.mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.debug(TeamColor.KDH + "GenderLIST : " + resultStatistical.get("getGenderRatio").toString() + TeamColor.RESET); // debug
		
		model.addAttribute("getDailySales", resultStatistical.get("getDailySales"));
		model.addAttribute("getGenderRatio", resultStatistical.get("getGenderRatio"));
		
		return "staff/statistical";
	}
	
	
	@GetMapping("/getGenderRation")
	@ResponseBody
    public Map<String, Object> getGenderRation() {

        Map<String, Object> result = statisticalService.getStatistical();
        
        List<Map<String, Object>> genderRatioList = new ArrayList<>();
        
        
        
        
     
        		
        
        
        
        Map<String, Object> data = new HashMap<>();
        data.put("getGenderRatio", result.get("getGenderRatio"));
        
        

        return data;  // JSON으로 자동 변환
    }
	
	

}
