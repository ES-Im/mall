<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>



</style>


<script>
$(document).ready(function(){
	
	
});
</script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


</head>
<body>

	<div class="d-flex justify-content-center">
		<div class="col-sm-3">
			<span class="display-4">add staff </span>
			<form action="#">
				<div class="mb-3 mt-3">
					<label for="email" class="form-label">Email:</label> <input
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
					<label for="pwd" class="form-label">birth</label> <input
						type="date" class="form-control" id=""
						 name="">
				</div>
				<div class="mb-3">
					<label for="pwd" class="form-label"><input type="radio" name="남자" value="남자" >남자</label> 
					<label for="pwd" class="form-label"><input type="radio" name="여자" value="여자" >여자</label> 
				</div>
				
				
				<button type="submit" class="btn btn-dark">Sign Up</button>
			</form>
		</div>
	</div>
	
	
	
</body>
</html>