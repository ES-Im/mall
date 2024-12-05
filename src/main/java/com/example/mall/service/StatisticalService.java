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
	
	// 당일 매출
	public Map<String, Object> getDailySales() {
		
	    List<Map<String, Object>> resultDailySales = statisticalMapper.selectDailySales(); // 하루 매출

	    return resultDailySales.get(0);  // 첫 번째 행 반환
	}
	
	// 가입자 성비
	public List<Map<String, Object>> getGenderRatio() {
		
		
		List<Map<String, Object>> resultGenderRatio = statisticalMapper.selectGenderRatio(); // 남여 성비
		
		return resultGenderRatio;  
	}
	
	// 당월 매출
	public Map<String, Object> getMonthlySales(){
		
		Map<String, Object> resultMonthlySales = statisticalMapper.selectMonthlySales();
		return resultMonthlySales;
	}
	
	// 당해 월별 매출 그래프
	public List<Map<String, Object>> getMonthSalesByYear(Integer salesYear) {

		List<Map<String, Object>> resultMonthSalesByYear = statisticalMapper.selectMonthSalesByYear(salesYear); // 년도별 월별 매출
			
		return resultMonthSalesByYear;
	}

	// 베스트 셀러
	public List<Map<String, Object>> getBestSeller(){
		List<Map<String, Object>> bestSeller = statisticalMapper.selectBestSeller();
		
		return bestSeller;
	}
	
	// 당일 상품 주문량
	public Map<String, Object> getDailySalesGoodsCount(){
		Map<String, Object> result = statisticalMapper.selectDailySalesGoodsCount();
		
		return result;
	}
	
	
	
	
}
