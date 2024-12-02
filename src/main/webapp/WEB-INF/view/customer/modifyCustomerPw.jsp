<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		// 비밀번호 변경 : (1) 사용자가 입력한 비밀번호가 맞는지 확인 (2) 맞다면 비밀번호 변경 URL로 이동
		$("#modifyCustomerPwBtn").click(function() {
			// (1) 비밀번호 확인 및 새로운 비밀번호 유효성 검사
			if(!($("#newPw").val() === $("#checkPw").val())) {
				return alert("비밀번호가 틀렸습니다");
			}
			if($("#newPw").val() == '') {
				return alert("변경할 비밀번호를 입력해주세요")
			}
			// (2) 비밀번호 변경 폼 제출
			$('#modifyPw').submit(); // 폼 제출
		});
		
		// 만약, 비밀번호변경이 실패했다면 alert창 출력
		if($("#formResult").val()) {
			alert($("#formResult").val());
		}
		
	});
	</script>
	<style>

	</style>
<meta charset="UTF-8">
<title>${fn:substringBefore(sessionScope.loginCustomer, "@")}</title>

</head>
<body>
<div class="row">
	<!-- leftbar -->
	<div class="col-sm-2 p-0">
		<div >
			<c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
		</div>
	</div>
	
	<!-- main -->
	<div class="col-sm-10 p-0">
		<!-- header -->
		<div>
			<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		</div>
					
		<!-- main -->
		<div style="margin-left: 80px; margin-top: 30px;">
			<h3>Personal_Info</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
	  		<div class="card" style="width: 800px; height: 400px;">
				<div style="margin-left: 80px; margin-top: 30px;">
					<h3>${fn:substringBefore(sessionScope.loginCustomer, "@")} 님 안녕하세요.</h3>
				</div>
				
				<div class="card-body d-flex flex-column flex-md-row p-4 gap-4 py-md-2 " style="margin-left: 90px;">
	                <div class="mb-3 mt-3">
	                	<div class="d-flex justify-content-end">
	                    	<a href="${pageContext.request.contextPath}/customer/getCustomerOne" class="btn btn-sm btn-outline-primary">뒤로가기</a>
	                    </div>
	                    <!-- 비밀번호가 맞는지 확인 및 쿼리 실행결과가 1이 아닐때(쿼리실행실패 = 비밀번호 불일치), alert 창 출력 -->
	                    <div class="row" style="margin-top:5px; width: 535px;">
                               <!-- 비밀번호 변경 폼 -->
		                    <form id="modifyPw" method="post" action="${pageContext.request.contextPath}/customer/modifyCustomerPw">
			                    <label class="form-label" style="margin-top: 15px;">PassWord :</label> 
			                    <input id="newPw" name="newPw" type="password" class="form-control" placeholder="새로운 비밀번호">
			                    <label class="form-label" style="margin-top: 15px;">Confirm PassWord :</label> 
			                    <input id="checkPw" name="checkPw" type="password" class="form-control" placeholder="새로운 비밀번호 확인">
                 	            <div class="d-flex justify-content-end">
				                    <input id="prePw" name="prePw" type="hidden" value="${prePw}">
				                    <button id="modifyCustomerPwBtn" type="button" class="btn btn-sm btn-outline-primary" style="margin-top: 15px;">비밀번호 변경</button>
                               	</div>  
                                   <!-- 서버 결과 메세지를 hidden input 창으로 받기 -> alert 창 알림 -->
		                    	<input id="formResult" type="hidden" value="${alertFailedMsg}">
		                    </form>
	                     </div>
   					</div>
	  			</div>
			</div>
		</div>
	</div>
<!-- footer -->

</body>
</html>