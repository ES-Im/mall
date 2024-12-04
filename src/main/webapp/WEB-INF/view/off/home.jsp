<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

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
		
		
		/* pagination */
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
		
		/* carousel-inner */
		  .carousel-inner img {
      width: 100%;  /* 너비를 부모 요소에 맞춤 */
      height: 750px; /* 높이를 고정 */
      
  }
		
		
		
	</style>
	<script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		/*  category가 선택된 항목의 value(categoryNo)가져오기 */
		$('#btnCategoryView').click(function() {
			/* 디버깅용 페이지 이동 막기 */
			// event.preventDefault();
			
			const category = $('input[name="categoryNo"]:checked');
			
			const categoryValues = category.map(function() {
							            return $(this).val(); /* 각 체크박스의 value 값을 반환 */
							        }).get(); /* 배열로 변환 */
			
			console.log("선택 값 : "+categoryValues);
							        
			if(categoryValues.length > 0) {
				
	            const categoryParam = categoryValues.join(','); /* ','로 연결 */
	            console.log("categoryParam : "+categoryParam);
	            
	            const nowUrl = `${pageContext.request.contextPath}/home?searchWord=${searchWord}&categoryNo=`;
	            
	            const url = nowUrl +categoryParam;
	      
	            $('#categoryUrl').attr('href', url); /* href 속성 동적으로 변경 */
	            console.log("최종 : "+url);
	
	        } else {
	        	/*  category 유효성 검사 */
	            alert('카테고리를 선택해주세요.');
	        }
			
			
		 });
	})
	</script>
    
     <div class="fixed-top " style="z-index: 9999;">
         
            <jsp:include page="/WEB-INF/view/inc/header.jsp" />
         
      </div>
		
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel" style="margin-top: 2%;">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner"  >
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/img/sale1.jpg" alt="" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3>SHOP</h3>
        <p>We had such a great time in SHOP!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/sale2.jpg" alt="" class="d-block" style=width:100%">
      <div class="carousel-caption">
        <h3>Christmas Sale</h3>
        <p>Thank you, Christmas!</p>
      </div> 
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/sale3.jpg" alt="" class="d-block" style="width:100%">
      <div class="carousel-caption">
        <h3>Black Friday Sale</h3>
        <p>We love the Black Friday!</p>
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
        		<div class=" col-sm-2 ms-3 mt-5" id="category" style="float:left;">
        			<div class="card card-body" style="width:80%;">
        			    <div class="mb-3 d-flex justify-content-between">
        			 		<span class="h4">CATEGORY</span>
        			 		<div class="">
							   <a href="${pageContext.request.contextPath}/home?category=" id="categoryUrl"> 
							    	<button class="btnRemoveBoard btn btn-sm btn-outline-danger" id="btnCategoryView">VIEW</button>
							    </a>
						    </div>
						</div>
						<c:forEach var="c" items="${categoryList }" varStatus="status">
        			 		<div class="form-check" id="checkbox">
							    <input class="form-check-input" type="checkbox" name="categoryNo" value="${c.categoryNo }">
							    <label class="form-check-label">${c.categoryTitle }</label>   	
        			 		</div>
        			 	</c:forEach>	
		 
        			 </div>
        		</div>

        	
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
					
					<c:forEach var="goods" items="${goodsList}">
				<!-- 판매 중지 -->
						<c:if test="${goods.goodsStatus == '판매중지'}">
							<div class="col mb-5 ">
							<!-- Product image-->
							<div class="card h-100">								
								<!-- 파일 있을 때 -->
	 							<c:if test="${not empty goods.goodsFileNo}">

	 								<div style="position: relative; display: inline-block;">
                               <!-- 상품 이미지 -->
                               <img class="card-img-top" style="height:400px;" 
                                    src="${pageContext.request.contextPath}/goodsFile/${goods.goodsFileName}.${goods.goodsFileExt}" 
                                    alt="${goods.goodsOriginName}" />
                           
                               <!-- 반투명 오버레이 -->
                               <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; 
                                           background-color: rgba(128, 128, 128, 0.5); 
                                           backdrop-filter: blur(5px); z-index: 1;"></div>
                           
                               <!-- 판매 종료 텍스트 -->
                               <p class="sold-out-text" style="position: absolute; top: 50%; left: 50%; 
                                                               transform: translate(-50%, -50%); 
                                                               color: white; font-size: 24px; font-weight: bold; z-index: 2;">
                                   판매 종료
                               </p>
                           </div>
	 							</c:if>
	 							<!-- 파일 없을 때 -->
	 							<c:if test="${empty goods.goodsFileNo}">
	 								<div style="align-items: center;">
	 									<img class="card-img-top" src="${pageContext.request.contextPath}/goodsFile/Preparing_the_goods_img.jpg" alt="..." id style="height:400px; " />
	 								</div>
	 							</c:if>

								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h4 class="fw-bolder">${goods.goodsTitle}</h4>
										<!-- category -->
										<h5>${goods.categoryTitle}</h5>
										<!-- Product price-->
										 <fmt:formatNumber value="${goods.goodsPrice}" type="number" groupingUsed="true" />원
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
									
									<c:if test="${goods.goodsStatus == '판매중지'}">
										<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">판매중지</a></div>
									</c:if>
								</div>
							</div>
						</div>
						
						
						
						</c:if>
					
						<c:if test="${goods.goodsStatus != '판매중지'}">
						
						<div class="col mb-5">
							<!-- Product image-->
							<div class="card h-100">								
								<!-- 파일 있을 때 -->
	 							<c:if test="${not empty goods.goodsFileNo}">
	 								<img class="card-img-top" style="height:400px;"  src="${pageContext.request.contextPath}/goodsFile/${goods.goodsFileName}.${goods.goodsFileExt}" alt="${goods.goodsOriginName}" />
	 								
	 							</c:if>
	 							<!-- 파일 없을 때 -->
	 							<c:if test="${empty goods.goodsFileNo}">
	 								<div style="align-items: center;">
	 									<img class="card-img-top" src="${pageContext.request.contextPath}/goodsFile/Preparing_the_goods_img.jpg" alt="..." style="height:400px;" />
	 								</div>
	 							</c:if>

								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h4 class="fw-bolder">${goods.goodsTitle}</h4>
										<!-- category -->
										<h5>${goods.categoryTitle}</h5>
										<!-- Product price-->
										 <fmt:formatNumber value="${goods.goodsPrice}" type="number" groupingUsed="true" />원
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
						</c:if>
					</c:forEach>	

					</div>
				</div>
			</section>
			
				
			<!-- pagination -->	
			<c:if test="${goodsList == null && goodsList.size() == 0}">
			</c:if>
				
			<c:if test="${goodsList != null && goodsList.size() != 0}">

			<section class="py-5">
			
