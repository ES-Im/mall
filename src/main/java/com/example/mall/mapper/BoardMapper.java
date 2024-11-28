package com.example.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Board;
import com.example.mall.vo.Customer;

@Mapper
public interface BoardMapper {
	
	// staff/getBoardListByStaff.jsp
	List<Map<String, Object>> selectBoardListByStaff(Map<String, Object> paramMap);
	
	// staff/getBoardListByStaff.jsp → lastPage 구하기 위한 Count 구하기
	Integer selectCountBoard();
	
	// staff/getBoardList.jsp → removeBoardByStaff : Integer ordersNo → board에 ordersNo 
	Integer deleteBoardByStaff(Integer ordersNo);

	// getGoodsOne : 후기 등록
	Integer insertBoardOne(Board board);
	
	
	
}
