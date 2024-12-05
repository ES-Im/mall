package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.StatisticalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StatisticalService {
	
	@Autowired StatisticalMapper statisticalMapper;
	
	public List<Map<String, Object>> getDailySales() {
		
	    List<Map<String, Object>> resultDailySales = statisticalMapper.selectDailySales(); // 하루 매출
	    
	   
	    
	    return resultDailySales;  // 첫 번째 행 반환
	}
	
	public List<Map<String, Object>> getGenderRatio() {
		
		
		List<Map<String, Object>> resultGenderRatio = statisticalMapper.selectGenderRatio(); // 남여 성비
		
		return resultGenderRatio;  
	}

}
