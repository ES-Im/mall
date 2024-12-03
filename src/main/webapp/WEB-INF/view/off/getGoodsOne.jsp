<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>쇼팽몰</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }//css/styles.css" rel="stylesheet" />
    </head>
    
    <style>
    	#boardForm{
    		position: relative; 
    	}
    
    	#createDate{
    		position: absolute;  /* 절대 위치로 설정 */
		    bottom: 5px;        /* 아래로 10px 떨어지게 설정 */
		    right: 10px;         /* 오른쪽으로 10px 떨어지게 설정 */
		    font-size: 0.8rem;   /* 적당한 크기로 설정 */
		    color: #6c757d;       /* 색상 설정 */
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
    <script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		
		$('#btnWrite').click(function() {
			if($('#comment').val() == null || $('#comment').val() == ''){
				alert('후기를 작성해주세요.');
				$('#comment').focus();
				return;
			}
			
			
			$('#commentForm').submit();
		})
				
		

        // 'boardMsg' 값 가져오기
        const msg = getMsg('boardMsg');
		
		if(msg != null){
			alert(msg);
			return;
		}
		
	})
	</script>
    <body>
    	<!-- 헤더 -->
    	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
    
 
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<!-- 이미지 --> 
                    <div class="col-md-6">
                    	<!-- <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /> -->
                    	<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    	<!-- <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"> -->
						  <!-- <div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
						   	<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  </div> -->
						  <div class="carousel-inner">
						  	<c:forEach var="gf" items="${goodsFileList}">
							    <div class="carousel-item active">
							      <img src="${pageContext.request.contextPath}/goodsFile/${gf.goodsFileName}.${gf.goodsFileExt}" class="d-block w-100" alt="...">
							    </div>
							</c:forEach>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
                    </div>
                    <!--상품 상세설명 -->
                    <div class="col-md-6">
                        <div class="small mb-1">GOODSNO : ${goods.goodsNo }</div>
                        <h1 class="display-5 fw-bolder">${goods.goodsTitle }</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">450,000</span>
                            <span>${goods.goodsPrice }</span>
                        </div>
                        <p class="lead">${goods.goodsMemo }</p>
                        
                        <!-- 장바구니  -->
                        <div class="d-flex">
                        	<c:if test="${goods.goodsStatus == '재고있음' }">
                        		<form action="${pageContext.request.contextPath}/customer/addCart" method="get">
	                        		<input class="form-control text-center me-3" id="inputQuantity" name="cartAmount" type="num" value="1" style="max-width: 3rem" />
		                          	<input type="hidden" name="goodsNo" value="${goods.goodsNo }">
		                          	<input type="hidden" name="customerEmail" value="${sessionScope.loginCustomer}">
		                          	
		                          
		                           <button class="btn btn-outline-dark flex-shrink-0" type="submit">
		                            
		                                <i class="bi-cart-fill me-1"></i>
		                                Add to cart
		                            
		                           </button>  
	                           </form>
                        	</c:if>	
                        	<c:if test="${goods.goodsStatus == '재고없음' }">

	                            <button class="btn btn-outline-dark flex-shrink-0 btn-dark text-light" type="button">
	                                <i class="bi-cart-fill me-1"></i>
	                              	SOLD OUT😂
	                            </button>
                        	</c:if>	

                        </div>
                    </div>
                </div>
            </div>
        </section>
                
        <!-- 후기 작성 : 수정하기 -->
        <section class="py-5 bg-light">
        <div>
			<div class="d-flex justify-content-center"><p class="h2"> REVIEW </p></div>
      
      	  <!-- 후기 작성 폼 -->
      	  <div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
      	  	<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;" id="boardForm">
				
				<c:if test="${isEligibleReviewer == true }">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div class="" >
							<form action="${pageContext.request.contextPath }/addBoardOne" method="post" id="commentForm">
								<input type="hidden" name="ordersNo" value="${ordersNo}">
								<input type="hidden" name="goodsNo" value="${goodsNo}">
								
								<label for="comment" class="mb-2">후기 작성 </label>
								<textarea class="form-control" rows="5" cols="90" id="comment" name="boardContent" placeholder="후기를 작성해주세요"></textarea>
								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-sm btn-dark mt-3" id="btnWrite" > WRITE </button>
								</div>	
							</form>
						</div>
					</div>
					
				</c:if>	
			</div>
      	  
      	  </div>
        
	
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
				<div class="list-group">
					<c:if test="${empty boardList }">
						아직 작성된 후기가 없습니다.
					</c:if>
				
					<c:forEach var="board" items="${boardList}">
						<!-- 후기 리스트 -->
						<div
							class="list-group-item list-group-item-action d-flex gap-3 py-3"
							style="width: 700px;" id="boardForm">
							<div class="d-flex gap-2 w-100 justify-content-between">
								<div>
									<i class="bi bi-person-fill">${board.customerEmail }</i>
									<p class="mb-1">${board.boardContent }</p>
									<br>
								</div>
								<div>
									<c:if test="${sessionScope.loginCustomer == board.customerEmail || loginStaff != null }">
										<div style="text-align: right;">
											<a href="${pageContext.request.contextPath}/removeBoardOne?ordersNo=${board.ordersNo}&goodsNo=${board.goodsNo}"class="btn btn-sm btn-outline-danger">
												remove
											</a>
										</div>
									</c:if>
									<br>
									<br> 
									<div>
										
										<small class="opacity-75 text-nowrap" id="createDate">
											
											CreateDate : ${fn:substring(board.createDate,0,10)}
										</small>
									</div>	
								</div>
							</div>
						</div>
						<br>
					</c:forEach>
				</div>
			</div>
				<!-- review pagination -->
			
					<c:if test="${boardList == null && boardList.size() == 0}">
					</c:if>
					
					<c:if test="${boardList != null && boardList.size() != 0}">
					
					<section class="py-5">
				    <div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; ">
				                    
				        <!-- 첫 페이지 -->
				        <c:choose>
				            <c:when test="${!(page.currentPage > 1)}">
				                <a href="" style="pointer-events: none;">&laquo;</a>
				            </c:when>
				            <c:otherwise>
				                <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=1">&laquo;</a>
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
				                <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=${page.getPreviousGroupEnd()}">
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
				                <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=${num}">${num}</a>
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
				                <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=${page.getLastGroupStart()}">
				                    Next
				                </a>
				            </c:when>
				            <%-- 그 외는 다음 그룹의 첫 번째 번호로 이동--%>
				            <c:otherwise>
				                <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=${page.getNextGroupStart()}">
				                    Next
				                </a>
				            </c:otherwise>
				            
				        </c:choose>
				        <!-- 마지막 페이지 -->
				        <c:if test="${!(page.currentPage < page.lastPage)}">
				            <a href="" style="pointer-events: none;">&raquo;</a>
				        </c:if>
				        <c:if test="${page.currentPage < page.lastPage}">
				            <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${goodsNo}&currentPage=${page.lastPage}">&raquo;</a>
				        </c:if>
				        
				    </div>
					</section>
					
					</c:if>
					
				
			</div>
		</section>

     
        
        <!-- 푸터 -->
    	<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath }/js/scripts.js"></script>
    </body>
</html>
