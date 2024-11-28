package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Goods;
import com.example.mall.vo.Page;

@Mapper
public interface GoodsMapper {
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 
	Goods selectGoodsOne(Integer goodsNo);
	
	// getGoodsOne : 후기 리스트
	List<Map<String, Object>> selectBoardListByGoodsNo(Integer goodsNo);
	
	// getGoodsOne : 후기 작성 가능한 회원
	List<Map<String, Object>> selectEligibleReviewers(Map<String, Object> paramMap);
	
	// home : 메인 페이지 상품 리스트 출력
	List<Goods> selectGoodsList(Map<String, Object> paramMap);
	
	// home : lastpage
	Integer selectGoodsListLastPage(String searchWord);
	
	// getGoodsListByStaff : 관리자 페이지 상품 리스트
	List<Map<String, Object>> selectGoodsListByStaff(Map<String, Object> parmaMap);
	
	// staff/getGoodsListByStaff.jsp → lastPage 구하기 위한 Count 구하기
	Integer selectCountGoods();
	

}
