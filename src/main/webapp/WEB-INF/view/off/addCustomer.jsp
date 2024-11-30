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
    	
		$('#btnAddStaff').click(function(){
			
	      
    });
</script>
<style>
	
</style>
</head>
<body>
<div class="row">
	<!-- main -->
	<div class="col-sm-10 p-0">
		<!-- header -->
		<div>
			<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		</div>
		<!-- main -->
		<div style="margin-left: 80px; margin-top: 30px;">
			<h3>Add customer</h3>
		</div>
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-2 align-items-center" style="margin-left: 110px; margin-top: 25px;">
           <form id="formAddcustomer" method="post" action="${pageContext.request.contextPath}/customer/addcustomer" style="border: 1px solid #000; padding: 20px; border-radius: 10px; width: 400px;">
			    <div class="mb-3 mt-3">
			        <label for="customerEmail" class="form-label">Email :</label> 
			        <input type="text" class="form-control" id="customerEmail" placeholder="Enter customer Email" name="customerEmail">
			    </div>
			    <div class="mb-3">
			        <label for="customerPw" class="form-label">Password :</label> 
			        <input type="password" class="form-control" id="customerPw" placeholder="Enter Password" name="customerPw">
			    </div>
			    <div class="mb-3">
			        <label for="reCustomerPw" class="form-label">Confirm Password :</label> 
			        <input type="password" class="form-control" id="reCustomerPw" placeholder="Confirm Password" name="reCustomerPw">
			    </div>
			    
			    <div class="mb-3 mt-3">
			        <label for="customerGender" class="form-label">Gender :</label> 
			        <input type="radio" class="" id="customerGender" placeholder="Enter customer ID" name="customerGender" value="남자">남자
			        <input type="radio" class="" id="customerGender" placeholder="Enter customer ID" name="customerGender" value="여자">여자
			    </div>
			    <div class="mb-3 mt-3">
			        <label for="customerBirth" class="form-label">Birth :</label> 
			        <input type="date" class="form-control" id="customerBirth" placeholder="Enter customer ID" name="customerBirth">
			    </div>
			</form>
    	</div>
        <div class="d-flex justify-content-end" style="margin-top:5px; width: 535px;">
        	<button type="button" id="btnAddCustomer" class="btn btn-sm btn-outline-primary">Join</button>
       	</div>
	</div>
</div>
<!-- footer -->

</body>

</html>