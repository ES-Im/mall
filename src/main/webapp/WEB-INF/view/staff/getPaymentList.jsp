<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		
		
	 	
	 	
	 	
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
		
		/* pagination */
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
<title>PAYMENT LIST</title>
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
			<div>
				<h3>PAYMENT LIST</h3>
			</div>
			
		</div>
		
		<!-- updateDate 기준으로 그룹화 출력 -->
        <c:set var="previousDate" value="" /> <!-- 이전 날짜를 저장할 변수 -->
        
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="list-group">
	  			
	  			<!-- paymentList 반복문 -->
 				<c:forEach var="payment" items="${paymentList}">
 				
                <!-- paymentNo/회원 아이디 기준 추출 -->
            
                    <div class="d-flex gap-1 py-1 bg-light" style="width: 1000px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 10px; padding: 10px;">
                    	<div class="d-flex align-items-center" style="width: 100%;">
                        	<div class="me-3" style="margin-left: 20px;" >
                            	<span> PaymentNo : ${payment.paymentNo } / ${payment.customerEmail }</span>
                          	</div>
                          	<div>Payment Status : ${payment.paymentStatus }</div>
                          	<div>
                          		<c:if test="${payment.paymentStatus == '결제완료' }">
	                          		<a href="${pageContext.request.contextPath}/staff/modifyPaymentStatus?paymentNo=${payment.paymentNo}&paymentStatus=배송중"><button type="button" class="btn btn-sm btn-outline-primary mt-2" disabled style="opacity: 1;"> 배송시작 </button></a>
	                          		<a href="${pageContext.request.contextPath}/staff/modifyPaymentStatus?paymentNo=${payment.paymentNo}&paymentStatus=결제취소"><button type="button" class="btn btn-sm btn-outline-danger mt-2" disabled style="opacity: 1;"> 결제취소 </button></a>
                          		</c:if>
                          	</div>
                       
                      	</div>
                  	</div>
              		
              		<!-- 해당 페이먼트의 orders 출력을 위한 반복문 -->
              		<c:forEach var="orders" items="${PayInfoListByPaymentNo}">
              	
              			<!-- 이미지 -->
	 					<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 1000px;">
	 						<div class="d-flex justify-content-center align-items-center">
	 							<!-- 파일 있을 때 -->
	 							<c:if test="${not empty orders.goodsFileNo}">
	 								<img src="${pageContext.request.contextPath}/goodsFile/${orders.goodsFileName}.${orders.goodsFileExt}" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
	 							</c:if>
	 							<!-- 파일 없을 때 -->
	 							<c:if test="${empty goods.goodsFileNo}">
	 								<div style="align-items: center;">
	 									<img src="${pageContext.request.contextPath}/goodsFile/Preparing_the_product_img.jpg" alt="Preparing the product Image" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
	 								</div>
	 							</c:if>
	 						</div>
	 						
	 						<!-- 주문 정보 -->
	      					<div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
						        	
	      							<p class="mt-2 mb-0"><small>OrdersNo : ${orders.ordersNo}</small></p>
	      							<div class="d-flex justify-content-between">
									    <div style="flex-grow: 1;"> 
									        <p class="mt-2 mb-0"><small>주문 상품 :${orders.categoryTitle} / ${orders.goodsTitle}</small></p>
									        <p class="mt-2 mb-0"><small>상품 가격 :${orders.goodsPrice}</small></p>
									        <p class="mt-2 mb-0"><small>주문 수량 : ${orders.ordersAmount}</small></p>
									    </div>
									    
									</div>
									<div>
								        <small class="opacity-75">payment status : ${payment.paymentStatus}</small>
								    </div>
						        </div>
				        	</div>
				    	</div>
			    	</c:forEach><!-- orders 반복문 끝 -->
			    	
			    	<div class="d-flex justify-content-end mt-2 align-items-center">
			        	<p class="h4">TOTAL PRICE : ${payment.paymentPrice}</p>
			        </div>
			        <br>
 				</c:forEach>
 				
 				<!-- pagination -->				
				<section class="py-5">
				    <div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
				                    
				        <!-- 첫 페이지 -->
				        <c:if test="${!(page.currentPage > 1)}">
				            <a href="" style="pointer-events: none;">&laquo;</a>
				        </c:if>
				        <c:if test="${page.currentPage > 1}">
				            <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=1">&laquo;</a>
				        </c:if>
				        
				        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
				        <c:set var="previousGroupEnd" value="${(page.currentPage - 1) - ((page.currentPage - 1) % page.numPerPage)}"></c:set>
				        
						<c:if test="${page.currentPage <= page.numPerPage}">
						   <a href="" style="pointer-events: none;">
						      Previous
						   </a>
						</c:if>
						
						<c:if test="${page.currentPage > page.numPerPage}">
						   <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=${previousGroupEnd}">
						      Previous
						   </a>
						</c:if>
						
				        <!-- 페이지 번호 링크 -->
				        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
				            <c:if test= "${num == page.currentPage}">
				                <a class="active">${num}</a>
				            </c:if>
				            <c:if test= "${num != page.currentPage}">
				                <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=${num}">${num}</a>
				            </c:if>
				        </c:forEach>
				        
				    
				        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
				        				마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
				        <c:set var="nextGroupStart" value="${(page.currentPage - 1) - ((page.currentPage - 1) % page.numPerPage) + page.numPerPage + 1}"></c:set>
				        <c:set var="lastGroupStart" value="${page.lastPage - (page.lastPage)%page.numPerPage + 1}"></c:set>
				        
				        <c:if test="${lastGroupStart > nextGroupStart}">
						    <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=${nextGroupStart}">
						        Next
						    </a>
						</c:if>
						
						<c:if test="${(lastGroupStart <= nextGroupStart) && (lastGroupStart > page.currentPage)}">
						    <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=${lastGroupStart}">
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
				            <a href="${pageContext.request.contextPath}/staff/getPaymentList?currentPage=${page.lastPage}">&raquo;</a>
				        </c:if>
				    </div>
				</section>
 				

			
	  		</div>
		</div>
	</div>
</div>
<!-- footer -->



</body>

</html>