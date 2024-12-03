package com.example.mall.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.service.CategoryService;
import com.example.mall.service.GoodsFileService;
import com.example.mall.service.GoodsService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Category;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;
import com.example.mall.vo.Page;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GoodsController {
	
	@Autowired GoodsService goodsService;
	@Autowired GoodsFileService goodsFileService;
	@Autowired CategoryService categoryService;
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 + 후기 리스트 + 후기 작성, 수정
	@GetMapping("/getGoodsOne")
	public String getGoodsOne(@RequestParam Integer goodsNo, Model model, HttpSession session) {
		log.debug( TeamColor.KMJ + "GET[GoodsController - getGoodsOne]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
	
		String loginCustomer = null;
		String loginStaff = null;
		
		if(session.getAttribute("loginCustomer") != null ) {
			loginCustomer = (String) session.getAttribute("loginCustomer");			
			log.debug( TeamColor.KMJ + "loginCustomer : " + loginCustomer + TeamColor.RESET );
			
		}else {
			loginStaff = (String) session.getAttribute("loginStaff");
			log.debug( TeamColor.KMJ + "loginStaff : " + loginStaff + TeamColor.RESET );
		}
		

		// goodsOne : 상품 상세보기
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		log.debug(TeamColor.KMJ + "goods : " + goods.toString() + TeamColor.RESET );
		
		// goodsOne : 사진 리스트 가져오기
		List<GoodsFile> fileList = goodsFileService.getGoodsFileList(goodsNo);
		
		model.addAttribute("goodsFileList", fileList);
		
		
		// boardList : 후기 리스트
		List<Map<String, Object>> boardList = goodsService.getBoardListByGoodsNo(goodsNo);
		
		// 후기 작성 가능 회원 확인 (해당 상품의 구매이력이 존재 + payment_Status가 '배송완료' + 후기를 작성하지 않은 회원 + 모든 staff)
		List<Map<String, Object>> eligibleReviewersListMap = goodsService.getEligibleReviewers(goodsNo, loginCustomer);
		
		log.debug(TeamColor.KMJ + "eligibleReviewersListMap : " + eligibleReviewersListMap.toString() + TeamColor.RESET );
		boolean isEligibleReviewer = false;
		
		if(eligibleReviewersListMap.size() > 0) {
			
			if(Integer.parseInt(String.valueOf((eligibleReviewersListMap.get(0).get("boardOrdersNo")))) == -1) {
				
				isEligibleReviewer = true;
			}

			Integer orderNo = null;

			for(int i = 0; i<eligibleReviewersListMap.size(); i++) {
				if(eligibleReviewersListMap.get(i).get("paymentStatus").equals("배송완료") && eligibleReviewersListMap.get(i).get("boardOrdersNo").equals("-1")) {
					orderNo = Integer.parseInt(String.valueOf(eligibleReviewersListMap.get(i).get("orderNo")));
					model.addAttribute("orderNo", orderNo);
					log.debug(TeamColor.KMJ + "orderNo : " + orderNo + TeamColor.RESET );
				}

			}
			
		}

		log.debug(TeamColor.KMJ + "eligibleReviewer : " + isEligibleReviewer + TeamColor.RESET );

		model.addAttribute("goodsNo", goodsNo);
		model.addAttribute("goods", goods);
		model.addAttribute("boardList", boardList);
		model.addAttribute("isEligibleReviewer", isEligibleReviewer);
	
		
		return "/off/getGoodsOne";
	}
	
	// 김동현
	// getGoodsListByStaff Form
	@GetMapping("/staff/getGoodsListByStaff")
	public String getGoodsListByStaff(Model model, Page page, @RequestParam(required = false) String searchWord) {
		
		Map<String, Object> goodsList = goodsService.getGoodsListByStaff(page, searchWord);
		log.debug(TeamColor.KDH + "goodsList" + goodsList.toString() + TeamColor.RESET); // debug
		
		model.addAttribute("goodsList", goodsList.get("goodsList"));
		model.addAttribute("page", goodsList.get("page"));
		log.debug(TeamColor.KDH + "searchWord : " + searchWord + TeamColor.RESET); // debug
		model.addAttribute("searchWord", searchWord);
		
		return "staff/getGoodsListByStaff";
	}
	
	// 김동현
	// removeGoods - 판매중지
	@GetMapping("/staff/removeGoods")
	public String removeGoods(Goods goods) {
		
		// log.debug(TeamColor.KDH + "goodsStatuts : " + goods.getGoodsStatus() + TeamColor.RESET); // debug
		goods.setGoodsStatus("판매중지");
		// log.debug(TeamColor.KDH + "goodsStatuts : " + goods.getGoodsStatus() + TeamColor.RESET); // debug
		
		// log.debug(TeamColor.KDH + "removeGoodsNo : " + goods.getGoodsNo() + TeamColor.RESET); // debug
		int removeGoodsRow = goodsService.removeGoods(goods);
		if(removeGoodsRow == 0) {
			return "redirect:/staff/getGoodsListByStaff";
		}
		
		return "redirect:/staff/getGoodsListByStaff";
	}
	
	// 김동현
	// addGoods Form
	@GetMapping("/staff/addGoods")
	public String addGoods(Model model) {
		
		// Category List
		List<Category> categoryList = categoryService.getCategoryList();
		
		log.debug(TeamColor.KDH + "categoryList : " + categoryList + TeamColor.RESET); // debug
		model.addAttribute("categoryList", categoryList);
		
		
		return "staff/addGoods";
	}
	
	// 김동현
	//addGoods Action
	@PostMapping("/staff/addGoods")
	public String addGoods(Model model, GoodsForm goodsForm, HttpSession session) {
		
		log.debug(TeamColor.KDH + "goodsForm : " + goodsForm.toString() + TeamColor.RESET); // debug
		
		if(goodsForm.getGoodsFile() != null) {
			log.debug(TeamColor.KDH + "goodsForm.getGoodsFile().size() : " + goodsForm.getGoodsFile().size() + TeamColor.RESET); // debug
		}
		
		List<MultipartFile> goodsFileList = goodsForm.getGoodsFile();
		
		// 상품정보만 입력하고 File은 첨부 안했을 때
		if(goodsFileList == null || goodsFileList.isEmpty()) {
			String path = null;
			goodsService.addGoods(goodsForm, path);
			return "redirect:/staff/getGoodsListByStaff";
		}
		
		// 이미지파일은 *.jpg or *png만 가능
		for(MultipartFile f : goodsFileList) { 
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("imageMsg", "jpeg, png 파일만 입력이 가능합니다");
				return "on/addGoods";
			} 
		}
		
		String path = session.getServletContext().getRealPath("/goodsFile/");
		goodsService.addGoods(goodsForm, path);
		
		return "redirect:/staff/getGoodsListByStaff";
	}
	
	// 김동현
	// modifyGoods Form
	@GetMapping("/staff/modifyGoods")
	public String modifyGoods(Model model, @RequestParam Integer goodsNo) {
		Map<String, Object> goods = goodsService.getGoodsOne(goodsNo);
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug(TeamColor.KDH + "goods : " +goods.toString() + TeamColor.RESET); // debug
		
		// goodsOne : 사진 리스트 가져오기
		List<GoodsFile> goodsFileList = goodsFileService.getGoodsFileList(goodsNo);
		log.debug(TeamColor.KDH + "goodsFileList : " +goodsFileList.toString() + TeamColor.RESET); // debug
		
		model.addAttribute("goodsFileList", goodsFileList);
		model.addAttribute("goods", goods);
		model.addAttribute("categoryList", categoryList);
		return "staff/modifyGoods";
	}
	
	// 김동현
	// modifyGoods Action
	@PostMapping("/staff/modifyGoods")
	public String modifyGoods(Model model, GoodsForm goodsForm, HttpSession session) {
		log.debug(TeamColor.KDH + "goods : " +goodsForm.toString() + TeamColor.RESET); // debug
		
		if(goodsForm.getGoodsFile() != null) {
			log.debug(TeamColor.KDH + "goodsForm.getGoodsFile().size() : " + goodsForm.getGoodsFile().size() + TeamColor.RESET); // debug
		}
		
		List<MultipartFile> goodsFileList = goodsForm.getGoodsFile();
		
		// 상품정보만 입력하고 File은 첨부 안했을 때
		if(goodsFileList == null || goodsFileList.isEmpty()) {
			String path = null;
			goodsService.modifyGoods(goodsForm, path);
			return "redirect:/staff/getGoodsListByStaff";
		}
		
		// 이미지파일은 *.jpg or *png만 가능
		for(MultipartFile f : goodsFileList) { 
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("imageMsg", "jpeg, png 파일만 입력이 가능합니다");
				return "on/addGoods";
			} 
		}
		
		String path = session.getServletContext().getRealPath("/goodsFile/");
		int modifyGoodsRow = goodsService.modifyGoods(goodsForm, path);
		return "redirect:/staff/getGoodsListByStaff";
	}
	
	// 김동현
	// removeGoodsFile Action
	@GetMapping("/staff/removeGoodsFile")
	public String removeGoodsFile(HttpSession session, @RequestParam Integer goodsFileNo, @RequestParam Integer goodsNo) {
		String path = session.getServletContext().getRealPath("/goodsFile/");
		goodsFileService.removeGoodsFile(goodsFileNo, path);
		return "redirect:/staff/modifyGoods?goodsNo=" + goodsNo;
	}
	
	// home : 메인 페이지 상품 리스트 출력
	@GetMapping("/home")
	public String home(Page page, Model model, @RequestParam(required = false) String searchWord, @RequestParam(required = false) String categoryNo) {
		
		log.debug( TeamColor.KMJ + "GET[GoodsController - home]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "searchWord : " + searchWord + TeamColor.RESET );
		
		// categoryList 가져오기
		List<Category> categoryList = categoryService.getCategoryList();
		
		log.debug(TeamColor.KMJ + "categoryList : " + categoryList + TeamColor.RESET );
		model.addAttribute("categoryList", categoryList);

		// 선택된 category
		log.debug(TeamColor.KMJ + "categoryNo : " + categoryNo + TeamColor.RESET );	
		
		// split으로 ',' 분리 후 List에 담기	
		List<String> categoryNoList = new ArrayList<>();

		if(categoryNo != null ) {

			categoryNoList = Arrays.asList(categoryNo.split(","));
		}
		
		log.debug(TeamColor.KMJ + "categoryNoList : " + categoryNoList.toString() + TeamColor.RESET );	
		
		model.addAttribute("categoryNoList", categoryNoList);
		// 상품리스트 
		Map<String, Object> goodsListMap = goodsService.getGoodsList(page, searchWord, categoryNoList);
		
		log.debug( TeamColor.KMJ + "page : " + page.toString() + TeamColor.RESET );
		
		model.addAttribute("goodsList", goodsListMap.get("goodsList"));
		model.addAttribute("goodsFileList", goodsListMap.get("goodsFileList"));
		model.addAttribute("page", goodsListMap.get("page"));
		model.addAttribute("searchWord", searchWord);
		// pagination용
		model.addAttribute("categoryNo", categoryNo);
		
		return "off/home";
	}

	
	
	
	
	
	
	
	
	
	
	
}
