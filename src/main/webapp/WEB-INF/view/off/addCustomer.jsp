<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Add Staff</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
	#addCustomer{
		font-family: Helvetica, Arial, sans-serif;
	}

</style>


<script>
    $(document).ready(function() {
		
    	// 이메일 중복 검사 버튼 클릭시 팝업창 연결
		$('#checkEmail').click(function() {
			// 이메일 유효성 검사
			const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
			
			if(emailTest.test($('#customerEmail').val()) == false){
				alert('E-Mail을 입력해주세요.');
				$('#customerEmail').focus();
				return;
			}
			
			// 결과 팝업창으로 알려주기
			window.open('${pageContext.request.contextPath}/off/getCustomerEmail', '_blank', 'width=450, height=200, top=10, left=200');
		});
		
		$('#btnAddCustomer').click(function() {
			const today = new Date();
			const birthDay = new Date($('#customerBirth').val());
			
			// 아이디 중복 검사 했는지 체크
			if(!$('#customerEmail').attr('readonly')) {
				alert('아이디 중복검사를 해주세요.');
				return;
			}
			
			// 비밀번호 유효성 검사
			if($('#customerPw').val().trim() === ''){
				alert('password를 입력해주세요.');
				$('#customerPw').focus();
				return;
			}
			// 비밀번호 확인
			if($('#customerPw').val() !== $('#reCustomerPw').val()){
				alert('password가 일치하지 않습니다.');
				$('#customerPw').focus();
				return;
			}
			
			if(!$("input[name='customerGender']:checked").val()){
				alert('성별을 선택해주세요');
				return;
			}
			
			// 생일 유효성 검사
			if($('#customerBirth').val().trim() === '') {
				alert('생일을 입력해주세요');
				return;
			} 
			if(today < birthDay) {
				alert('생일은 미래 날짜가 될 수 없습니다.');
				return;
			}
			
			$('#formAddcustomer').submit();
			
		});
		

		// 만약, 회원등록 쿼리가 실패했다면( = #formResult != null), alert창 출력
		if($("#formResult").val()) {
			alert($("#formResult").val());
		}
	      
    });
</script>
<style>
	
</style>
</head>
<body>
<div class="row">
	<!-- main -->
	<div class="col-sm-12">
		<!-- header -->
		<div>
			<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		</div>
		
		<!-- main -->
<div class="col-sm-12 d-flex justify-content-center align-items-center flex-column">
    <h3 id="addCustomer" style="margin-top:50px; margin-bottom: 30px; ">Join</h3>
    <form id="formAddcustomer" method="post" action="${pageContext.request.contextPath}/off/addCustomer" 
          style="border: 1px solid #000; padding: 20px; border-radius: 10px; width: 400px;">
        <div class="mb-3 mt-3">
            <label for="customerEmail" class="form-label">Email :</label>
            <input id="customerEmail" name="customerEmail" type="text" class="form-control" placeholder="Check email duplication first">
        </div>
        <div class="d-flex justify-content-end mb-1">
        	<button type="button" id="checkEmail" class="btn btn-sm btn-outline-primary">이메일 중복 검사</button>
        </div>
        <div class="mb-3">
            <label for="customerPw" class="form-label">Password :</label>
            <input id="customerPw" name="customerPw" type="password" class="form-control" placeholder="Enter Password">
        </div>
        <div class="mb-3">
            <label for="reCustomerPw" class="form-label">Confirm Password :</label>
            <input id="reCustomerPw" name="reCustomerPw" type="password" class="form-control" placeholder="Confirm Password">
        </div>

        <div class="mb-3 mt-3">
            <label for="customerGender" class="form-label">Gender :</label>
            <br>
            <input name="customerGender" type="radio" value="남자"> 남자
            <input name="customerGender" type="radio" value="여자"> 여자
        </div>
        <div class="mb-3 mt-3">
            <label for="customerBirth" class="form-label">Birth :</label>
            <input name="customerBirth" type="date" class="form-control" id="customerBirth" placeholder="Enter customer ID">
        </div>
        <div class="d-flex justify-content-end" >
        	<button id="btnAddCustomer" type="button" class="btn btn-sm btn-outline-dark">Join</button>
        </div>
        <input id="formResult" type="hidden" value="${alertFailedMsg}">
    </form>
</div>

    	
    	
	</div>
</div>
<!-- footer -->

</body>

</html>