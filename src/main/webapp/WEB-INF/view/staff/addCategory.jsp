<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    	
    	// 카테고리 추가 유효성 검사
		$('#btnAddCategory').click(function(){
			
	        const categoryTitle = $('#categoryTitle').val();
			
			if (categoryTitle == '' || categoryTitle == null) { // 아이디
	            alert('Category Title을 입력하세요');
	            $('#categoryTitle').focus();
	            return;
	        } else if(!/^[가-힣a-zA-Z]+$/.test(categoryTitle)) {
	        	alert('Category Title은 한글, 영어만 입력 가능합니다');
	            $('#categoryTitle').focus();
	            return;
	        } else {
	        	$('#formAddCategory').submit(); // 성공
	        }
		});
    });
</script>
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
				<h3>카테고리 등록</h3>
			</div>
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-2 align-items-center" style="margin-left: 110px; margin-top: 25px;">
	            <form id="formAddCategory" method="post" action="${pageContext.request.contextPath}/staff/addCategory" style="border: 1px solid #000; padding: 20px; border-radius: 10px; width: 400px;">
	                <div class="mb-3 mt-3">
	                    <label for="categoryTitle" class="form-label">Category Title :</label> 
	                    <input type="text" class="form-control" id="categoryTitle" placeholder="Enter Category Title" name="categoryTitle">
	                </div>
	            </form>
	    	</div>
	        <div class="d-flex justify-content-end" style="margin-top:5px; width: 535px;">
	        	<a href="${pageContext.request.contextPath}/staff/getCategoryList" class="btn btn-sm btn-outline-danger" style="margin-right: 7px;">Cancel</a>
	        	<button type="button" id="btnAddCategory" class="btn btn-sm btn-outline-primary">Add Category</button>
	       	</div>
       	</div>
	</div>

</body>

</html>