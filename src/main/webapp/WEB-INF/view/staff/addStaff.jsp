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
			
			// 스태프 추가 유효성 검사
			$('#btnAddStaff').click(function(){
				
				const staffId = $('#staffId').val();
				const firstName = $('#firstName').val();
				const lastName = $('#lastName').val();
				const staffPw = $('#staffPw').val();
				const reStaffPw = $('#ReStaffPw').val();
				
				if (staffId == '' || staffId == null || staffId.length < 4) { // 아이디
					alert('Staff ID를 입력하세요 (4자이상)');
					$('#staffId').focus();
					return;
				} else if (!staffId.startsWith('@')) {
					alert('Staff ID는 "@"로 시작해야 합니다');
					$('#staffId').focus();
					return;
				} else if (firstName == '' || firstName == null) { // 이름
					alert('First Name을 입력하세요');
					$('#firstName').focus();
					return;
				} else if (!/^[가-힣a-zA-Z]+$/.test(firstName)) {
					alert('First Name은 한글, 영어만 입력 가능합니다');
					$('#firstName').focus();
					return;
				} else if (lastName == '' || lastName == null) {
					alert('Last Name을 입력하세요');
					$('#firstName').focus();
					return;
				} else if (!/^[가-힣a-zA-Z]+$/.test(lastName)) {
					alert('Last Name은 한글, 영어만 입력 가능합니다');
					$('#lastName').focus();
					return;
				} else if (staffPw == '' || staffPw == null) { // 비밀번호
					alert('PassWord를 입력하세요');
					$('#staffPw').focus();
					return;
				} else if (reStaffPw  == '' || reStaffPw  == null) {
					alert('PassWord를 확인하세요');
					$('#reStaffPw').focus();
					return;
				} else if (staffPw.length < 4 && reStaffPw.length < 4) {
					alert('PassWord는 4자리 이상 입력해주세요');
					$('#staffPw').focus();
					return;
				} else if (staffPw != reStaffPw) {
					alert('PassWord가 서로 다릅니다');
					$('#staffPw').focus();
					return;
				} else {
					$('#formAddStaff').submit(); // 성공
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
				<h3>직원 등록</h3>
			</div>
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-2 align-items-center" style="margin-left: 110px; margin-top: 25px;">
				<form id="formAddStaff" method="post" action="${pageContext.request.contextPath}/staff/addStaff" style="border: 1px solid #000; padding: 20px; border-radius: 10px; width: 400px;">
					<div class="mb-3 mt-3">
						<label for="staffId" class="form-label">Staff ID :</label> 
						<input type="text" class="form-control" id="staffId" placeholder="Enter Staff ID" name="staffId">
					</div>
					<div class="mb-3">
						<label for="firstName" class="form-label">FirstName :</label> 
						<input type="text" class="form-control" id="firstName" placeholder="Enter FirstName" name="firstName">
					</div>
					<div class="mb-3">
						<label for="lastName" class="form-label">LastName :</label> 
						<input type="text" class="form-control" id="lastName" placeholder="Enter LastName" name="lastName">
					</div>
					<div class="mb-3">
						<label for="staffPw" class="form-label">Password :</label> 
						<input type="password" class="form-control" id="staffPw" placeholder="Enter Password" name="staffPw">
					</div>
					<div class="mb-3">
						<label for="ReStaffPw" class="form-label">Confirm Password :</label> 
						<input type="password" class="form-control" id="ReStaffPw" placeholder="Confirm Password" name="ReStaffPw">
					</div>
				</form>
    		</div>
			<div class="d-flex justify-content-end" style="margin-top:5px; width: 535px;">
					<c:if test="${not empty addStaffError}">
						<span style="margin-right: 20px; align-content: center; color: red;">* ${addStaffError}</span>
					</c:if>
					<a href="${pageContext.request.contextPath}/staff/getStaffList" class="btn btn-sm btn-outline-danger" style="margin-right: 7px;">Cancel</a>
					<button type="button" id="btnAddStaff" class="btn btn-sm btn-outline-primary">Add Staff</button>
			</div>
		</div>
	</div>
</body>
</html>