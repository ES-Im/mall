<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Get Staff List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {

    });
</script>
<style>
	
</style>
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
			<h3>Add Staff</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
        	<div class="d-flex justify-content-center">
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
	                <div class="d-flex justify-content-end" style="margin-top: 30px;">
	                	<button type="submit" id="btnAddStaff" class="btn btn-sm btn-outline-primary">Add Staff</button>
	                </div>
	            </form>
        	</div>
    	</div>
	</div>
	</div>
</div>
<!-- footer -->

</body>

</html>