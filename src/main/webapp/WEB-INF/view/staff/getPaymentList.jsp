<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		
		
	 	
	 	
	 	
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
<meta charset="UTF-8">
<title>PAYMENT LIST</title>
</head>
<body>
<div class="row">
	<!-- leftbar -->
	<div class="col-sm-2 p-0">
		<div >
			<c:import url="/WEB-INF/view/inc/staffLeftMenu.jsp"></c:import>
		</div>
	</div>
	
	<!-- main -->
	<div class="col-sm-10 p-0">
		<!-- header -->
		<div>
			<c:import url="/WEB-INF/view/inc/staffHeader.jsp"></c:import>
		</div>
		<!-- main -->
		<div style="margin-left: 80px; margin-top: 30px;">
			<div>
				<h3>PAYMENT LIST</h3>
			</div>
			<div class="d-flex justify-content-end " style="width: 1050px;">
				<form id="formGoodsSearch" method="get" action="${pageContext.request.contextPath}/staff/getPaymentList"}>
					<input type="text" name="searchWord" id="searchWord" value="${searchWord}"> 
					<button id="btnGoodsSearch" type="submit" class="btn btn-sm btn-outline-success align-items-center">Search</button>
				</form>
			</div>
		</div>
		
		<!-- updateDate 기준으로 그룹화 출력 -->
        <c:set var="previousDate" value="" /> <!-- 이전 날짜를 저장할 변수 -->
        
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="list-group">
	  			
	  			<!-- paymentList 반복문 -->
 				<c:forEach var="payment" items="${paymentList}">
 				
                <!-- paymentNo/회원 아이디 기준 추출 -->
             <%--    <c:if test=""> --%>
            
                    <div class="d-flex gap-1 py-1 bg-light" style="width: 1000px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 10px; padding: 10px;">
                    	<div class="d-flex align-items-center" style="width: 100%;">
                        	<div style="margin-left: 20px;">
                            	<span> (${payment.paymentNo })${payment.customerEmail }</span>
                          	</div>
                          	<div>${payment.paymentStatus }</div>
                      	</div>
                  	</div>
              	<%-- </c:if> --%>
              		
              		<!-- 해당 페이먼트의 orders 출력을 위한 반복문 -->
              		<c:forEach var="orders" items="${PayInfoListByPaymentNo}">
              	
              	
	 					<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 1000px;">
	 						<div class="d-flex justify-content-center align-items-center">
	 							<!-- 파일 있을 때 -->
	 							<c:if test="${not empty orders.goodsFileNo}">
	 								<img src="${pageContext.request.contextPath}/goodsFile/${orders.goodsFileName}.${orders.goodsFileExt}" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
	 							</c:if>
	 							<!-- 파일 없을 때 -->
	 							<c:if test="${empty goods.goodsFileNo}">
	 								<div style="align-items: center;">
	 									<img src="${pageContext.request.contextPath}/goodsFile/Preparing_the_product_img.jpg" alt="Preparing the product Image" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
	 								</div>
	 							</c:if>
	 						</div>
	      					<div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
						        	
	      							<p class="mt-2 mb-0"><small>Category : ${orders.categoryTitle}</small></p>
	      							<div class="d-flex justify-content-between">
									    <div style="flex-grow: 1;"> 
									        <p class="mt-2 mb-0"><small>Description : ${orders.goodsMemo}</small></p>
									        <div class="d-flex justify-content-between mt-2 align-items-center">
									        	<div>
									        		<small class="opacity-75">UpdateDate : ${orders.updateDate}</small>
									        	</div>
									        	
									        </div>
									    </div>
									</div>
						        </div>
				        	</div>
				    	</div>
			    	</c:forEach><!-- orders 반복문 끝 -->
			    	<br>
 				</c:forEach>
 				
 				
 				
 				<div style="width: 1000px; text-align: right;">
 					<a href="${pageContext.request.contextPath}/staff/addGoods" class="btn btn-sm btn-outline-primary">상품추가</a>
 				</div>
 				
			
	  		</div>
		</div>
	</div>
</div>
<!-- footer -->



</body>

</html>