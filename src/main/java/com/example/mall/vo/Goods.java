package com.example.mall.vo;

import lombok.Data;


@Data
public class Goods {

	private Integer goodsNo; // PK
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsStatus;
	private String updateDate;
	private String createDate;
	
	
	
	
}
