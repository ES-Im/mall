package com.example.mall.service;

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
	
	public Map<String, Object> getStatistical() {
	    List<Map<String, Object>> resultDailySales = statisticalMapper.getDailySales();
	    return resultDailySales.isEmpty() ? null : resultDailySales.get(0);  // 첫 번째 행 반환
	}

}
