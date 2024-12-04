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
			
			// 파일 수정 버튼
			$('#btnModifyGoods').click(function() {
				
				if($('#goodsTitle').val() == null || $('#goodsTitle').val() == '') {
					alert('수정할 상품 이름을 입력하세요');
					$('#goodsTitle').focus();
					return;
				} else if($('#goodsPrice').val() == null || $('#goodsPrice').val() == '') {
					alert('수정할 가격을 입력하세요');
					$('#goodsPrice').focus();
					return;
				} else if (!/^\d+$/.test($('#goodsPrice').val())) {  // 숫자만 허용
					alert('가격은 숫자만 입력 가능합니다');
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
					$('#formModifyGoods').submit();
				}
			});
			
			// 파일 삭제 버튼 클릭
			$('.btnRemoveFile').click(function(event) {
				// 기본 링크 클릭 동작을 막기 (페이지 이동을 막기)
				event.preventDefault();
				
				// 삭제 확인 
				var result = confirm("정말로 삭제하시겠습니까?");
				if (result) {
					window.location.href = $(this).attr('href');
					alert('삭제 성공하였습니다.');
				} else {
					return false;
				}
			});
		});
	</script>
	<style>
	    /* 왼쪽 정렬을 더욱 강화 (col-md-5만 밀기) */
	    .container {
	        margin-left: -30px; /* 더 왼쪽으로 밀기 */
	    }
	    .row {
	        margin-left: -30px; /* 더 왼쪽으로 밀기 */
	    }
	    .col-md-5 {
	        margin-left: -50px; /* 왼쪽 여백을 더 줄여서 밀기 */
	    }
	    .col-md-6 {
	        margin-left: 100px; /* 왼쪽 여백을 더 줄여서 밀기 */
	    }
	</style>
	<meta charset="UTF-8">
	<title>Modify Goods</title>
</head>
<body>
	<!-- header -->
	<div>
		<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	</div>
	
		
	<div class="row">
        <!-- leftbar -->
		<div class="col-sm-2 p-0">
			<c:import url="/WEB-INF/view/inc/staffLeftMenu.jsp"></c:import>
		</div>
		
		<!-- main -->
		<div class="col-sm-10 p-0">
			<div style="margin-left: 80px; margin-top: 90px;">
				<div>
					<h3>Modify Goods</h3>
				</div>
				<form id="formModifyGoods" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/staff/modifyGoods">
					<div class="container px-4 px-lg-1 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
							<!-- 이미지 ~ 상품 상세설명 -->
							<div class="col-md-5">
								<div class="d-flex gap-1 py-3 bg-light" style="width: 650px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 10px; padding: 20px;">
									<c:if test="${empty goodsFileList}">
										<div class="d-flex align-items-center justify-content-center" style="height: 100px; width: 100%;">
											<span>첨부된 파일이 없습니다.</span>
										</div>
									</c:if>
									<c:if test="${not empty goodsFileList}">
										<div>
											<c:forEach var="gf" items="${goodsFileList}">
												<div class="d-flex mb-3"> 
													<div class="mr-3 d-flex align-items-center justify-content-center">
														<img src="${pageContext.request.contextPath}/goodsFile/${gf.goodsFileName}.${gf.goodsFileExt}" alt="${gf.goodsFileOriginName}" class="img-thumbnail" style="width: 250px; height: 200px; object-fit: cover;" />
													</div>
													<div class="d-flex flex-column justify-content-between" style="margin-left: 10px;">
														<small class="mt-1 mb-0">FileOriginName : ${gf.goodsFileOriginName}</small>
														<small class="mt-1 mb-0">FileName : ${gf.goodsFileName}</small>
														<small class="mt-1 mb-0">Ext : ${gf.goodsFileExt}</small>
														<small class="mt-1 mb-0">Type : ${gf.goodsFileType}</small>
														<small class="mt-1 mb-0">Size : ${gf.goodsFileSize} Byte</small>
														<small class="mt-1 mb-0">CreateDate : ${gf.createDate}</small>
														<div style="display: flex; justify-content: flex-start;">
															<a href="${pageContext.request.contextPath}/staff/removeGoodsFile?goodsFileNo=${gf.goodsFileNo}&goodsNo=${gf.goodsNo}" class="btnRemoveFile btn btn-sm btn-outline-danger" style="width: 50px; height: 	px;">삭제</a>
														</div>
													</div>
												</div>
													<hr style="width: 610px;">
											</c:forEach>
										</div>
									</c:if>
								</div>
								<div class="d-flex justify-content-end" style="margin-top: 10px; width: 650px;">
									<button id="btnAddFile" type="button" class="btn btn-sm btn-outline-primary" style="margin-right: 7px;">파일 첨부</button>
									<button id="btnRemoveFile" type="button" class="btn btn-sm btn-outline-danger">파일 삭제</button>
								</div>
								<div id="fileDiv" class="d-block" style="text-align: right;">
									
								</div>
							</div>
							<div class="col-md-6 px-lg-5">
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-tags">&nbsp;</i> <span style="font-size: large;"> No : </span>  
									<input type="text" id="goodsNo" name="goodsNo" value="${goods.goodsNo}" readonly style="color:blue; text-align:center; width: 100px; height: 30px; border-radius: 10px;">
								</div>
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-box-seam">&nbsp;</i> <span style="font-size: large;"> Title : </span>  
									<input type="text" id="goodsTitle" name="goodsTitle" value="${goods.goodsTitle}" style="color:blue; text-align:center; width: 250px; height: 30px; border-radius: 10px;">
								</div>
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-cash-coin">&nbsp;</i>
									<input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice}" style="color:blue; text-align:center; width: 100px; height: 30px; border-radius: 10px;">
									<span style="font-size: large;">Price</span>
								</div>
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-bookmarks"></i><span style="font-size: large; margin: 5px;">Category List</span><br>
									<select id="categoryNo" name="categoryNo" style="text-align:center; width: 250px; height: 30px; border-radius: 10px;">
										<option selected="selected" value="${goods.categoryNo}">${goods.categoryTitle}</option>
										<c:forEach var="category" items="${categoryList}">
											<option value="${category.categoryNo}">${category.categoryTitle}</option>
										</c:forEach>
									</select>
								</div>
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-card-text"></i><span style="font-size: large; margin: 5px;">Description</span><br>
									<textarea rows="5" cols="60" id="goodsMemo" name="goodsMemo">${goods.goodsMemo}</textarea>
								</div>
								<div class="my-2 py-2">
									<i style="font-size: x-large;" class="bi bi-bell"></i><span style="font-size: large; margin: 5px;">GoodsStatus</span><br>
									<input type="radio" name="goodsStatus" class="goodsStatus" value="재고있음" 
									<c:if test="${goods.goodsStatus == '재고있음'}">checked</c:if>> <span style="margin-right: 30px;">재고있음</span>
									<input type="radio" name="goodsStatus" class="goodsStatus" value="재고없음" 
									<c:if test="${goods.goodsStatus == '재고없음'}">checked</c:if>> <span style="margin-right: 30px;">재고없음</span>
									<input type="radio" name="goodsStatus" class="goodsStatus" value="판매중지"
									<c:if test="${goods.goodsStatus == '판매중지'}">checked</c:if>> <span style="margin-right: 30px;">판매중지</span>
								</div>
								<br>
								<div>
									<button id="btnModifyGoods" type="button" class="btn btn-success" style="width: 475px;">Modify</button>
								</div><br><br>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>