package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.GoodsMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Goods;
import com.example.mall.vo.GoodsForm;
import com.example.mall.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class GoodsService {
	
	@Autowired GoodsMapper goodsMapper;
	
	// Author : 김문정
	// getGoodsOne : 상품 상세보기 
	public Goods getGoodsOne(Integer goodsNo){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsOne]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		Goods goods = goodsMapper.selectGoodsOne(goodsNo);
		
		return goods;
	}
	
	// getGoodsOne : 후기 리스트
	public List<Map<String, Object>> getBoardListByGoodsNo(Integer goodsNo){
		log.debug( TeamColor.KMJ + "[GoodsService - getBoardListByGoodsNo]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "goodsNo : " + goodsNo + TeamColor.RESET );
		
		List<Map<String, Object>> boardList = goodsMapper.selectBoardListByGoodsNo(goodsNo);

		return boardList;
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
	public void addGoods(GoodsForm goodsForm) {
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsStatus(goodsForm.getGoodsStatus());
		
		int addGoodsRow = goodsMapper.insertGoods(goods);
		log.debug( TeamColor.KDH + "addGoodsRow : " + addGoodsRow + TeamColor.RESET ); // debug
		
		Integer goodsNo = goods.getGoodsNo(); // selectKet 값
		if(addGoodsRow == 1 && goodsForm.getGoodsFile() != null) {
			// GoodsFile 입력
		}
	}
	
	
//	public void addActor(ActorForm actorForm, String path) {
//		Actor actor = new Actor();
//		actor.setFirstName(actorForm.getFirstName());
//		actor.setLastName(actorForm.getLastName());
//
//		int insertActorRow = actorMapper.insertActor(actor);
//		int actorId = actor.getActorId(); // mybatis selectKey의 값
//
//		if (insertActorRow == 1 && actorForm.getActorFile() != null) {
//			// 파일 입력, ActorFile 입력
//			List<MultipartFile> fileList = actorForm.getActorFile();
//			for (MultipartFile mf : fileList) {
//				ActorFile actorFile = new ActorFile();
//				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
//				String originname = mf.getOriginalFilename().substring(0, dotIdx);
//				String filename = UUID.randomUUID().toString().replace("-", "");
//				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
//
//				actorFile.setActorId(actorId);
//				actorFile.setOriginname(originname);
//				actorFile.setFilename(filename);
//				actorFile.setExt(ext);
//				actorFile.setType(mf.getContentType());
//				actorFile.setSize(mf.getSize());
//
//				int insertActorFileRow = actorFileMapper.insertActorFile(actorFile);
//				if (insertActorFileRow == 1) {
//					// 물리적 파일 저장
//					try {
//						mf.transferTo(new File(path + filename + "." + ext));
//					} catch (Exception e) {
//						e.printStackTrace();
//						// 예외 발생하고 예외처리 하지 않아야지 @Transactional이 작동한다.
//						// RuntimeException을 인위적으로 발생
//						throw new RuntimeException();
//					}
//				}
//			}
//		}
//	}
	
	
	// 김문정
	// home : 메인 페이지 상품 리스트 출력
	public Map<String, Object> getGoodsList(Page page, String searchWord){
		log.debug( TeamColor.KMJ + "[GoodsService - getGoodsList]" + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "searchWord : " + searchWord + TeamColor.RESET );
		
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// goodsList.
		List<Goods> goodsList = goodsMapper.selectGoodsList(paramMap);
		
		// goodsList의 마지막 페이지 구하기
		Integer totalRow = goodsMapper.selectGoodsListLastPage(searchWord);
		
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
