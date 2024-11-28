package com.example.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String removeCategory(@RequestParam Integer categoryNo) {
		
		log.debug(TeamColor.KDH + "removeCategoryNo : " + categoryNo + TeamColor.RESET); // debug
		int removeCategoryRow = categoryService.removeCategory(categoryNo);
		if(removeCategoryRow == 0) {
			return "redirect:/staff/getCategoryList";
		}
		
		return "redirect:/staff/getCategoryList";
	}
	
	

}
