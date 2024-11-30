package com.example.mall.vo;

import lombok.Data;

@Data
public class Cart {
	
	private Integer cartNo; // PK
	private String customerEmail; // FK → customer.customerEmail
	private Integer goodsNo; // FK → goods.goodsNo
	private Integer cartAmount;
	private String updateDate;
	private String createDate;
}
