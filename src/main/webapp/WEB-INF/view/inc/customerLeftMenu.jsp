<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
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
<title>staffLeftMenu</title>
</head>
<body>

<div class="container-fluid " style="height:100%">
    <div class="row flex-nowrap"  style="position:fixed;">
        <div class=" bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100" >
            	<a href="#" class="nav-link px-0 " > <span class="fs-4 d-none d-sm-inline ps-5" >MUSINSA</span> </a> 
                
                <br>
                
                <!--  -->            
                <a href="${pageContext.request.contextPath}/customer/getCustomerOne" class="nav-link px-0 align-middle">
                	<i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">⭐ ${fn:substringBefore(sessionScope.loginCustomer, "@")} 님</span>
                </a>
                
				<hr>

                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">

                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">개인정보</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getCustomerOne" class="nav-link px-0"> <span class="d-none d-sm-inline">개인정보 관리</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/customer/getAddressList" class="nav-link px-0"> <span class="d-none d-sm-inline">배송지 관리</span> </a>
                            </li>
                        </ul>
                    </li>
  
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">주문</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
							<li>
                                <a href="${pageContext.request.contextPath}/customer/getPaymentList" class="nav-link px-0"> <span class="d-none d-sm-inline">주문 이력</span> </a>
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