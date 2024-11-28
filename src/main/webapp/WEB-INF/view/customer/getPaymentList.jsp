<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- 탬플릿 : 김문정 & JS : 김은서 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

</style>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>

</script>


</head>


<body>
	<div class="row">
		<!-- leftbar -->
		<div class="col-sm-2 p-0">
			<div >
				<c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
			</div>
		</div>
		
		<!-- main -->
		<div class="col-sm-10 p-0">
			<!-- header -->
			<div>
				<c:import url="/WEB-INF/view/inc/customerHeader.jsp"></c:import>
			</div>
			<!-- main -->
			<div style="margin-left: 80px; margin-top: 30px;">
				<h3>Payment List</h3>
			</div>
			
			
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
		  		<div class="list-group">
		  		
 					<c:forEach var="p" items="${paymentList}">
 					
					    <div class="card mb-2" id="paymentCard${p.paymentNo}" style="width: 750px">
					        <!-- Collapse Header -->
					        <div class="card-header">
					            <a class="btn" data-bs-toggle="collapse" href="#payInfo${p.paymentNo}"">
					                    <div class="d-flex gap-2 w-100 justify-content-between">
					                        <div>
					                            <i class="bi">No.${p.paymentNo}</i>
					                            <p class="mb-1">결제 상태: ${p.paymentStatus}</p>
					                        </div>
					                        
					                        <div>
					                            <c:if test="${p.paymentStatus.equals('배송중')}">
					                                <div style="text-align: right;">
					                                    <a href="#" class="btn btn-sm btn-outline-danger">배송완료</a>
					                                </div>
					                            </c:if>
					                            <c:if test="${p.paymentStatus.equals('결제완료')}">
					                                <div style="text-align: right;">
					                                    <a href="#" class="btn btn-sm btn-outline-danger">결제취소</a>
					                                </div>
					                            </c:if>
					                            <small class="opacity-75 text-nowrap">결제일: ${p.createDate}</small>
					                        </div>
					                        
					                    </div>
					            </a>
					        </div>
					
					        <!-- Collapse Body -->
					        <div id="payInfo${p.paymentNo}" class="collapse" data-bs-parent="#paymentCard${p.paymentNo}">
					            <div class="card-body">
					                    <c:forEach var="i" items="${PayInfoListByPaymentNo}">
					                    	 <div class="mb-1">Orders No: ${i.ordersNo}</div>
					                    	 <div class="mb-1">Goods File Name: ${i.goodsFileName}</div>
					                    	 <div class="mb-1">Goods No: ${i.goodsNo}</div>
					                    	 <div class="mb-1">category No: ${i.categoryNo}</div>
					                    	 <div class="mb-1">category Title: ${i.categoryTitle}</div>
					                    	 <div class="mb-1">Goods Title: ${fn:substring(i.goodsTitle,0,5)}</div>
					                    	 <div class="mb-1">Goods Memo:  ${fn:substring(i.goodsMemo,0,5)}</div>
					                    	 <div class="mb-1">수량: ${i.ordersAmount}</div>
					                    	 <div class="mb-1">단가: ${i.goodsPrice}</div>
					                    	 <hr>
					                    </c:forEach>
					            </div>
					            <hr>
					            <h3>합 계 : ${p.paymentPrice} </h3> 
					        </div>
					    </div>
					    
					</c:forEach>

		  		</div>
		  		
			</div>
		</div>
	</div>
	<!-- footer -->



</body>



</html>