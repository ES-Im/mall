<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
    
    
    
    
    </style>
    <script>
	$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
		// URL 파라미터 값을 가져오는 함수
        function getMsg(param) {
            const urlMsg = new URLSearchParams(window.location.search);
            let value = urlMsg.get(param);  // 'msg' 파라미터 값 가져오기

            // 한글 디코딩
            if (value) {
                value = decodeURIComponent(value);  // URL 디코딩
            }
            return value;
        }

        // 'msg' 값 가져오기
        const msg = getMsg('msg');
		
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
                	<!-- 이미지 ~ 상품 상세설명 -->
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">GOODSNO : ${goods.goodsNo }</div>
                        <h1 class="display-5 fw-bolder">${goods.goodsTitle }</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$450000</span>
                            <span>${goods.goodsPrice }</span>
                        </div>
                        <p class="lead">${goods.goodsMemo }</p>
                        
                        <!-- 장바구니  -->
                        <div class="d-flex">
                        	<c:if test="${goods.goodsStatus == '재고있음' }">
                        		<input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
	                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
	                                <i class="bi-cart-fill me-1"></i>
	                                Add to cart
	                            </button>
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
			<div class="d-flex justify-content-center"><p class="h2"> 후기 </p></div>
      
      	  <!-- 후기 작성 폼 -->
      	  <div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
      	  	<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;" id="boardForm">
				
				<c:if test="${isEligibleReviewer == true || loginStaff != null }">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div class="${pageContext.request.contextPath }/addBoardOne" >
							<form action="#" method="post">
								<input type="hidden" name="ordersNo" value="${orderNo}">
								<input type="hidden" name="goodsNo" value="${goodsNo}">
								
								<label for="comment" class="mb-2">후기 작성 </label>
								<textarea class="form-control" rows="5" cols="90" id="comment" name="boardContent"></textarea>
								<div class="d-flex justify-content-end">
									<button type="button" class="btn btn-sm btn-dark mt-3" > WRITE </button>
								</div>	
							</form>
						</div>
					</div>
					
				</c:if>	
			</div>
      	  
      	  </div>
        
        
        
			
			
			
			
			<div
				class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
				<div class="list-group">
					<c:forEach var="board" items="${boardList}">
						<!-- 후기 폼 -->
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
