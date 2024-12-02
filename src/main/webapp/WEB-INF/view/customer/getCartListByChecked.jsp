<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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
</style>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		// 테이블 상단 "결제하기"버튼 : (폼 post 전송) 선택한 OrderNo 리스트 결제 하기 화면으로 이동 
		$(addPaymentBtn).click(function() {
			// 선택한 orderNo이 없으면 alert창 띄우기 
			if($('input[name="paymentMethod"]:checked').length == 0) {
				alert("결제 수단을 선택해주세요.");
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
					
					<span class="display-3">Pay</span>
					<hr>
					
					<!-- cartNo[], Payment(paymentPrice, paymentMethod, addressNo) 전달폼 (paymentController : addPayment)  -->
					<form id="selectCartNoForm" method="post" action="${pageContext.request.contextPath}/customer/addPayment">
						<table class="table">
							<tr>
								<th>cartNo</th>
								<th>goodsNo</th>
								<th>fileName</th>
								<th>goodTitle</th>
								<th>goodsPrice</th>
								<th>cartAmount</th>
								<th>totalPrice</th>
							</tr>
							<!-- 반복문을 이용하여 출력 -->
							<c:forEach items="${cartListByChecked}" var="c">
								<tr>
									<input name="cartNo" type="hidden" value="${c.cartNo}">
									<td>${c.cartNo}</td>
									<td>${c.goodsNo}</td>
									<td>${c.fileName}</td>
									<td>${c.goodTitle}</td>
									<td>${c.goodsPrice}</td>
									<td>${c.cartAmount}</td>
									<td>${c.totalPrice}</td>
								</tr>
							</c:forEach>
						</table>
						<div>총 금액 : <input type="text" name="paymentPrice" value="${totalSum}" readonly></div>
						
						<span class="display-3">결제 수단 선택</span>
						<hr>
						페이 : <input name="paymentMethod" type="radio" value="페이">
						<br>
						카드 : <input name="paymentMethod" type="radio" value="카드">
						<hr>
						
						
						<span class="display-3">배송지 선택</span>
						<hr>
						    <select class="form-select mt-3" name="addressNo">
								<c:forEach var="a" items="${addressList}">
						        	<option value="${a.addressNo}">
						        		${a.addressDetail}
						        	</option>
						      	</c:forEach>
						  	</select>

						<hr>
						<button id="addPaymentBtn" type="button" class="btn btn-sm btn-light">결제하기</button>
					</form>
				</div>
				
			</div>
		</div>
</body>



</html>