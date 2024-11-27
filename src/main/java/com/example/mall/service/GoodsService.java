package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.GoodsMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Goods;
import com.example.mall.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class GoodsService {
	
	@Autowired GoodsMapper goodsMapper;
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 
	public Goods getGoodsOne(Integer goodsNo){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsOne]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		Goods goods = goodsMapper.selectGoodsOne(goodsNo);
		
		return goods;
	}
	
	
	public List<Map<String, Object>> getBoardListByGoodsNo(Integer goodsNo){
		log.debug( TeamColor.KMJ + "[GoodsService - getBoardListByGoodsNo]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		List<Map<String, Object>> boardList = goodsMapper.selectBoardListByGoodsNo(goodsNo);

		return boardList;
	}
	
	
	// home : 메인 페이지 상품 리스트 출력
	public Map<String, Object> getGoodsList(Page page, String searchWord){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsList]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "searchWord : " + searchWord + TeamColor.RESET );
		
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// goodsList.
		List<Goods> goodsList = goodsMapper.selectGoodsList(paramMap);
		
		// goodsList의 마지막 페이지 구하기
		Integer totalRow = goodsMapper.selectGoodsListLastPage(searchWord);
		
		Integer goodsListLastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			goodsListLastPage++;
		}
		
		log.debug( TeamColor.KMJ + "goodsListLastPage : " + goodsListLastPage + TeamColor.RESET );
		
		page.setLastPage(goodsListLastPage);
	
		// goodsList + Page
		Map<String, Object> goodsListMap = new HashMap<>();
		goodsListMap.put("goodsList", goodsList);
		goodsListMap.put("page", page);

		return goodsListMap;
	}
	
	
	
	
	
	

}
