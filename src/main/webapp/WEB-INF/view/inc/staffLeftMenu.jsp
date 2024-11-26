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
    <div class="row flex-nowrap">
        <div class=" bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100" >
            	<a href="#" class="nav-link px-0 " > <span class="fs-4 d-none d-sm-inline ps-5" >MUSINSA</span> </a> 
                
                <br>
                
                <a href="${pageContext.request.contextPath}/staff/getGoodsList" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                	<i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">⭐ STAFF_ID 님</span>
                </a>
                
                <a href="#" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                	<i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">⭐ ADD STAFF</span>
                </a>

					<br>
				

                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">

                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">CATEGORY</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
			                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">ADD CATEGORY</span> </a>
	
                            </li>
                           
					
                        </ul>
                    </li>
  
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline text-light">GOODS</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
							<li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">~~~~~~~~~</span> </a>
                            </li>
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">@@@@@@@@@</span> </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">$$$$$$$$$</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">ORDERS</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">AAAAAAAAA</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">FFFFFFFF</span>
                                </a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">BOARD</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">BBBBBBB</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">CCCCCCCC</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">SSSSSSSSS</span></a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu5" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">CUSTOMER</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu5" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">QQQQQQQQ</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">TTTTTTT</span>
                                </a>
                            </li>
                           
                        </ul>
                    </li>
                     <li>
                        <a href="#submenu6" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-light">STATISTICAL</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu6" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">#######</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0">
                                	<span class="d-none d-sm-inline">%%%%%%%%%</span>

                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> 
                                	<span class="d-none d-sm-inline">*********</span>
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