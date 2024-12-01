package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Category;
import com.example.mall.vo.GoodsCategory;

@Mapper
public interface CategoryMapper { // Author : 김동현
	
	// staff/getCategoryList.jsp
	List<Category> selectCategoryList();
	
	// staff/addCategory.jsp
	Integer insertCategory(Category category);
	
	// staff/getCategoryList.jsp → removeCategory
	Integer deleteCategory(Integer categoryNo);
	
	// staff/addGoods.jsp → addGoodsCategory
	Integer insertGoodsCateogry(GoodsCategory goodsCateogry);
	
	

}