<!-- 검색어 ⭕, 카테고리 ⭕ -->
			<c:if test="${(not empty searchWord && not empty categoryNo)}">
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
			                    
			        <!-- 첫 페이지 -->
			        <c:choose>
			            <c:when test="${!(page.currentPage > 1)}">
			                <a href="" style="pointer-events: none;">&laquo;</a>
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=1&searchWord=${searchWord}&categoryNo=${categoryNo}">&laquo;</a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
			        <c:choose>
			            <c:when test="${page.getPreviousGroupEnd() <= 0}">
			                <a href="" style="pointer-events: none;">
			                    Previous
			                </a>
			            </c:when>
			            
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getPreviousGroupEnd()}&searchWord=${searchWord}&categoryNo=${categoryNo}">
			                    Previous
			                </a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 페이지 번호 링크 -->
			        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
			            <c:if test= "${num == page.currentPage}">
			                <a class="active">${num}</a>
			            </c:if>
			            <c:if test= "${num != page.currentPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${num}&searchWord=${searchWord}&categoryNo=${categoryNo}">${num}</a>
			            </c:if>
			        </c:forEach>
			        
			    
			        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
			                        마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
			        
			        <c:choose>
			            <%-- 만약 현재 그룹이 마지막 페이지 그룹이라면 이동 불가--%>
			            <c:when test="${page.currentPage >= page.getLastGroupStart()}">
			                <a href="" style="pointer-events: none;">
			                    Next
			                 </a>
			            </c:when>
			            <%-- 만약 다음 그룹이 마지막 페이지 그룹이라면 마지막 그룹의 첫 번째 번호로 이동--%>
			            <c:when test="${page.getNextGroupStart() + page.numPerPage >= page.lastPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getLastGroupStart()}&searchWord=${searchWord}&categoryNo=${categoryNo}">
			                    Next
			                </a>
			            </c:when>
			            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getNextGroupStart()}&searchWord=${searchWord}&categoryNo=${categoryNo}">
			                    Next
			                </a>
			            </c:otherwise>
			            
			        </c:choose>
			        <!-- 마지막 페이지 -->
			        <c:if test="${!(page.currentPage < page.lastPage)}">
			            <a href="" style="pointer-events: none;">&raquo;</a>
			        </c:if>
			        <c:if test="${page.currentPage < page.lastPage}">
			            <a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage}&searchWord=${searchWord}&categoryNo=${categoryNo}">&raquo;</a>
			        </c:if>
			        
			    </div>
		    
		    </c:if>	
		    
		    
