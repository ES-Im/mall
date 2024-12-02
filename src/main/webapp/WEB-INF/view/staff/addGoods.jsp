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
		
		// 파일 추가 버튼
		$('#btnAddGoods').click(function() {
			
			if($('#goodsTitle').val() == null || $('#goodsTitle').val() == '') {
				alert('상품 이름을 입력하세요');
				$('#goodsTitle').focus();
				return;
			} else if($('#goodsPrice').val() == null || $('#goodsPrice').val() == '') {
				alert('가격을 입력하세요');
				$('#goodsPrice').focus();
				return;
			} else if (!/^\d+$/.test($('#goodsPrice').val())) {  // 숫자만 허용
		        alert('가격은 숫자만 입력 가능합니다');
		        $('#goodsPrice').focus();
		        return;
		    } else if (/^0/.test($('#goodsPrice').val())) {  // 첫 번째 숫자가 0인 경우
		        alert('가격은 0으로 시작할 수 없습니다');
		        $('#goodsPrice').focus();
		        return;
		    } else if($('#categoryNo').val() == null || $('#categoryNo').val() == '') {
				alert('카테고리를 선택하세요');
				$('#categoryNo').focus();
				return;
			} else if($('#goodsMemo').val() == null || $('#goodsMemo').val() == '') {
				alert('상품 설명을 입력하세요');
				$('#goodsMemo').focus();
				return;
			} else if($('.goodsFile').length > 0 && $('.goodsFile').last().val() == '') {
				alert('첨부되지 않은 파일이 있습니다');
				return;
			} else {
				$('#formAddGoods').submit();
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
			<form id="formAddGoods" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/staff/addGoods">
				<div class="container px-4 px-lg-1 my-5">
	                <div class="row gx-4 gx-lg-5 align-items-center">
	                	<!-- 이미지 ~ 상품 상세설명 -->
	                    <div class="col-md-5">
	                    	<img class="card-img-top mb-5 mb-md-0" style="width: 500px; height: 600px;" src="${pageContext.request.contextPath}/goodsFile/addGoodsImage.png" />
	                    	<div class="d-flex justify-content-end" style="margin-top: 10px; width: 500px;">
	                    		<button id="btnAddFile" type="button" class="btn btn-sm btn-outline-primary" style="margin-right: 7px;">파일 첨부</button>
	                    		<button id="btnRemoveFile" type="button" class="btn btn-sm btn-outline-danger">파일 삭제</button>
	                    	</div>
                    		<div id="fileDiv" class="d-block" style="text-align: right;">
                    			
                    		</div>
	                   	</div>
	                    <div class="col-md-6 px-lg-5">
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: x-large;" class="bi bi-box-seam">&nbsp;</i> <span style="font-size: large;"> Title : </span>  
	                    		<input type="text" id="goodsTitle" name="goodsTitle" placeholder="상품을 입력하세요" style="text-align:center; width: 250px; height: 30px; border-radius: 10px;">
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: x-large;" class="bi bi-cash-coin">&nbsp;</i>
	                    		<input type="text" id="goodsPrice" name="goodsPrice" placeholder="금액" style="text-align:center; width: 100px; height: 30px; border-radius: 10px;">
	                    		<span style="font-size: large;">Price</span>
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: x-large;" class="bi bi-bookmarks"></i><span style="font-size: large; margin: 5px;">Category List</span><br>
	                    		<select id="categoryNo" name="categoryNo" style="text-align:center; width: 250px; height: 30px; border-radius: 10px;">
					    			<option value="">Select Category</option>
					    			<c:forEach var="category" items="${categoryList}">
					    				<option value="${category.categoryNo}">${category.categoryTitle}</option>
					    			</c:forEach>
					    		</select>
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: x-large;" class="bi bi-card-text"></i><span style="font-size: large; margin: 5px;">Description</span><br>
	                    		<textarea rows="5" cols="60" id="goodsMemo" name="goodsMemo" placeholder="상품 설명..."></textarea>
	                    	</div>
	                    	<div class="my-2 py-2">
	                    		<i style="font-size: x-large;" class="bi bi-bell"></i><span style="font-size: large; margin: 5px;">GoodsStatus</span><br>
	                    		<input type="radio" name="goodsStatus" class="goodsStatus" value="재고있음" checked> <span style="margin-right: 30px;">재고있음</span>
	                    		<input type="radio" name="goodsStatus" class="goodsStatus" value="재고없음"> <span style="margin-right: 30px;">재고없음</span>
	                    		<input type="radio" name="goodsStatus" class="goodsStatus" value="판매중지"> <span style="margin-right: 30px;">판매중지</span>
	                    	</div>
	                    	<br>
	                    	<div>
		                    	<button id="btnAddGoods" type="button" class="btn btn-primary" style="width: 475px;">Submit</button>
	                    	</div><br><br>
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