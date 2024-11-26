package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.GoodsService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Goods;



@Controller
@Slf4j
public class GoodsController {
	
	@Autowired GoodsService goodsService;
	
	
	
	// getGoodsOne : 상품 상세보기
	@GetMapping("/getGoodsOne")
	public String getGoodsOne(@RequestParam Integer goodsNo, Model model) {
		log.debug( TeamColor.KMJ + "GET[GoodsController]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo" + goodsNo);
	
//		Goods goods = goodsService.
		
		
		
//		model.addAttribute("goodsNo", goodsNo);
		
		return "getGoodsOne";
	}

	
	
	
	
	
	
	
}
