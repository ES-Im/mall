package com.example.mall.vo;

import lombok.Data;

@Data
public class Customer {

	private String customerEmail; // PK
	private String customerPw;
	private String customerBirth;
	private String customerGender;
	private String updateDate;
	private String createDate;
}