<!-- 검색어 ⭕, 카테고리 X -->
			<c:if test="${(not empty searchWord) && (empty categoryNo)}">
		   		<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
			                    
			        <!-- 첫 페이지 -->
			        <c:choose>
			            <c:when test="${!(page.currentPage > 1)}">
			                <a href="" style="pointer-events: none;">&laquo;</a>
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=1&searchWord=${searchWord}">&laquo;</a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
			        <c:choose>
			            <c:when test="${page.getPreviousGroupEnd() <= 0}">
			                <a href="" style="pointer-events: none;">
			                    Previous
			                </a>
			            </c:when>
			            
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getPreviousGroupEnd()}&searchWord=${searchWord}">
			                    Previous
			                </a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 페이지 번호 링크 -->
			        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
			            <c:if test= "${num == page.currentPage}">
			                <a class="active">${num}</a>
			            </c:if>
			            <c:if test= "${num != page.currentPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${num}&searchWord=${searchWord}">${num}</a>
			            </c:if>
			        </c:forEach>
			        
			    
			        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
			                        마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
			        
			        <c:choose>
			            <%-- 만약 현재 그룹이 마지막 페이지 그룹이라면 이동 불가--%>
			            <c:when test="${page.currentPage >= page.getLastGroupStart()}">
			                <a href="" style="pointer-events: none;">
			                    Next
			                 </a>
			            </c:when>
			            <%-- 만약 다음 그룹이 마지막 페이지 그룹이라면 마지막 그룹의 첫 번째 번호로 이동--%>
			            <c:when test="${page.getNextGroupStart() + page.numPerPage >= page.lastPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getLastGroupStart()}&searchWord=${searchWord}">
			                    Next
			                </a>
			            </c:when>
			            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getNextGroupStart()}&searchWord=${searchWord}">
			                    Next
			                </a>
			            </c:otherwise>
			            
			        </c:choose>
			        <!-- 마지막 페이지 -->
			        <c:if test="${!(page.currentPage < page.lastPage)}">
			            <a href="" style="pointer-events: none;">&raquo;</a>
			        </c:if>
			        <c:if test="${page.currentPage < page.lastPage}">
			            <a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage}&searchWord=${searchWord}">&raquo;</a>
			        </c:if>
			        
			    </div>
		   
		   
		    </c:if>	
		    
<!-- 검색어 ❌, 카테고리 ⭕ -->
			<c:if test="${(empty searchWord) && (not empty categoryNo)}">
		    	<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
			                    
			        <!-- 첫 페이지 -->
			        <c:choose>
			            <c:when test="${!(page.currentPage > 1)}">
			                <a href="" style="pointer-events: none;">&laquo;</a>
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=1&categoryNo=${categoryNo}">&laquo;</a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
			        <c:choose>
			            <c:when test="${page.getPreviousGroupEnd() <= 0}">
			                <a href="" style="pointer-events: none;">
			                    Previous
			                </a>
			            </c:when>
			            
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getPreviousGroupEnd()}&categoryNo=${categoryNo}">
			                    Previous
			                </a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 페이지 번호 링크 -->
			        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
			            <c:if test= "${num == page.currentPage}">
			                <a class="active">${num}</a>
			            </c:if>
			            <c:if test= "${num != page.currentPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${num}&categoryNo=${categoryNo}">${num}</a>
			            </c:if>
			        </c:forEach>
			        
			    
			        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
			                        마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
			        
			        <c:choose>
			            <%-- 만약 현재 그룹이 마지막 페이지 그룹이라면 이동 불가--%>
			            <c:when test="${page.currentPage >= page.getLastGroupStart()}">
			                <a href="" style="pointer-events: none;">
			                    Next
			                 </a>
			            </c:when>
			            <%-- 만약 다음 그룹이 마지막 페이지 그룹이라면 마지막 그룹의 첫 번째 번호로 이동--%>
			            <c:when test="${page.getNextGroupStart() + page.numPerPage >= page.lastPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getLastGroupStart()}&categoryNo=${categoryNo}">
			                    Next
			                </a>
			            </c:when>
			            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getNextGroupStart()}&categoryNo=${categoryNo}">
			                    Next
			                </a>
			            </c:otherwise>
			            
			        </c:choose>
			        <!-- 마지막 페이지 -->
			        <c:if test="${!(page.currentPage < page.lastPage)}">
			            <a href="" style="pointer-events: none;">&raquo;</a>
			        </c:if>
			        <c:if test="${page.currentPage < page.lastPage}">
			            <a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage}&categoryNo=${categoryNo}">&raquo;</a>
			        </c:if>
			        
			    </div>
		    </c:if>	
	
