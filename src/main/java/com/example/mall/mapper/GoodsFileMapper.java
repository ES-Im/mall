package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	
	// Author : 김동현
	// addGoods.jsp → 사진 파일 추가 
	Integer insertGoodsFile(GoodsFile goodsFile);

}
