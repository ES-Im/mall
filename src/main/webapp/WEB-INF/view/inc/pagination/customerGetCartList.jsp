<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!-- 탬플릿, CSS : 김문정 & HTML : 김은서 -->  
      
<style>
		.pagination {
		  display: flex;
  		  justify-content: center;
		}
		
		.pagination a {
		  color: #5D5D5D;
		  float: left;
		  padding: 6px 12px;
		  text-decoration: none;
		  border: 1px solid #ddd;
		}
		
		.pagination a.active {
		  background-color: #5D5D5D;
		  color: white;
		  border: 1px solid #5D5D5D;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
		
		.pagination a:first-child {
		  border-top-left-radius: 5px;
		  border-bottom-left-radius: 5px;
		}
		
		.pagination a:last-child {
		  border-top-right-radius: 5px;
		  border-bottom-right-radius: 5px;
		}
</style>

<section class="py-5">
    <div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
                    
        <!-- 첫 페이지 -->
        <c:if test="${!(page.currentPage > 1)}">
            <a href="" style="pointer-events: none;">&laquo;</a>
        </c:if>
        <c:if test="${page.currentPage > 1}">
            <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=1">&laquo;</a>
        </c:if>
        
        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
        <c:set var="previousGroupEnd" value="${(page.currentPage - 1) - ((page.currentPage - 1) % page.numPerPage)}"></c:set>
        
		<c:if test="${page.currentPage <= page.numPerPage}">
		   <a href="" style="pointer-events: none;">
		      Previous
		   </a>
		</c:if>
		
		<c:if test="${page.currentPage > page.numPerPage}">
		   <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${previousGroupEnd}">
		      Previous
		   </a>
		</c:if>
		
        <!-- 페이지 번호 링크 -->
        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
            <c:if test= "${num == page.currentPage}">
                <a class="active">${num}</a>
            </c:if>
            <c:if test= "${num != page.currentPage}">
                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${num}">${num}</a>
            </c:if>
        </c:forEach>
        
    
        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
        				마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
        <c:set var="nextGroupStart" value="${(page.currentPage - 1) - ((page.currentPage - 1) % page.numPerPage) + page.numPerPage + 1}"></c:set>
        <c:set var="lastGroupStart" value="${page.lastPage - (page.lastPage)%page.numPerPage + 1}"></c:set>
        
        <c:if test="${lastGroupStart > nextGroupStart}">
		    <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${nextGroupStart}">
		        Next
		    </a>
		</c:if>
		
		<c:if test="${(lastGroupStart <= nextGroupStart) && (lastGroupStart > page.currentPage)}">
		    <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${lastGroupStart}">
		        Next
		    </a>
		</c:if>
		
		<c:if test="${lastGroupStart <= page.currentPage}">
		    <a href="" style="pointer-events: none;">
		        Next
		    </a>
		</c:if>
        
        <!-- 마지막 페이지 -->
        <c:if test="${!(page.currentPage < page.lastPage)}">
            <a href="" style="pointer-events: none;">&raquo;</a>
        </c:if>
        <c:if test="${page.currentPage < page.lastPage}">
            <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${page.lastPage}">&raquo;</a>
        </c:if>
    </div>
</section>
