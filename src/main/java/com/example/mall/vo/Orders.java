package com.example.mall.vo;

import lombok.Data;

@Data
public class Orders {

	private Integer ordersNo; // PK
	private Integer goodsNo; // FK → goods.goodsNo;
	private Integer ordersAmount;
	private Integer paymentNo; // FK → payment.paymentNo
	private String updateDate;
	private String createDate;
}
