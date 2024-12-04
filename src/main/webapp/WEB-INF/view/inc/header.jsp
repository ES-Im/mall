<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<script>
	$(document).ready(function() {
		$("#btnCart").click(function() {
			window.open("${pageContext.request.contextPath}/customer/getCartList", "_self");
		});
		
		$('#btnSearchWord').click(function() {
			if($('#searchWord').val() == null || $('#searchWord').val() == ''){
				alert('검색어를 입력해주세요');
				$('#searchWord').focus();
				return;
			}
			$('#searchWordForm').submit();
		});
		
		// 현재 URL 이 home 이거나 getGoodsOne이면 로고 배치
		let logoHtml = '<a href="${pageContext.request.contextPath}/home" class="nav-link px-0 " > <span class="fs-4 d-none d-sm-inline ps-5" >MUSINSA</span></a>'
		
		if(window.location.pathname === '/mall/home' || window.location.pathname === '/mall/getGoodsOne') {
			  $('#logoHtml').html(logoHtml);
		}
	});
</script>
</head>


<body>
	<!-- 각 세션 상태를 변수로 저장 (true = 해당 세션이 있음) -->
	<c:set var="loginCustomer" value="${sessionScope.loginCustomer != null}"/> 
	<c:set var="loginStaff" value="${sessionScope.loginStaff != null}"/> 
	<c:set var="loginOff" value="${sessionScope.loginCustomer == null && sessionScope.loginStaff == null}"/> 

	<!-- header-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light m-0" style="position:fixed; width:100%">
		<div class="container px-4 px-lg-5 d-flex justify-content-between collapse navbar-collapse">

			<div id="logoHtml">
			</div>

			<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent"> 
					<!-- 제품검색 -->
				<div class="me-3">
					<form class="d-flex" action="${pageContext.request.contextPath }/home" method="get" id="searchWordForm">
						<input type="text" class="form-control-sm" name="searchWord" id="searchWord">
						<c:if test="${not empty categoryNo}">
							<input type="hidden" class="form-control-sm" name="categoryNo" value="${categoryNo }" id="categoryNo">
						</c:if>
						
						<button type="button" class="btn btn-sm btn-dark" id="btnSearchWord">검색</button>
					</form>
				</div>
					
					<!-- 장바구니 버튼 : customer 세션이 있을 경우만 보이기 -->
				<c:if test="${loginCustomer}">
					<div class="me-3">
					<form class="d-flex me-3 ">
						<button id="btnCart" class="btn btn-outline-dark" type="button">
							<i class="bi-cart-fill me-1"></i>
								Cart
							<span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.countCart}</span>
						</button>
					</form>
					</div>
				</c:if>

					<!-- 회원가입 & 로그인 버튼 : staff/customer 세션이 없을 경우만 보이기 -->
				<c:if test="${loginOff}">
					<div class="me-3">
						<a href="${pageContext.request.contextPath }/customer/addCustomer"><button type="button" class="btn btn-sm btn-light">회원가입</button></a>
						<a href="${pageContext.request.contextPath }/off/login"><button type="button" class="btn btn-sm btn-dark">로그인</button></a>
					</div>
				</c:if>
					
					<!-- 로그아웃 & 마이페이지 staff/customer 세션이 있을 경우만 보이기 -->      
				<c:if test="${loginCustomer || loginStaff}">
					<div class="me-3">
						<a href="${pageContext.request.contextPath}/logout"><button type="button" class="btn btn-sm btn-light">로그아웃</button></a>
						<c:if test="${loginCustomer}">
							<a href="${pageContext.request.contextPath}/customer/getCustomerOne"><button type="button" class="btn btn-sm btn-dark">마이페이지</button></a>
						</c:if>
						<c:if test="${loginStaff}">
							<a href="${pageContext.request.contextPath}/customer/getCustomerOne"><button type="button" class="btn btn-sm btn-dark">관리페이지</button></a>
						</c:if>
					</div>
				</c:if>
			</div>
		</div>
	</nav>


</body>
</html>