<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
	    // 삭제 버튼 클릭
	    $('.btnRemoveBoard').click(function(event) {
	        // 기본 링크 클릭 동작을 막기 (페이지 이동을 막기)
	        event.preventDefault();
	        
	        // 삭제 확인 
	        var result = confirm("정말로 삭제하시겠습니까?");
	        if (result) {
	        	window.location.href = $(this).attr('href');
	        	alert('삭제 성공하였습니다.');
	        } else {
	            return false;
	        }
	    });
	});
	</script>
	<style>
		.goods-link {
        	color: black;
        	text-decoration: none;
        }
        
        .goods-link:hover {
            color: #D8D8D8;
            text-decoration: none;
        }
        
        .goods-link:visited {
        	color: black;
        	text-decoration: none;
        }
		
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
<meta charset="UTF-8">
<title>Board List ByStaff</title>

</head>
<body>
<div class="row">
	<!-- leftbar -->
	<div class="col-sm-2 p-0">
		<div >
			<c:import url="/WEB-INF/view/inc/staffLeftMenu.jsp"></c:import>
		</div>
	</div>
	
	<!-- main -->
	<div class="col-sm-10 p-0">
		<!-- header -->
		<div>
			<c:import url="/WEB-INF/view/inc/staffHeader.jsp"></c:import>
		</div>
		<!-- main -->
		<div style="margin-left: 80px; margin-top: 30px;">
			<h3>Staff Board Management</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="list-group">
 					<c:forEach var="board" items="${boardList}">
 						<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;">
      						<div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
	      							<i class="bi bi-chat-right-text-fill">&nbsp;&nbsp;${board.customerEmail}</i>
	      							<p class="mb-1">OrderNo : ${board.ordersNo}</p>
	      							<p class="mb-1"><a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${board.goodsNo}" class="goods-link">
						        		Goods : [${board.goodsNo}] ${board.goodsTitle}
						        	</a></p>
						        	<small class="opacity-75 text-nowrap">CreateDate : ${board.createDate}</small>
					        		<p class="mb-1">BoardContent : ${board.boardContent}</p>
						        </div>
						        <div>
					        		<div style="text-align: right;">
									    <a href="${pageContext.request.contextPath}/staff/removeBoardByStaff?ordersNo=${board.ordersNo}" class="btnRemoveBoard btn btn-sm btn-outline-danger">remove</a>
									</div>
					        		<br>
				        		</div>
			        		</div>	
			    		</div>
			    	<br>
 					</c:forEach>
 					<!-- PAGINATION -->
    				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
					<!-- 첫 페이지 -->
					<c:if test="${!(page.currentPage > 1)}">
						<a href="" style="pointer-events: none;">&laquo;</a>
					</c:if>
					<c:if test="${page.currentPage > 1}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=1">&laquo;</a>
					</c:if>
					
					<!-- 페이지 - 10 -->
					<c:if test="${!(page.currentPage > 10)}">
						<a href="" style="pointer-events: none;">&lt;</a>
					</c:if>
					<c:if test="${page.currentPage > 10}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${page.currentPage - 10}">
							&lt;
						</a>
					</c:if>
					
					<!-- 이전 페이지 -->
					<c:if test="${!(page.currentPage > 1)}">
						<a href="" style="pointer-events: none;">Previous</a>
					</c:if>
					<c:if test="${page.currentPage > 1}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${page.currentPage - 1}">
							Previous
						</a>
					</c:if>
					
					<!-- 페이지 번호 링크 -->
					<c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
						<c:if test= "${num == page.currentPage}">
							<a class="active">${num}</a>
						</c:if>
						<c:if test= "${num != page.currentPage}">
							<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${num}">${num}</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 페이지 -->
					<c:if test="${!(page.currentPage < page.lastPage)}">
						<a href="" style="pointer-events: none;">Next</a>
					</c:if>
					
					<c:if test="${page.currentPage < page.lastPage}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${page.currentPage + 1}">
							Next
						</a>
					</c:if>
					
					<!-- 페이지 + 10 -->
					<c:if test="${!(page.currentPage < page.lastPage)}">
						<a href="" style="pointer-events: none;">&gt;</a>
					</c:if>
					
					<c:if test="${page.currentPage < page.lastPage}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${page.currentPage + 10}">
							&gt;
						</a>
					</c:if>
					
					<!-- 마지막 페이지 -->
					<c:if test="${!(page.currentPage < page.lastPage)}">
						<a href="" style="pointer-events: none;">&raquo;</a>
					</c:if>
					<c:if test="${page.currentPage < page.lastPage}">
						<a href="${pageContext.request.contextPath}/staff/getBoardListByStaff?currentPage=${page.lastPage}">&raquo;</a>
					</c:if>
					</div>
	  		</div>
		</div>
	</div>
</div>
<!-- footer -->

</body>
</html>