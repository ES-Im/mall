package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StatisticalMapper {
	
	List<Map<String, Object>> selectDailySales();
	
	List<Map<String, Object>> selectGenderRatio();

}
