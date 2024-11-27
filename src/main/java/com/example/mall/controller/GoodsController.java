package com.example.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.GoodsService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Goods;
import com.example.mall.vo.Page;



@Controller
@Slf4j
public class GoodsController {
	
	@Autowired GoodsService goodsService;
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기
	@GetMapping("/getGoodsOne")
	public String getGoodsOne(@RequestParam Integer goodsNo, Model model) {
		log.debug( TeamColor.KMJ + "GET[GoodsController - getGoodsOne]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
	
		Goods goods = goodsService.getGoodsOne(goodsNo);
	
		log.debug(TeamColor.KMJ + "goods : " + goods.toString() + TeamColor.RESET );
		
		model.addAttribute("goodsNo", goodsNo);
		model.addAttribute("goods", goods);
		
		return "off/getGoodsOne";
	}

	
	// home : 메인 페이지 상품 리스트 출력
	@GetMapping("/home")
	public String home(Page page, Model model, @RequestParam(required = false) String searchWord) {
		
		log.debug( TeamColor.KMJ + "GET[GoodsController - home]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "page : " + page.toString() + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "searchWord : " + searchWord + TeamColor.RESET );

		// 상품리스트 
		Map<String, Object> goodsList = goodsService.getGoodsList(page, searchWord);
		
		model.addAttribute("goodsList", goodsList.get("goodsList"));
		model.addAttribute("page", goodsList.get("page"));
		model.addAttribute("searchWord", searchWord);

		return "off/home";
	}
	
	
	
	
	
	
	
	
}
