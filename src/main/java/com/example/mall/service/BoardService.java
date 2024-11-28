package com.example.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mall.mapper.BoardMapper;
import com.example.mall.util.TeamColor;
import com.example.mall.vo.Board;
import com.example.mall.vo.Customer;
import com.example.mall.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	
	@Autowired BoardMapper boardMapper;
	
	// 후기 리스트 조회 - 김동현
	public Map<String, Object> getBoardListByStaff(Page page) {
		
		page.setRowPerPage(4);
		Integer beginRow = page.getBeginRow();
		Integer rowPerPage = page.getRowPerPage();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// boardList
		List<Map<String, Object>> boardList = boardMapper.selectBoardListByStaff(paramMap);
		
		Integer totalCount = boardMapper.selectCountBoard();
		
		Integer lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage++;
		}
		
		log.debug( TeamColor.KDH + "BoardListLastPage : " + lastPage + TeamColor.RESET ); // debug
		page.setLastPage(lastPage);
		
		Map<String, Object> boardListMap = new HashMap<>();
		boardListMap.put("boardList", boardList);
		boardListMap.put("page", page);
		
		return boardListMap;
	}

	// 후기 리스트 삭제 - 김동현
	public Integer removeBoardByStaff(Integer ordersNo) {
		return boardMapper.deleteBoardByStaff(ordersNo);
	}
	
	
	// 김문정
	// getGoodsOne : 후기 등록
	public Integer addBoardOne(Integer ordersNo, String boardContent){
		log.debug( TeamColor.KMJ + "GET[BoardController - addBoardOne]" + TeamColor.RESET );
		
		log.debug( TeamColor.KMJ + "ordersNo : " + ordersNo + TeamColor.RESET );
		log.debug( TeamColor.KMJ + "boardContent : " + boardContent + TeamColor.RESET );
		
		Board board = new Board(); 
		board.setOrdersNo(ordersNo);;
		board.setBoardContent(boardContent);

		Integer result = boardMapper.insertBoardOne(board);
		
		return result;
	}
	
	
	

}
