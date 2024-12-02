package com.example.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.vo.GoodsFile;

@Service
@Transactional
public class GoodsFileService {
	
	@Autowired GoodsFileMapper goodsFileMapper;
	
	// getGoodsOne : goodsFileList 가져오기
	public List<GoodsFile> getGoodsFileList(Integer goodsNo){
		
		return goodsFileMapper.selectGoodsFileList(goodsNo);
	}
	
	
}
