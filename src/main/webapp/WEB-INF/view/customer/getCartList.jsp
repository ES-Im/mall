<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

</head>
<body>
	<div class="justify-content-center">
		<div class="col-sm-8">
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
						<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
					</div>
					
					<span class="display-3">CART</span>
					<hr>
					<div style="text-align: right">
						<button id="selectAllBtn" type="button" class="changeCheckBoxBtn btn btn-sm btn-light">전체선택</button>
						<button id="deleteAllBtn" type="button" class="changeCheckBoxBtn btn btn-sm btn-light">전체해제</button>
						<button id="payOnCheckedBtn" type="button" class="btn btn-sm btn-light">결제하기</button>
					</div>
					<table class="table">
						<tr>
							<th></th>
							<th>goodsNo</th>
							<th>fileName</th>
							<th>goodTitle</th>
							<th>cartAmount</th>
							<th>Quantity</th>
							<th>totalPrice</th>
							<th></th>
						</tr>
						<!-- 반복문을 이용하여 출력 -->
						<c:forEach items="${cartList}" var="c">
							<tr>
								<td>
									<label>
										<input type="checkbox" class="checkbox" value="${c.cartNo}" name="cartNo">
									</label>
								</td>
								<td>${c.goodsNo}</td>
								<td>
									<img src="${pageContext.request.servletContext}/upload/${c.fileName}">
								</td>
								<td>${c.goodTitle}</td>
								<td>${c.goodsPrice}</td>
								<td>${c.cartAmount}</td>
								<td>${c.totalPrice}</td>
								<td style="text-align:right">
									<button type="button" class="btn btn-sm btn-danger">❌</button> 
									<br>
									<button type="button" class="btn btn-sm btn-light">결제하기</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

	$(document).ready(function(){
	});
	
	// 모든 cartNo 체크박스 활성화/비활성화	
	$(deleteAllBtn).hide();
	$(selectAllBtn).click(function() {
	    $('input:checkbox').prop('checked', true);
	    
	    $(selectAllBtn).hide();	// 클릭시 전체선택 버튼 숨기고, 전체해제 버튼 보이게 하기
	    $(deleteAllBtn).show(); 
	});


	$(deleteAllBtn).click(function() {  
	    $('input:checkbox').prop('checked', false);
	    
	    $(deleteAllBtn).hide(); // 클릭시 전체해제 버튼 숨기고, 전체선택 버튼 보이게 하기
	    $(selectAllBtn).show();
	});
	
	// 선택한 OrderNo 결제 하기 
	$(payOnCheckedBtn.click(function(){
		
	});

	

	
</script>

</html>