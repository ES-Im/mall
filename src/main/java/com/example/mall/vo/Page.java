package com.example.mall.vo;

import lombok.Data;

@Data
public class Page {
	// currentPage, rowperPage, numperPage 디폴트값 설정 
    private Integer currentPage = 1;
    private Integer rowPerPage = 8;
    private Integer numPerPage = 10;
    private Integer lastPage;
    
    // beginRow, StartPaging, EndPage는 get으로만 호출 가능
    // 쿼리 Limit 설정시 사용하는 메서드
    public Integer getBeginRow() {
        return this.currentPage == null? 1 : (this.currentPage - 1) * this.rowPerPage;
    }
    
    // 현재 페이지가 속한 페이징 그룹의 첫 번째 번호를 계산
    public Integer getStartPagingNum() {
        return this.currentPage == null? 1 : (this.currentPage - 1) / this.numPerPage * this.numPerPage + 1;
    }
    
    // 페이징 그룹의 마지막 번호를 계산하며 lastPage를 초과하지 않음
    public Integer getEndPagingNum() {
        return Math.min((this.getStartPagingNum() + (this.numPerPage - 1)), this.lastPage);
    }
    
    // 이전 그룹의 마지막 번호를 계산, -1을 반환시 이동 불가
    public Integer getPreviousGroupEnd() {
    	return (this.currentPage - 1) - ((this.currentPage - 1) % this.numPerPage);
    }
    
    // 다음 그룹의 첫 번째 번호를 반환, -1을 반환시 이동 불가 (마지막 그룹을 초과하지 않음)
    public Integer getNextGroupStart() {
    	return (this.getLastGroupStart() > this.currentPage)? (this.currentPage - 1) - ((this.currentPage - 1) % this.numPerPage) + this.numPerPage + 1 : 0;
    }
    
    // 마지막 그룹의 첫 번째 번호를 계산
    public Integer getLastGroupStart() {
    	int index = this.lastPage - ((this.lastPage) % this.numPerPage) + 1;
    	return (index > lastPage) ? index - this.numPerPage : index;  
    }
}