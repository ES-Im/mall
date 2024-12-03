<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

</style>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		// 테이블 상단 "전체선택"버튼 : 모든 cartNo 체크박스 활성화/비활성화	
		$(deleteAllBtn).hide();
		$(selectAllBtn).click(function() {
		    $('input:checkbox').prop('checked', true);
		    
		    $(selectAllBtn).hide();	// 클릭시 전체선택 버튼 숨기고, 전체해제 버튼 보이게 하기
		    $(deleteAllBtn).show(); 
		});


		$(deleteAllBtn).click(function() {  
		    $('input:checkbox').prop('checked', false);
		    
		    $(deleteAllBtn).hide(); // 클릭시 전체해제 버튼 숨기고, 전체선택 버튼 보이게 하기
		    $(selectAllBtn).show();
		});
		
		
		// 테이블 상단 "결제하기"버튼 : (폼 post 전송) 선택한 OrderNo 리스트 결제 하기 화면으로 이동 
		$(payOnCheckedBtn).click(function() {
			// 선택한 orderNo이 없으면 alert창 띄우기 
			if($('input:checkbox:checked').length < 1) {
				alert("결제할 상품을 선택해주세요.");
				return;
			}
			// 선택한 orderNo이 1개 이상이라면 /customer/getCartListByChecked 로 이동
			$(selectCartNoForm).submit();
		});
	});
	
</script>

<style>
		.goods-link {
        	color: black;
        	text-decoration: none;
        }
        
        .goods-link:hover {
            color: #D8D8D8;
            text-decoration: none;
        }
        
        .goods-link:visited {
        	color: black;
        	text-decoration: none;
        }
		
	</style>

</head>

<body>
    <div class="row">
        <!-- leftbar -->
        <div class="col-sm-2 p-0">
            <div>
                <c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
            </div>
        </div>
        
        <!-- main -->
        <div class="col-sm-10 p-0">
            <!-- header -->
            <div>
                <c:import url="/WEB-INF/view/inc/customerHeader.jsp"></c:import>
            </div>
                        
            <!-- main -->
            <div style="margin-left: 80px;  margin-top: 30px;">
                <h3>Cart</h3>
            </div>




			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px; ">
			    <!-- 출력할 데이터가 없을 때 -->
			    <c:if test="${empty cartList}">
			        <div>NO DATA</div>
			    </c:if>
			    
			    <!-- 출력할 데이터가 있을 때 -->
			    <c:if test="${not empty cartList}">
			        <form id="selectCartNoForm" method="get" action="${pageContext.request.contextPath}/customer/getCartListByChecked">
			            <!-- 체크박스 전체 조작 및 선택한 체크박스선택하여 결제하기 버튼 -->
			            <div style="text-align: right">
			                <button id="selectAllBtn" type="button" class="btn btn-sm btn-outline-primary">전체선택</button>
			                <button id="deleteAllBtn" type="button" class="btn btn-sm btn-outline-secondary">전체해제</button>
			                <button id="payOnCheckedBtn" type="button" class="btn btn-sm btn-outline-primary">결제하기</button>
			            </div>
			
			            
			            <!-- 장바구니 정보 출력 -->
                        <div class="list-group">

                            <c:forEach items="${cartList}" var="c">
                                <div style="width: 1000px; margin-top: 10px;">
                                    <div class="d-flex gap-1 py-1 bg-light" style="width: 1000px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 10px; padding: 10px;">
                                        <div class="d-flex align-items-center justify-content-between" style="width: 100%; margin-left: 20px;">
                                            <div class=" align-items-center">
                                                <input name="cartNo" type="checkbox" class="checkbox" value="${c.cartNo}">
                                                <span class="goods-link" style="margin-left: 5px;">
                                                    <a href="${pageContext.request.contextPath}/getGoodsOne?goodsNo=${c.goodsNo}" style="text-decoration: none; font-weight: bold;">
                                                        <i class="bi bi-box-seam"> Goods Name : ${c.goodTitle}</i>
                                                    </a>
                                                </span>
                                            </div>
                                            <small>Create Date : ${fn:substring(c.createDate, 0, 10)}</small>
                                        </div>
                                    </div>
                                    
                                        <div class="list-group card">

                                        <div class="d-flex gap-2 w-100 justify-content-between">
                                                
                                            <div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 1000px;">
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <!-- 파일 있을 때 -->
                                                    <c:if test="${not empty c.goodsFileNo}">
                                                        <img src="${pageContext.request.contextPath}/goodsFile/${c.goodsFileName}.${c.goodsFileExt}" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
                                                    </c:if>
                                                    <!-- 파일 없을 때 -->
                                                    <c:if test="${empty goods.goodsFileNo}">
                                                        <div style="align-items: center;">
                                                            <img src="${pageContext.request.contextPath}/goodsFile/Preparing_the_product_img.jpg" alt="Preparing the product Image" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <div class="d-flex gap-2 w-100 justify-content-between">
                                                    <div style="flex-grow: 1; margin-left: 15px;"> 
                                                        <p class="mt-2 mb-0"><small> Goods Name : ${c.goodTitle}</small></p>
                                                        <p class="mt-2 mb-0"><small> Category : ${c.categoryTitle}</small></p>
                                                        <p class="mt-2 mb-0"><small> Goods Price : $ <fmt:formatNumber value="${c.goodsPrice}" pattern="#,###"/></small></p>
                                                        <p class="mt-2 mb-0"><small> Quantity : ${c.cartAmount}</small></p>
                                                        <p class="mt-2 mb-0"><small> TOTAL PRICE : $ <fmt:formatNumber value="${c.totalPrice}" pattern="#,###"/></small></p>
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-between">
                                                        <a href="${pageContext.request.contextPath}/customer/removeCart?cartNo=${c.cartNo}" class="btn btn-sm btn-outline-danger">❌</a>
                                                        <!-- 선택한 cartNo 하나만 결제하기 페이지(getCartListByChecked)로 이동 -->
                                                        <a href="${pageContext.request.contextPath}/customer/getCartListByChecked?cartNo=${c.cartNo}" class="btn btn-outline-primary">결제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                    </form>
                </c:if>
            </div>
			                

        </div>
    </div>
</body>


</html>