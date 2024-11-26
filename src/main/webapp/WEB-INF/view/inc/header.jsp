<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
</head>
<body>

<head>
    <meta charset="utf-8" />
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
</head>


 		<!-- header-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            
            	<!-- 폰트, 쇼핑몰 이름 지정 후 변경 예정 -->
                <a class="navbar-brand" href="#!">MUSINSA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

                  	<!-- 제품검색 -->
                	<div class="me-3">
	                  	<form class="d-flex ">
		 					<input type="text" class="form-control-sm" name="">
		 					<button type="button" class="btn btn-sm btn-dark">검색</button>
	                  	</form>
					</div>
                  	
                  	<!-- 장바구니 버튼 -->
                  	<form class="d-flex me-3">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                  	
                  	<!-- 회원가입 & 로그인 버튼 -->
                  	<div class="me-3">
	                  	<a href="#"><button type="button" class="btn btn-sm btn-light">회원가입</button></a>
	                  	<a href="#"><button type="button" class="btn btn-sm btn-dark">로그인</button></a>
                 	</div>
      
                </div>
            </div>
        </nav>


</body>
</html>