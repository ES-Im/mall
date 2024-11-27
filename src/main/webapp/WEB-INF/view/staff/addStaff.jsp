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
		<div class="d-flex justify-content-center">
		<div class="col-sm-3">
			<span class="display-4">Add STAFF</span>
			<form action="#">
				<div class="mb-3 mt-3">
					<label for="email" class="form-label">Id:</label> <input
						type="email" class="form-control" id="email"
						placeholder="Enter email" name="email">
				</div>
				<div class="mb-3">
					<label for="pwd" class="form-label">Password:</label> <input
						type="password" class="form-control" id="pwd"
						placeholder="Enter password" name="pswd">
				</div>
				<div class="mb-3">
					<label for="pwd" class="form-label">Password:</label> <input
						type="password" class="form-control" id="pwd"
						placeholder="Confirm password" name="pswd">
				</div>
				<div class="mb-3">
					<label for="pwd" class="form-label">FirstName:</label> <input
						type="password" class="form-control" id="pwd"
						placeholder="FirstName:" name="pswd">
				</div>
				<div class="mb-3">
					<label for="pwd" class="form-label">LastName:</label> <input
						type="password" class="form-control" id="pwd"
						placeholder="LastNames" name="pswd">
				</div>
				
				<button type="submit" class="btn btn-dark">Sign Up</button>
			</form>
		</div>
	</div>
	</div>
</div>
<!-- footer -->

</body>

</html>