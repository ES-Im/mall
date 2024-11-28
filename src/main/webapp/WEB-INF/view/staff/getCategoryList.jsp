<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		// 카테고리 삭제 버튼 클릭
	    $('.btnRemoveCategory').click(function(event) {
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
	
	</style>
<meta charset="UTF-8">
<title>Category List</title>
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
			<h3>Category List</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="list-group">
 				<c:forEach var="category" items="${categoryList}">
 					<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 500px;">
      					<div class="d-flex gap-2 w-100 justify-content-between">
					        <div>
      							<i class="bi bi-bookmark-fill"></i><span> CategoryNo. ${category.categoryNo}</span>
					        	<p class="mt-2 mb-0">Title : ${category.categoryTitle}</p>
					        </div>
			        		<div style="text-align: right;">
							    <a href="${pageContext.request.contextPath}/staff/removeCategory?categoryNo=${category.categoryNo}" class="btnRemoveCategory btn btn-sm btn-outline-danger">
								   remove
								</a>
							</div>
			        	</div>
			    	</div>
			    	<br>
 				</c:forEach>
 				<div style="width: 500px; text-align: right;">
 					<a href="${pageContext.request.contextPath}/staff/addCategory" class="btn btn-sm btn-outline-primary">addCategory</a>
 				</div>
	  		</div>
		</div>
	</div>
</div>
<!-- footer -->



</body>

</html>