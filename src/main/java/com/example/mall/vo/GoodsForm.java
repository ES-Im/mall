package com.example.mall.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsForm { // 김동현
	
	private Integer goodsNo;
	private String goodsTitle;
	private String goodsMemo;
	private Integer goodsPrice;
	private String goodsStatus;
	private List<MultipartFile> goodsFile;
	
	

}
