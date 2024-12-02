package com.example.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.GoodsFile;

@Mapper
public interface GoodsFileMapper {
	
	// Author : 김동현
	// addGoods.jsp → 사진 파일 추가 
	Integer insertGoodsFile(GoodsFile goodsFile);

	// getGoodsOne : 사진 리스트
	List<GoodsFile> selectGoodsFileList(Integer goodsNo);
	
	// modifyGoods.jsp →  selectGoodsFileOne : 파일 삭제할때 파일 정보 가져오기 
	GoodsFile selectGoodsFileOne(Integer goodsFileNo);
	
	// modifyGoods.jsp → deleteGoodsFile : 파일 삭제하기
	Integer deleteGoodsFile(Integer goodsFileNo);
	
	
	
}
