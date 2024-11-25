package com.example.mall.vo;

import lombok.Data;

@Data
public class GoodsFile {

	private Integer goodsFileNo; // PK
	private Integer goodsNo; // FK → goods.goodsNo
	private String goodsFileName;
	private String goodsFileOriginName;
	private String goodsFileExt;
	private String goodsFileType;
	private String goodsFileSize;
	private String createDate;
	private String updateDate;
}
