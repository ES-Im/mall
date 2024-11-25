package com.example.mall.vo;

import lombok.Data;

@Data
public class Payment {

	private Integer paymentNo; // PK
	private Integer addressNo; // FK → address.addressNo
	private Integer paymentPrice;
	private String paymentMethod;
	private String paymentStatus;
	private String updateDate;
	private String createDate;
	
}
