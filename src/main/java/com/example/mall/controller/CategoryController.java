package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.mall.service.CategoryService;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Category;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class CategoryController { // Author : 김동현
	
	@Autowired CategoryService categoryService;
	
	// categoryList Form
	@GetMapping("/staff/getCategoryList")
	public String getCategoryList(Model model) {
		
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug(TeamColor.KDH + "categoryList : " + categoryList + TeamColor.RESET); // debug
		
		model.addAttribute("categoryList", categoryList);
		
		return "staff/getCategoryList";
	}
	
	// addCategory Form
	@GetMapping("/staff/addCategory")
	public String addCategory(Model model) {
		return "staff/addCategory";
	}
	
	// addCategory Action
	@PostMapping("/staff/addCategory")
	public String addCategory(Category category) {
		
		log.debug(TeamColor.KDH + "addCategoryInfo : " + category.toString() + TeamColor.RESET); // debug
		int addCategoryRow = categoryService.addCategory(category);
		if(addCategoryRow == 0) {
			return "staff/addCategory";
		}
		
		return "redirect:/staff/getCategoryList";
	}
	
	// removeCategory
	@GetMapping("/staff/removeCategory")
	public String removeCategory(@RequestParam Integer categoryNo, RedirectAttributes redirectAttributes, Model model) {
		
		// 해당 카테고리에 상품이 존재하면 삭제 불가
		Integer result = categoryService.selectCategoryGoods(categoryNo);
		
		if(result != 0) {
			redirectAttributes.addFlashAttribute("categoryMsg", "해당 카테고리에 상품이 존재하여 삭제 불가합니다.");
			
			
			log.debug(TeamColor.KMJ + "해당 카테고리에 상품이 존재하여 삭제 불가합니다." + TeamColor.RESET);
			return "redirect:/staff/getCategoryList";
		}
		
		log.debug(TeamColor.KDH + "removeCategoryNo : " + categoryNo + TeamColor.RESET); // debug
		int removeCategoryRow = categoryService.removeCategory(categoryNo);
		if(removeCategoryRow == 0) {
			return "redirect:/staff/getCategoryList";
		}
		
		return "redirect:/staff/getCategoryList";
	}
	
	

}
