package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsForm;

@Mapper
public interface GoodsMapper {
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 
	Map<String, Object> selectGoodsOne(Integer goodsNo);
	
	// getGoodsOne : 후기 리스트
	List<Map<String, Object>> selectBoardListByGoodsNo(Map<String, Object> paramMap);
	
	// getGoodsOne : 후기 리스트 마지막 페이지 구하기
	Integer selectCountboardList(Integer goodsNo);
	
	// getGoodsOne : 후기 작성 가능한 회원
	List<Map<String, Object>> selectEligibleReviewers(Map<String, Object> paramMap);
	
	// home : 메인 페이지 상품 리스트 출력
	List<Map<String, Object>> selectGoodsList(Map<String, Object> paramMap);
	
	// home : lastpage
	Integer selectGoodsListLastPage(Map<String, Object> paramMap);
	
	// getGoodsListByStaff : 관리자 페이지 상품 리스트
	List<Map<String, Object>> selectGoodsListByStaff(Map<String, Object> parmaMap);
	
	// staff/getGoodsListByStaff.jsp → lastPage 구하기 위한 Count 구하기
	Integer selectCountGoods(String searchWord);
	
	// removeGoods : 상품 리스트 삭제 ( 실제로는 판매중지로 변경 )
	Integer deleteGoods(Goods goods);
	
	// addGoods : 상품 추가
	Integer insertGoods(Goods goods);
	
	// modifyGoods : 상품 수정
	Integer updateGoods(Goods goods);

	

}
