package com.example.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mall.service.BoardService;
import com.example.mall.util.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	
	// 김문정
	// getGoodsOne : 후기 삭제
	@GetMapping("/removeBoardOne")
	public String removeBoardOne(@RequestParam Integer ordersNo, @RequestParam Integer goodsNo) {
		log.debug( TeamColor.KMJ + "GET[BoardController - getGoodsOne]" + TeamColor.RESET );
		
		log.debug( TeamColor.KMJ + "ordersNo : " + ordersNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		// ordersNo에 해당하는 후기 삭제
		


		return "redirect:/off/getGoodsOne?goodsNo="+goodsNo;
	}
	
	
	
	

}
