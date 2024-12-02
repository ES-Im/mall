package com.example.mall.service;

import java.io.File;
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
	
	// modifyGoods.jsp → removeGoodsFile : 파일 삭제 하기
	public Integer removeGoodsFile(Integer goodsFileNo, String path) {
		GoodsFile goodsFile = goodsFileMapper.selectGoodsFileOne(goodsFileNo);
		
		Integer removeGoodsFileRow = goodsFileMapper.deleteGoodsFile(goodsFileNo);
		
		if(removeGoodsFileRow == 1) {
			String fullname = path + goodsFile.getGoodsFileName() + "." + goodsFile.getGoodsFileExt();
			File file = new File(fullname);
			file.delete();
		}
		
		return 1;
	}
	
}
