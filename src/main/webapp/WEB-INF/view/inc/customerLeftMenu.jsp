<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>customerLeftMenu</title>
</head>
<body>

<div class="container-fluid " style="height:100%">
    <div class="row flex-nowrap" style="position: fixed; z-index: 999;">
        <div class=" bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100" >
            	<a href="${pageContext.request.contextPath}/home" class="nav-link px-0 " > <span class="fs-4 d-none d-sm-inline ps-5" >MUSINSA</span> </a> 
                
                <br>
                
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                
                	<li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">⭐ ${fn:substringBefore(sessionScope.loginCustomer, "@")} 님</span><span style="margin-left: 66px; color: white;"></span>
                        </a>
                    </li>
                    
                    <hr>
                    
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">PERSONAL</span><span style="margin-left: 107px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getCustomerOne" class="nav-link px-0"> <span class="d-none d-sm-inline">개인정보 관리</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getAddressList" class="nav-link px-0"> <span class="d-none d-sm-inline">배송지 관리</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">PAYMENT</span><span style="margin-left: 114px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getPaymentList" class="nav-link px-0"> <span class="d-none d-sm-inline">주문 이력</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getCartList" class="nav-link px-0"> <span class="d-none d-sm-inline">장바구니</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
    </div>
</div>


</body>
</html>