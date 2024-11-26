package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {
	public List<Map<String, Object>> selectCartListByCustomerId(String customerEmail);
	
}
