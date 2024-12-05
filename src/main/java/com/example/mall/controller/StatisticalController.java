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
		
		// 매출				
		
		// 성비
        List<Map<String, Object>> list =   statisticalService.getGenderRatio();
		Map<String, Object> maleMap = list.get(0);		
		Map<String, Object> femaleMap = list.get(1);
		
		log.debug(TeamColor.KDH + "male : " + maleMap.toString() + TeamColor.RESET); //
		log.debug(TeamColor.KDH + "female : " + femaleMap.toString() + TeamColor.RESET); //
		
		
		return "staff/statistical";
	}
	
	
	@GetMapping("/getGenderRation")
	@ResponseBody
    public Map<String, Object> getGenderRation() {

        List<Map<String, Object>> list =   statisticalService.getGenderRatio();
		Map<String, Object> maleMap = list.get(0);		
		Map<String, Object> femaleMap = list.get(1);		


        Map<String, Object> data = new HashMap<>();
        data.put("male", maleMap.get("genderPer"));
        data.put("female", femaleMap.get("genderPer"));
        
        return data;  // JSON으로 자동 변환
    }
	
	

}
