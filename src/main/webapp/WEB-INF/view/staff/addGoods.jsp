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
		
		// 파일 첨부 버튼
		$('#btnAddFile').click(function() {
			if($('.goodsFile').last().val() == '') { // 마지막 input=file값이 공백이라면
				alert('첨부하지 않은 파일이 이미 존재');
			} else {
				let html = '<div><input type="file" name="goodsFile" class="goodsFile mt-1"></div>';
				$('#fileDiv').append(html);
			}
		});
		
		// 파일 삭제 버튼
		$('#btnRemoveFile').click(function() {
			if($('.goodsFile').length == 0) {
				alert('삭제 할 File이 존재하지 않습니다');
			} else {
				$('.goodsFile').last().closest('div').remove();	
			}
		});
		
		
	 	
	});
	</script>
	<style>
		
	</style>
<meta charset="UTF-8">
<title>Add Goods</title>
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
				<h3>Add Goods</h3>
			</div>
			<form id="formAddGoods" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/staff/addActor">
				<div class="container px-4 px-lg-5 my-5">
	                <div class="row gx-4 gx-lg-5 align-items-center">
	                	<!-- 이미지 ~ 상품 상세설명 -->
	                    <div class="col-md-6">
	                    	<img class="card-img-top mb-5 mb-md-0" style="width: 500px; height: 600px;" src="${pageContext.request.contextPath}/goodsFile/addGoodsImage.png" />
	                    	<div class="d-flex justify-content-end" style="margin-top: 10px; width: 500px;">
	                    		<button id="btnAddFile" type="button" class="btn btn-sm btn-outline-primary" style="margin-right: 7px;">파일 첨부</button>
	                    		<button id="btnRemoveFile" type="button" class="btn btn-sm btn-outline-danger">파일 삭제</button>
	                    	</div>
                    		<div id="fileDiv" class="d-block" style="text-align: right;">
                    			
                    		</div>
	                   	</div>
	                    <div class="col-md-6">
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: xx-large;" class="bi bi-box-seam">&nbsp;</i> <span style="font-size: x-large;"> Title : </span>  
	                    		<input type="text" placeholder="상품을 입력하세요" style="text-align:center; width: 250px; height: 40px; border-radius: 10px;">
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: xx-large;" class="bi bi-cash-coin">&nbsp;</i>
	                    		<input type="text" placeholder="금액" style="text-align:center; width: 100px; height: 40px; border-radius: 10px;">
	                    		<span style="font-size: large;">Price</span>
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<p style="font-size: large; margin: 5px;">Category List</p>
	                    		<select id="categoryNo" name="categoryNo" style="text-align:center; width: 250px; height: 40px; border-radius: 10px;">
					    			<option value="">Select Category</option>
					    			<c:forEach var="category" items="${categoryList}">
					    				<option value="${category.categoryNo}">${category.categoryTitle}</option>
					    			</c:forEach>
					    		</select>
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<p style="font-size: large; margin: 5px;">Description</p>
	                    		<textarea rows="5" cols="60"></textarea>
	                    	</div>
	                    	<div style="height: 200px;"></div>
	                    </div>
	                </div>
	            </div>
            </form>
		</div>
	</div>
</div>
<!-- footer -->



</body>
</html>