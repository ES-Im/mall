package com.example.mall.vo;

import lombok.Data;

@Data
public class Staff {

	private Integer staffNo; // PK
	private String staffId;
	private String staffPw;
	private String firstName;
	private String lastName;
	private String updateDate;
	private String createDate;
	
}
