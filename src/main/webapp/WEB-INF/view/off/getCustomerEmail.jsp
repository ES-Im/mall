<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Add Staff</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    	let responseVal = $("#formResult").val();
    	
    	if (!responseVal) {
	    	// 부모창(addCustomer)에서 입력한 값 가지고 오기
	    	$('#email').val($("#customerEmail", opener.document).val());
	    	// 폼 제출 및 서버에서 쿼리실행한 결과 변수에 저장
	    	$('#formCheckEmail').submit();
	    	let responseVal = $("#formResult").val();
    	}
		
		$('#closePopup').click(function() {
			// 사용가능한 아이디라면 회원가입폼에서 email 칸 readonly로 바꾸고, 이메일 중복 검사 버튼 사라지게 만들기		
		    if(responseVal === "사용가능한 이메일 입니다.") {
				$(window.opener.document).find('#customerEmail').attr('readonly', 'readonly'); 
				$(window.opener.document).find('#customerEmail').css('font-weight', 'bold');
				$(window.opener.document).find('#checkEmail').css('display', 'none');
		    }
           
           window.close();
		});
		
    });
</script>

	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	
</head>
<body>
<div class="row">
	<!-- main -->
	<div class="col-sm-10 p-0">
		<!-- main -->
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-2 align-items-center" style="margin-left: 10px">
			<h3>아이디 중복 검사 결과</h3>
			<div style="border: 1px solid #000; padding: 20px; border-radius: 10px; width: 450px;">
	            <form id="formCheckEmail" method="get" action="${pageContext.request.contextPath}/off/getCustomerEmail">
			        <input id="email" name="email" type="hidden" class="form-control" placeholder="Enter customer Email" type="hidden">
			       	<input id="formResult" type="hidden" value="${formResult}">
				</form>
				<p>${formResult}</p>
	    	 </div>
		    	<button id="closePopup" type="button" class="btn btn-sm btn-outline-primary">확인</button>
    	</div>
	</div>
</div>

</body>

</html>