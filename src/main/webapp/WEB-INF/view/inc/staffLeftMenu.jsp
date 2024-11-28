<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
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
    <div class="row flex-nowrap" style="position: fixed; z-index: 10;">
        <div class=" bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100" >
            	<a href="${pageContext.request.contextPath}/home" class="nav-link px-0 " > <span class="fs-4 d-none d-sm-inline ps-5" >MUSINSA</span> </a> 
                
                <br>
                
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                
                	<li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">⭐ ${loginStaff} 님</span><span style="margin-left: 65px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getStaffList" class="nav-link px-0"> <span class="d-none d-sm-inline">Staff List</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/addStaff" class="nav-link px-0"> <span class="d-none d-sm-inline">Add Staff</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">CATEGORY</span><span style="margin-left: 90px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getCategoryList" class="nav-link px-0"> <span class="d-none d-sm-inline">Category List</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/addCategory" class="nav-link px-0"> <span class="d-none d-sm-inline">Add Category</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">GOODS</span><span style="margin-left: 113px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getGoodsList" class="nav-link px-0"> <span class="d-none d-sm-inline">Goods List</span> </a>
                            </li>
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/addGoods" class="nav-link px-0"> <span class="d-none d-sm-inline">Add Goods</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">PAYMENT</span><span style="margin-left: 108px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getPaymentList" class="nav-link px-0"> <span class="d-none d-sm-inline">Payment List</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu5" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">BOARD</span><span style="margin-left: 115px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu5" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getBoardListByStaff" class="nav-link px-0"> <span class="d-none d-sm-inline">Board List</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu6" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
       	                     <i class="fs-4 bi-grid " style="color: white;"></i> <span class="ms-1 d-none d-sm-inline text-light">CUSTOMER</span><span style="margin-left: 85px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu6" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="${pageContext.request.contextPath}/staff/getCustomerListByStaff" class="nav-link px-0"> <span class="d-none d-sm-inline">Customer List</span> </a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#submenu7" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">STATISTICAL</span><span style="margin-left: 80px; color: white;">▼</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu7" data-bs-parent="#menu">
                        	<li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">Statistical</span>
                                </a>
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