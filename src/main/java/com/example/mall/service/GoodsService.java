package com.example.mall.service;

import java.io.File;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.mall.mapper.CategoryMapper;
import com.example.mall.mapper.GoodsFileMapper;
import com.example.mall.mapper.GoodsMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsCategory;
import com.example.mall.vo.GoodsFile;
import com.example.mall.vo.GoodsForm;
import com.example.mall.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class GoodsService {
	
	@Autowired GoodsMapper goodsMapper;
	@Autowired GoodsFileMapper goodsFileMapper;
	@Autowired CategoryMapper categoryMapper;
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 
	public Map<String, Object> getGoodsOne(Integer goodsNo){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsOne]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		Map<String, Object> getGoodsOne = goodsMapper.selectGoodsOne(goodsNo);
		
		return getGoodsOne;
	}
	
	// getGoodsOne : 후기 리스트
	public Map<String, Object> getBoardListByGoodsNo(Integer goodsNo, Page page){
		log.debug( TeamColor.KMJ + "[GoodsService - getBoardListByGoodsNo]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );

		page.setRowPerPage(5);
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("goodsNo", goodsNo);
		
		List<Map<String, Object>> boardList = goodsMapper.selectBoardListByGoodsNo(paramMap);
		
		// 후기 리스트 마지막 페이지 구하기
		Integer boardTotalRow = goodsMapper.selectCountboardList(goodsNo);
		
		Integer boardListLastPage = boardTotalRow / rowPerPage;
		if(boardTotalRow % rowPerPage != 0) {
			boardListLastPage++;
		}
		
		log.debug( TeamColor.KMJ + "boardListLastPage : " + boardListLastPage + TeamColor.RESET );
		
		page.setLastPage(boardListLastPage);
	
		
		Map<String, Object> boardListMap = new HashMap<>();
		paramMap.put("boardList", boardList);
		paramMap.put("page", page);

		return boardListMap;
	}
	
	// getGoodsOne : 후기 작성 가능한 회원
	public List<Map<String, Object>> getEligibleReviewers(Integer goodsNo, String loginCustomer){
		log.debug( TeamColor.KMJ + "[GoodsService - getEligibleReviewers]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "loginCustomer : " + loginCustomer + TeamColor.RESET );
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("loginCustomer", loginCustomer);
		paramMap.put("goodsNo", goodsNo);

		List<Map<String, Object>> eligibleReviewersMap = goodsMapper.selectEligibleReviewers(paramMap);
		
		return eligibleReviewersMap;
		
	}
	
	// 김동현
	// getGoodsList.jsp
	public Map<String, Object> getGoodsListByStaff(Page page, String searchWord) {
		
		page.setRowPerPage(5);
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// boardList
		List<Map<String, Object>> goodsList = goodsMapper.selectGoodsListByStaff(paramMap);
		
		Integer totalCount = goodsMapper.selectCountGoods(searchWord);
		
		Integer lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		log.debug( TeamColor.KDH + "GoodsListLastPage : " + lastPage + TeamColor.RESET ); // debug
		page.setLastPage(lastPage);
		
		Map<String, Object> goodsListMap = new HashMap<>();
		goodsListMap.put("goodsList", goodsList);
		goodsListMap.put("page", page);
		
		return goodsListMap;
	}
	
	// 김동현
	// getGoodsList.jsp → removeGoods
	public Integer removeGoods(Goods goods) {
		return goodsMapper.deleteGoods(goods);
	}
	
	// 김동현
	// addGoods.jsp
	public void addGoods(GoodsForm goodsForm, String path) {
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsStatus(goodsForm.getGoodsStatus());
		
		int addGoodsRow = goodsMapper.insertGoods(goods);
		log.debug( TeamColor.KDH + "addGoodsRow : " + addGoodsRow + TeamColor.RESET ); // debug
		
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goods.getGoodsNo());
		goodsCategory.setCategoryNo(goodsForm.getCategoryNo());
		int addGoodsCateogryRow = categoryMapper.insertGoodsCateogry(goodsCategory);
		
		Integer goodsNo = goods.getGoodsNo(); // selectKet 값
		if(addGoodsRow == 1 && goodsForm.getGoodsFile() != null) {
			// GoodsFile 입력
			List<MultipartFile> goodsFileList = goodsForm.getGoodsFile();
			for (MultipartFile mf : goodsFileList) {
				GoodsFile goodsFile = new GoodsFile();
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String orginName = mf.getOriginalFilename().substring(0, dotIdx);
				String fileName = UUID.randomUUID().toString().replace("-", "");
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				
				goodsFile.setGoodsNo(goodsNo);
				goodsFile.setGoodsFileOriginName(orginName);
				goodsFile.setGoodsFileName(fileName);
				goodsFile.setGoodsFileExt(ext);
				goodsFile.setGoodsFileType(mf.getContentType());
				goodsFile.setGoodsFileSize(String.valueOf(mf.getSize()));
				
				int addGoodsFileRow = goodsFileMapper.insertGoodsFile(goodsFile);
				if(addGoodsFileRow == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + fileName + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException();
					}
				}
			}
		}
	}
	
	// 김동현
	// modifyGoods.jsp : 상품 수정 페이지
	public Integer modifyGoods(GoodsForm goodsForm, String path) {
		
		Goods goods = new Goods();
		goods.setGoodsNo(goodsForm.getGoodsNo());
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsStatus(goodsForm.getGoodsStatus());
		
		Integer modifyGoodsRow = goodsMapper.updateGoods(goods);
		
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goods.getGoodsNo());
		goodsCategory.setCategoryNo(goodsForm.getCategoryNo());
		
		Integer modifyGoodsCateogryRow = categoryMapper.updateGoodsCategory(goodsCategory);
		
		if(goodsForm.getGoodsFile() != null) {
			// GoodsFile 입력
			List<MultipartFile> goodsFileList = goodsForm.getGoodsFile();
			for (MultipartFile mf : goodsFileList) {
				GoodsFile goodsFile = new GoodsFile();
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String orginName = mf.getOriginalFilename().substring(0, dotIdx);
				String fileName = UUID.randomUUID().toString().replace("-", "");
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				
				goodsFile.setGoodsNo(goodsForm.getGoodsNo());
				goodsFile.setGoodsFileOriginName(orginName);
				goodsFile.setGoodsFileName(fileName);
				goodsFile.setGoodsFileExt(ext);
				goodsFile.setGoodsFileType(mf.getContentType());
				goodsFile.setGoodsFileSize(String.valueOf(mf.getSize()));
				
				int addGoodsFileRow = goodsFileMapper.insertGoodsFile(goodsFile);
				if(addGoodsFileRow == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + fileName + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException();
					}
				}
			}
		}
		
		return 1;
	}
	
	
	
	// 김문정
	// home : 메인 페이지 상품 리스트 출력
	public Map<String, Object> getGoodsList(Page page, String searchWord, List<String> categoryNoList){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsList]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "searchWord : " + searchWord + TeamColor.RESET );
		page.setRowPerPage(6);
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
				
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("categoryNoList", categoryNoList);
		
		// goodsList. : 상품 리스트 (사진 포함)
		List<Map<String, Object>> goodsList = goodsMapper.selectGoodsList(paramMap);
		
		
		
	
		
		// goodsList의 마지막 페이지 구하기
		Integer totalRow = goodsMapper.selectGoodsListLastPage(paramMap);
		
		Integer goodsListLastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			goodsListLastPage++;
		}
		
		log.debug( TeamColor.KMJ + "goodsListLastPage : " + goodsListLastPage + TeamColor.RESET );
		
		page.setLastPage(goodsListLastPage);
	
		// goodsList + Page
		Map<String, Object> goodsListMap = new HashMap<>();
		goodsListMap.put("goodsList", goodsList);
		goodsListMap.put("page", page);

		return goodsListMap;
	}
	
	
	
	
	
	

}
