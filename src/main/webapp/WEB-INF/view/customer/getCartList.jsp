<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	$(document).ready(function(){
		// 테이블 상단 "전체선택"버튼 : 모든 cartNo 체크박스 활성화/비활성화	
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
		
		
		// 테이블 상단 "결제하기"버튼 : (폼 post 전송) 선택한 OrderNo 리스트 결제 하기 화면으로 이동 
		$(payOnCheckedBtn).click(function() {
			// 선택한 orderNo이 없으면 alert창 띄우기 
			if($('input:checkbox:checked').length < 1) {
				alert("결제할 상품을 선택해주세요.");
				return;
			}
			// 선택한 orderNo이 1개 이상이라면 /customer/getCartListByChecked 로 이동
			$(selectCartNoForm).submit();
		});
	});
	
</script>
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
					
					<!-- 체크한 CartNo을 결제하기 페이지(getCartListByChecked)로 넘기는 form -->
					<form id="selectCartNoForm" method="get" action="${pageContext.request.contextPath}/customer/getCartListByChecked">
						
						<div style="text-align: right">
							<button id="selectAllBtn" type="button" class="btn btn-sm btn-light">전체선택</button>
							<button id="deleteAllBtn" type="button" class="btn btn-sm btn-light">전체해제</button>
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
											<input name="cartNo" type="checkbox" class="checkbox" value="${c.cartNo}">
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
										<a href="${pageContext.request.contextPath}/customer/removeCart?cartNo=${c.cartNo}" class="btn btn-sm btn-light">❌</a>
										<br>
										<!-- 선택한 cartNo 하나만 결제하기 페이지(getCartListByChecked)로 이동 -->
										<a href="${pageContext.request.contextPath}/customer/getCartListByChecked?cartNo=${c.cartNo}" class="btn btn-sm btn-light">결제하기</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>


</html>