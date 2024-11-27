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
					
					<span class="display-3">결제 완료 !</span>
					<hr>
					<a href="${pageContext.request.contextPath}/home">홈으로</a>
					<a href="${pageContext.request.contextPath}/customer/getPaymentList">주문 목록</a>
				
					
				</div>
				
			</div>
		</div>
	</div>
</body>



</html>