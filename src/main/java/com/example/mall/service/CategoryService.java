package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.CategoryMapper;
import com.example.mall.vo.Category;

@Service
@Transactional
public class CategoryService { // Author : 김동현

	@Autowired CategoryMapper categoryMapper;
	
	// 카테고리 리스트
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
	
	// 카테고리 추가
	public Integer addCategory(Category category) {
		return categoryMapper.insertCategory(category);
	}
	
	// 카테고리 삭제
	public Integer removeCategory(Integer categoryNo) {
		return categoryMapper.deleteCategory(categoryNo);
	}
	
	// 카테고리 삭제를 위해 해당 카테고리에 등록된 상품 유무 조회
	public Integer selectCategoryGoods(Integer categoryNo) {
		return categoryMapper.selectCategoryGoods(categoryNo);
	}
	
	
}
