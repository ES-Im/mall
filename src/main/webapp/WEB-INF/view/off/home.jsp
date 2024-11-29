<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>쇼핑몰</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    </head>
    <style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		.customer-link {
        	color: black;
        	text-decoration: none;
        }
        
        .customer-link:hover {
            color: #D8D8D8;
            text-decoration: none;
        }
        
        .customer-link:visited {
        	color: black;
        	text-decoration: none;
        }
		
		.pagination {
		  display: flex;
  		  justify-content: center;
		}
		
		.pagination a {
		  color: #5D5D5D;
		  float: left;
		  padding: 6px 12px;
		  text-decoration: none;
		  border: 1px solid #ddd;
		}
		
		.pagination a.active {
		  background-color: #5D5D5D;
		  color: white;
		  border: 1px solid #5D5D5D;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
		
		.pagination a:first-child {
		  border-top-left-radius: 5px;
		  border-bottom-left-radius: 5px;
		}
		
		.pagination a:last-child {
		  border-top-right-radius: 5px;
		  border-bottom-right-radius: 5px;
		}
	</style>
	
    
    
    
    
    
    <body>
    	
    	<!-- 고객 헤더 -->
    	<c:if test="${loginCustomer != null }">
    		<c:import url="/WEB-INF/view/inc/customerHeader.jsp"></c:import>
    	</c:if>
    	
    	<!-- 스태프 헤더 -->
    	<c:if test="${loginStaff != null }">
    		<c:import url="/WEB-INF/view/inc/staffHeader.jsp"></c:import>
    	</c:if>
       
        <!-- Header-->

<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://www.w3schools.com/bootstrap5/chicago.jpg" alt="Los Angeles" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://www.w3schools.com/bootstrap5/ny.jpg" alt="Chicago" class="d-block" style=width:100%">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div> 
    </div>
    <div class="carousel-item">
      <img src="https://www.w3schools.com/bootstrap5/la.jpg" alt="New York" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>


        <!-- Section-->
        <section class="py-5">
        		
        		<!-- 카테고리 -->
<!--        		<div class="card col-sm-1 m-3" id="category">
        			<div class="card-body">
        			 	CATEGORY
        			 	<br>
        			 	<div class="form-check" id="checkbox">
        			 		<c:forEach var="c" items="${categoryList }" varStatus="status">
								<input class="form-check-input" type="checkbox" name="category" value="${c.categoryNo }" id="status.count">
								<label class="form-check-label">${c.categoryTitle }</label>  
							</c:forEach>			 	
        			 	</div>		 
        			 </div>
        		</div>
-->        		
        
        	
        	
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					
					<c:forEach var="goods" items="${goodsList}">
					
						<div class="col mb-5">
							<div class="card h-100">
								<!-- Product image-->
								<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${goods.goodsTitle}</h5>
										<!-- Product price-->
										$ ${goods.goodsPrice}
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<c:if test="${goods.goodsStatus == '재고없음'}">
										<div class="text-center"><a class="btn btn-dark mt-auto text-lights" href="${pageContext.request.contextPath }/getGoodsOne?goodsNo=${goods.goodsNo}">SOLD OUT</a></div>
									</c:if>
									
									<c:if test="${goods.goodsStatus == '재고있음'}">
										<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath }/getGoodsOne?goodsNo=${goods.goodsNo}">상세보기</a></div>
									</c:if>
								</div>
							</div>
						</div>
						
					</c:forEach>	

					</div>
				</div>
			
				
			<!-- PAGINATION -->
       		<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
				
				<!-- 첫 페이지 -->
				<c:if test="${!(page.currentPage > 1)}">
					<a href="" style="pointer-events: none;">&laquo;</a>
				</c:if>
				<c:if test="${page.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/home?currentPage=1&searchWord=${searchWord}">&laquo;</a>
				</c:if>
				
				<!-- 이전 페이지 -->
				<c:if test="${!(page.currentPage > 10)}">
					<a href="" style="pointer-events: none;">Previous</a>
				</c:if>
				<c:if test="${page.currentPage > 10}">
					<a href="${pageContext.request.contextPath}/home?currentPage=${page.currentPage - 10}&searchWord=${searchWord}">
						Previous
					</a>
				</c:if>
				
				<!-- 페이지 번호 링크 -->
				<c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
					<c:if test= "${num == page.currentPage}">
						<a class="active">${num}</a>
					</c:if>
					<c:if test= "${num != page.currentPage}">
						<a href="${pageContext.request.contextPath}/home?currentPage=${num}&searchWord=${searchWord}">${num}</a>
					</c:if>
				</c:forEach>
				

				
				
				<!-- 다음 페이지 : 검색어 없을 때 -->
				<c:if test="${ searchWord == '' && ( (page.lastPage - (page.lastPage) % page.numPerPage + 1) > page.currentPage)}">
					<a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage - (page.lastPage)%page.numPerPage + 1}">
						Next
					</a>
				</c:if>
				
				<!-- 다음 페이지 : 검색어 있을 때 -->
				<c:if test="${searchWord != '' && ((page.lastPage - (page.lastPage) % page.numPerPage + 1) > page.currentPage)}">
					<a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage - (page.lastPage) % page.numPerPage + 1}&searchWord=${searchWord}">
						Next
					</a>
				</c:if>
				
				<!-- 마지막 페이지 -->
				<c:if test="${!(page.currentPage < page.lastPage)}">
					<a href="" style="pointer-events: none;">&raquo;</a>
				</c:if>
				<c:if test="${page.currentPage < page.lastPage}">
					<a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage}&searchWord=${searchWord}">&raquo;</a>
				</c:if>
			</div>
        
        
                
          
        </section>
       
       
      	
       
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath }/js/scripts.js"></script>
    </body>
</html>
