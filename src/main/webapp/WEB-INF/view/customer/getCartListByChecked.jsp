<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cart</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"/>

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"/>
</head>

<body>
     <!-- header -->
	<div>
		<c:import url="/WEB-INF/view/inc/customerHeader.jsp"></c:import>
	</div>
	
	<div class="row">
        <!-- leftbar -->
		<div class="col-sm-2 p-0">
			<c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
		</div>


		<div class="col-sm-10 p-0">
			<!-- main -->
			<div style="margin-left: 80px; margin-top: 90px;">
                <h3>Pay</h3>
            </div>

			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px; ">
			    <!-- 출력할 데이터가 없을 때 -->
			    <c:if test="${empty cartListByChecked}">
			        <div>NO DATA</div>
			    </c:if>
			    
			    <!-- 출력할 데이터가 있을 때 -->
				<c:if test="${not empty cartListByChecked}">
					<!-- cartNo[], Payment(paymentPrice, paymentMethod, addressNo) 전달폼 (paymentController : addPayment)  -->
					<form id="selectCartNoForm" method="post" action="${pageContext.request.contextPath}/customer/addPayment">
						<div style="margin-top: 30px;">
							<h3>상품정보</h3>
						</div>
						<hr>
						<div style="width: 1000px;">
							<!-- 결제할 상품 리스트 출력 -->
							<div class="d-flex flex-column scrollbar" style="max-height: 250px; overflow-y: auto;"> <!-- overflow-y: auto 스크롤바 추가 -->
								<c:forEach items="${cartListByChecked}" var="c">
									<div class="card mb-3 container-fluid " style="width:99%; margin-left:10px"> 
										<!-- 서버에 CartNo 전달 -->
										<input name="cartNo" type="hidden" value="${c.cartNo}">
										
										<!-- 결제 상품 정보 보여주기 -->
										<div class="list-group-item list-group-item-action d-flex gap-3 py-3">
											<!-- 파일 있을 때 -->
											<c:if test="${not empty c.goodsFileNo}">
												<img src="${pageContext.request.contextPath}/goodsFile/${c.goodsFileName}.${c.goodsFileExt}" 
														class="img-thumbnail" 
														style="width: 250px; height: 200px; object-fit: cover;" />
											</c:if>
											
											<!-- 파일 없을 때 -->
											<c:if test="${empty c.goodsFileNo}">
												<div>
													<img src="${pageContext.request.contextPath}/goodsFile/Preparing_the_product_img.jpg" 
															alt="Preparing the product Image" 
															class="img-thumbnail" 
															style="width: 250px; height: 200px; object-fit: cover;" />
												</div>
											</c:if>
							
											<div style="flex-grow: 1; margin-left: 15px;">
												<p class="mt-2 mb-0"><small>Goods Name: ${c.goodTitle}</small></p>
												<p class="mt-2 mb-0"><small>Category: ${c.categoryTitle}</small></p>
												<p class="mt-2 mb-0"><small>Goods Price: $ <fmt:formatNumber value="${c.goodsPrice}" pattern="#,###"/></small></p>
												<p class="mt-2 mb-0"><small>Quantity: ${c.cartAmount}</small></p>
												<p class="mt-2 mb-0"><small>TOTAL PRICE: $ <fmt:formatNumber value="${c.totalPrice}" pattern="#,###"/></small></p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div style="margin-top: 30px;" class="d-flex justify-content-end">
								<input type="hidden" name="paymentPrice" value="${totalSum}" readonly>
								<h3> 결제 금액 : $ <fmt:formatNumber value="${totalSum}" pattern="#,###"/></h3>
							</div>
							
							<div style="margin-top: 30px;">
								<h3>결제 수단 선택</h3>
							</div>
							<hr>
							<div class="card d-flex">
								<div class="form-check" style="margin: 5px">
									<input type="radio" class="form-check-input" id="pay" name="paymentMethod" value="페이"  checked>
									<label class="form-check-label" for="pay">페이</label>
								</div>
								<div class="form-check" style="margin: 5px">
									<input type="radio" class="form-check-input" id="card" name="paymentMethod" value="카드">
									<label class="form-check-label" for="card">카드</label>
								</div>
							</div>
							
							<div style="margin-top: 30px;">
								<h3>배송지 선택</h3>
							</div>
							<hr>
							<select class="form-select mt-3" name="addressNo">
								<c:forEach var="a" items="${addressList}">
									<option value="${a.addressNo}">
										${a.addressDetail}
									</option>
								</c:forEach>
							</select>
							
							<div class="d-flex justify-content-end" style="margin-top: 30px;" >
								<button id="addPaymentBtn" type="button" class="btn btn-outline-success btn-lg">결제하기</button>
							</div>
						</div>
					</form>
				</c:if>
			</div>      
		</div>
	</div>
    <script>
		// 배송지가 없으면 배송지리스트 폼으로 이동
		if(${addressList.size()} == null || ${addressList.size()} == '0') {
		    alert("배송지를 먼저 등록해주세요");
		    window.location.href="${pageContext.request.contextPath}/customer/getAddressList";
		}
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
	
    </script>
</body>

