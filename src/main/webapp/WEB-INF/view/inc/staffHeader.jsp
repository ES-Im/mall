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
<body>
 		<!-- header-->
		<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: relative;">
		    <div class="container ">
		        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		            <span class="navbar-toggler-icon"></span>
		        </button>
		        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
		            <!-- 로그아웃 & 마이페이지 버튼 -->
		            
		            <div class="me-3">
		                <a href="${pageContext.request.contextPath}/logout"><button type="button" class="btn btn-sm btn-light">로그아웃</button></a>
		                <a href="${pageContext.request.contextPath}/staff/getGoodsList"><button type="button" class="btn btn-sm btn-dark">관리페이지</button></a>
		            </div>
		            
		        </div>
		    </div>
		</nav>

</body>
</html>