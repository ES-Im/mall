package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StatisticalMapper {
	// 당일 매출
	List<Map<String, Object>> selectDailySales();
	
	// 가입자 성비
	List<Map<String, Object>> selectGenderRatio();
	
	// 당월 매출
	Map<String, Object> selectMonthlySales();
	
	// 당해 월별 매출 그래프
	List<Map<String, Object>> selectMonthSalesByYear(Integer salesYear);
	
	// 베스트 셀러
	List<Map<String, Object>> selectBestSeller();
	
	// 당일 상품 주문량
	Map<String, Object> selectDailySalesGoodsCount();
	
	
	
	
	
}
