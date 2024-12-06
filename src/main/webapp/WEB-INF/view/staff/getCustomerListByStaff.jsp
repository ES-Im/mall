<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			// 삭제 버튼 클릭
			$('.btnRemoveCustomer').click(function(event) {
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
		.customer-link {
        	color: black;
        	text-decoration: none;
        }
        
        .customer-link:hover {
            color: #D8D8D8;
            text-decoration: none;
        }
        
        .customer-link:visited {
        	color: black;
        	text-decoration: none;
        }
		
		/* pagination */
		/* .pagination {
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
		} */
		
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
	<title>Customer List</title>
</head>

<body>
	<!-- header -->
	<div>
		<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	</div>
	
		
	<div class="row">
        <!-- leftbar -->
		<div class="col-sm-2 p-0">
			<c:import url="/WEB-INF/view/inc/staffLeftMenu.jsp"></c:import>
		</div>
		
		<!-- main -->
		<div class="col-sm-10 p-0">
			<div style="margin-left: 80px; margin-top: 90px;">
			<h3>고객 목록</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="list-group">
	  			<c:if test="${empty customerList}">
 					<span>No Data</span>
 				</c:if>
				<c:forEach var="customer" items="${customerList}">
					<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;">
    					<div class="d-flex gap-2 w-100 justify-content-between">
			        <div>
						<i class="bi bi-person-fill"> ${customer.customerEmail}</i>
			        	<p class="mb-1">Gender : ${customer.customerGender}</p>
			        	<div class="justify-content-between">
			        		<p class="mb-1">Birth : ${customer.customerBirth}</p>
			        	</div>
			        </div>
			        <div>
		        		<div style="text-align: right;">
						    <a href="${pageContext.request.contextPath}/staff/removeCustomerByStaff?customerEmail=${customer.customerEmail}" class="btnRemoveCustomer btn btn-sm btn-outline-danger">remove</a>
						</div>
		        		<br>
		        		<small class="opacity-75 text-nowrap">CreateDate : ${customer.createDate}</small>
	        		</div>
	        			</div>
			    	</div>
			    	<br>
				</c:forEach>
 					
 					
				<!-- PAGINATION -->
				<c:if test="${not empty customerList}">
					<section class="py-5">
						<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
										
							<!-- 첫 페이지 -->
							<c:choose>
								<c:when test="${!(page.currentPage > 1)}">
									<a href="" style="pointer-events: none;">&laquo;</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=1">&laquo;</a>
								</c:otherwise>
							</c:choose>
							
							<!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
							<c:choose>
								<c:when test="${page.getPreviousGroupEnd() <= 0}">
									<a href="" style="pointer-events: none;">
										Previous
									</a>
								</c:when>
								
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=${page.getPreviousGroupEnd()}">
										Previous
									</a>
								</c:otherwise>
							</c:choose>
							
							<!-- 페이지 번호 링크 -->
							<c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
								<c:if test= "${num == page.currentPage}">
									<a class="active">${num}</a>
								</c:if>
								<c:if test= "${num != page.currentPage}">
									<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=${num}">${num}</a>
								</c:if>
							</c:forEach>
							
						
							<!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
											마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
							
							<c:choose>
								<%-- 만약 현재 그룹이 마지막 페이지 그룹이라면 이동 불가--%>
								<c:when test="${page.currentPage >= page.getLastGroupStart()}">
									<a href="" style="pointer-events: none;">
										Next
									</a>
								</c:when>
								<%-- 만약 다음 그룹이 마지막 페이지 그룹이라면 마지막 그룹의 첫 번째 번호로 이동--%>
								<c:when test="${page.getNextGroupStart() + page.numPerPage >= page.lastPage}">
									<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=${page.getLastGroupStart()}">
										Next
									</a>
								</c:when>
								<%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=${page.getNextGroupStart()}">
										Next
									</a>
								</c:otherwise>
							</c:choose>

							<!-- 마지막 페이지 -->
							<c:if test="${!(page.currentPage < page.lastPage)}">
								<a href="" style="pointer-events: none;">&raquo;</a>
							</c:if>
							<c:if test="${page.currentPage < page.lastPage}">
								<a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff?currentPage=${page.lastPage}">&raquo;</a>
							</c:if>
							
						</div>
					</section>
				</c:if>
	  		</div>
		</div>
	</div>
</body>
</html>