package com.example.mall.vo;

import lombok.Data;

@Data
public class Address {
	
	private Integer addressNo; // PK
	private String customerEmail; // FK → customer.customerEmail
	private String addressDetail;
	private String updateDate;
	private String createDate;

}