<!-- 검색어 ❌, 카테고리 ❌ -->
			<c:if test="${(empty searchWord) && (empty categoryNo)}">	
		    
			    <div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
			                    
			        <!-- 첫 페이지 -->
			        <c:choose>
			            <c:when test="${!(page.currentPage > 1)}">
			                <a href="" style="pointer-events: none;">&laquo;</a>
			            </c:when>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=1">&laquo;</a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 이전 페이지 : 클릭시 이전 numPerPage 그룹에서 마지막점으로 이동 (ex : 37 에서 클릭시 30으로 이동)-->
			        <c:choose>
			            <c:when test="${page.getPreviousGroupEnd() <= 0}">
			                <a href="" style="pointer-events: none;">
			                    Previous
			                </a>
			            </c:when>
			            
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getPreviousGroupEnd()}">
			                    Previous
			                </a>
			            </c:otherwise>
			        </c:choose>
			        
			        <!-- 페이지 번호 링크 -->
			        <c:forEach var="num" begin="${page.getStartPagingNum()}" end="${page.getEndPagingNum()}">
			            <c:if test= "${num == page.currentPage}">
			                <a class="active">${num}</a>
			            </c:if>
			            <c:if test= "${num != page.currentPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${num}">${num}</a>
			            </c:if>
			        </c:forEach>
			        
			    
			        <!-- 다음 페이지 : 클릭시 다음 numPerPage 그룹에서 시작점으로 이동 (ex : 37 에서 클릭시 41로 이동), 
			                        마지막 numPerPage 그룹의 시작점을 위해 lastGroupPage 따로 처리 (ex : lastGroupStart가 51 일때 [42 ~ 50] 페이지는 무조건 51로 이동하도록)-->
			        
			        <c:choose>
			            <%-- 만약 현재 그룹이 마지막 페이지 그룹이라면 이동 불가--%>
			            <c:when test="${page.currentPage >= page.getLastGroupStart()}">
			                <a href="" style="pointer-events: none;">
			                    Next
			                 </a>
			            </c:when>
			            <%-- 만약 다음 그룹이 마지막 페이지 그룹이라면 마지막 그룹의 첫 번째 번호로 이동--%>
			            <c:when test="${page.getNextGroupStart() + page.numPerPage >= page.lastPage}">
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getLastGroupStart()}">
			                    Next
			                </a>
			            </c:when>
			            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
			            <c:otherwise>
			                <a href="${pageContext.request.contextPath}/home?currentPage=${page.getNextGroupStart()}">
			                    Next
			                </a>
			            </c:otherwise>
			            
			        </c:choose>
			        <!-- 마지막 페이지 -->
			        <c:if test="${!(page.currentPage < page.lastPage)}">
			            <a href="" style="pointer-events: none;">&raquo;</a>
			        </c:if>
			        <c:if test="${page.currentPage < page.lastPage}">
			            <a href="${pageContext.request.contextPath}/home?currentPage=${page.lastPage}">&raquo;</a>
			        </c:if>
			        
			    </div>
		    
		    </c:if>	
    
			</section> 
      	 </c:if>
       
       

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath }/js/scripts.js"></script>
    </body>
</html>
