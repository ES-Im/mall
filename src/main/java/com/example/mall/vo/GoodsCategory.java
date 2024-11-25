package com.example.mall.vo;

import lombok.Data;

@Data
public class GoodsCategory {

	private Integer goodsNo; // PK, FK → goods.goodsNo
	private Integer categoryNo; // PK, FK → category.categoryNo
	private String updateDate;
	private String createDate;
}
