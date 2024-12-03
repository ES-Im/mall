package com.example.mall.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.mall.service.BoardService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired BoardService boardService;
	
	// 김문정
	// getGoodsOne : 후기 삭제
	@GetMapping("/removeBoardOne")
	public String removeBoardOne(@RequestParam Integer ordersNo, @RequestParam Integer goodsNo) {
		log.debug( TeamColor.KMJ + "GET[BoardController - removeBoardOne]" + TeamColor.RESET );
		
		log.debug( TeamColor.KMJ + "ordersNo : " + ordersNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		// ordersNo에 해당하는 후기 삭제 : staff의 후기 삭제와 같은 쿼리를 사용하므로 동일한 service, mapper 이용.
		Integer result = boardService.removeBoardByStaff(ordersNo);
		log.debug( TeamColor.KMJ + "result : " + result + TeamColor.RESET );
		
		if(result == 0) {
			return "redirect:/getGoodsOne?goodsNo=" +  goodsNo;
		}

		return "redirect:/getGoodsOne?goodsNo="+goodsNo;
	}
	
	// 김문정
	// getGoodsOne : 후기 등록
	@PostMapping("/addBoardOne")
	public String addBoardOne(@RequestParam Integer ordersNo, @RequestParam Integer goodsNo, @RequestParam String boardContent, RedirectAttributes redirectAttributes) {
		log.debug( TeamColor.KMJ + "GET[BoardController - getGoodsOne]" + TeamColor.RESET );
		
		log.debug( TeamColor.KMJ + "ordersNo : " + ordersNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "boardContent : " + boardContent + TeamColor.RESET );
		
		// 해당 ordersNo에 해당하는 board 삭제하기
		Integer result = boardService.addBoardOne(ordersNo, boardContent);
		log.debug( TeamColor.KMJ + "result : " + result + TeamColor.RESET );
		
	        if (result == 0) { // 실패    
	            redirectAttributes.addFlashAttribute("boardMsg", "글쓰기 실패!");
				log.debug(TeamColor.KMJ + "글쓰기 실패!" + TeamColor.RESET);

	            return "redirect:/getGoodsOne?goodsNo=" + goodsNo ;
	        }
	
		return "redirect:/getGoodsOne?goodsNo=" + goodsNo;
	}
	
	
	// 김동현
	// getBoardListByStaff Form : 관리자 전용 BoardList
	@GetMapping("/staff/getBoardListByStaff")
	public String getBoardListByStaff(Model model, Page page) {
		
		Map<String, Object> boardList = boardService.getBoardListByStaff(page);
		log.debug(TeamColor.KDH + "boardList" + boardList.toString() + TeamColor.RESET); // debug
		
		model.addAttribute("boardList", boardList.get("boardList"));
		model.addAttribute("page", boardList.get("page"));
		
		return "staff/getBoardListByStaff";
	}
	
	// 김동현
	// removeCustomerByStaff
	@GetMapping("/staff/removeBoardByStaff")
	public String removeCustomerByStaff(@RequestParam Integer ordersNo) {
		
		log.debug(TeamColor.KDH + "removeBoardordersNo : " + ordersNo + TeamColor.RESET); // debug
		int removeBoardRow = boardService.removeBoardByStaff(ordersNo);
		if(removeBoardRow == 0) {
			return "redirect:/staff/getBoardListByStaff";
		}
		return "redirect:/staff/getBoardListByStaff";
	} 
	
	
	
	
	

}
