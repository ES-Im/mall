<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PAYMENT LIST</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
    <!-- header -->
	<div>
		<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	</div>
	
	<div class="row">
        <!-- leftbar -->
		<div class="col-sm-2 p-0">
			<c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
		</div>

		<div class="col-sm-10 p-0">
			<!-- main -->
			<div style="margin-left: 80px; margin-top: 90px;">
				<h3>PAYMENT LIST</h3>
			</div>
			
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
                <!-- 주문내역이 없을 때 출력 -->
                <c:if test="${empty paymentList}">
			    	<div>NO DATA</div>  
			   	</c:if>
                <!-- 주문내역이 있을 때 출력 -->
				<c:if test="${not empty paymentList}">
					<div class="d-flex flex-column scrollbar" style="max-height: 850px; overflow-y: auto;"> <!-- 일정 길이를 넘는다면 스크롤바 추가 --> 
						<div class="list-group">
							<!-- Payment 기준 반복문 -->
						   <c:forEach var="p" items="${paymentList}">
								<!-- 수정 후 -->
								<div class="d-flex gap-1 py-1 bg-light" style="width: 1000px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 10px; padding: 10px;">
									<div class="d-flex align-items-center justify-content-between" style="width: 100%; height: 40px">
										<div class="me-3" style="margin-left: 20px;" >
											<span>PaymentNo : ${p.paymentNo}</span>
											<span>/ Payment Status : ${p.paymentStatus}</span>
											<c:if test="${p.paymentStatus.equals('배송중')}">
												<a href="${pageContext.request.contextPath}/customer/modifyPaymentStatus?paymentStatus=배송완료&paymentNo=${p.paymentNo}" class="btn btn-sm btn-outline-danger" style="opacity: 1;">배송완료</a>
											</c:if>
											<c:if test="${p.paymentStatus.equals('결제완료')}">
												<a href="${pageContext.request.contextPath}/customer/modifyPaymentStatus?paymentStatus=결제취소&paymentNo=${p.paymentNo}" class="btn btn-sm btn-outline-danger" style="opacity: 1;">결제취소</a>
											</c:if>
										</div>
										<div>
											<small class="opacity-75 text-nowrap">결제일: ${p.createDate}</small>
										</div>
									</div>
								</div>
								<c:forEach var="i" items="${PayInfoListByPaymentNo}">
									<c:if test="${p.paymentNo == i.paymentNo}">
											<!-- 이미지 -->
											<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 1000px;">
												<div class="d-flex justify-content-center align-items-center">
													<!-- 파일 있을 때 -->
													<c:if test="${!(i.goodsFileName == 'no file')}">
														<img src="${pageContext.request.contextPath}/goodsFile/${i.goodsFileName}.${i.goodsFileExt}" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
													</c:if>
													<!-- 파일 없을 때 -->
													<c:if test="${(i.goodsFileName == 'no file')}">
														<div style="align-items: center;">
															<img src="${pageContext.request.contextPath}/goodsFile/Preparing_the_product_img.jpg" alt="Preparing the product Image" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
														</div>
													</c:if>
												</div>
												
												<!-- 주문 정보 -->
												<div class="d-flex gap-2 w-100 justify-content-between">
													<div>
														<p class="mt-2 mb-0"><small>OrdersNo : ${i.ordersNo}</small></p>
														<div class="d-flex justify-content-between">
															<div style="flex-grow: 1;"> 
																<p class="mt-2 mb-0"><small>주문 상품 : ${i.categoryTitle} / ${i.goodsTitle}</small></p>
																<p class="mt-2 mb-0"><small>상품 번호 : ${i.goodsNo}</small></p>
																<p class="mt-2 mb-0"><small>상품 가격 : $<fmt:formatNumber value="${i.goodsPrice}" pattern="#,###"/></small></p>
																<p class="mt-2 mb-0"><small>주문 수량 : ${i.ordersAmount}개</small></p>
															</div>
															
														</div>
														<div>
															<small class="opacity-75">payment status : ${p.paymentStatus}</small>
														</div>
													</div>
												</div>
											</div>
										</c:if>
								</c:forEach>
								<hr>
								<h3 class="opacity-75" style="text-align: right">TOTAL PRICE : $ <fmt:formatNumber value="${p.paymentPrice}" pattern="#,###"/> </h3>
								<br>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

    <!-- PAGINATION -->
    <c:if test="${not empty paymentList}">  
		<section class="py-5">
		    <div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
		                    
		        <!-- 첫 페이지 -->
		        <c:choose>
		            <c:when test="${!(page.currentPage > 1)}">
		                <a href="" style="pointer-events: none;">&laquo;</a>
		            </c:when>
		            <c:otherwise>
		                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=1">&laquo;</a>
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
		                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${page.getPreviousGroupEnd()}">
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
		                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${num}">${num}</a>
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
		                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${page.getLastGroupStart()}">
		                    Next
		                </a>
		            </c:when>
		            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
		            <c:otherwise>
		                <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${page.getNextGroupStart()}">
		                    Next
		                </a>
		            </c:otherwise>
		            
		        </c:choose>
		        <!-- 마지막 페이지 -->
		        <c:if test="${!(page.currentPage < page.lastPage)}">
		            <a href="" style="pointer-events: none;">&raquo;</a>
		        </c:if>
		        <c:if test="${page.currentPage < page.lastPage}">
		            <a href="${pageContext.request.contextPath}/customer/getPaymentList?currentPage=${page.lastPage}">&raquo;</a>
		        </c:if>
		        
		    </div>
		</section>
	</c:if>
			
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath }/js/scripts.js"></script>

	<!-- footer -->

</body>
</html>