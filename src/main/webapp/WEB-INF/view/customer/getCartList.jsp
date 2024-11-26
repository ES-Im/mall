<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
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

<div class="justify-content-center">
	<div class="col-sm-8">
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
			<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		</div>
		
			<span class="display-3">CART</span>
		<hr>
		<table class="table">
			<tr>
				<th>goodsNo</th>
				<th>사진</th>
				<th>goodTitle</th>
				<th>cartAmount</th>
				<th>totalPrice</th>
				<th></th>
			</tr>
			<!-- 반복문을 이용하여 출력 -->
			<c:forEach item ="">
			<tr>
				<td><label><input type="checkbox" class="checkbox" value=""></label></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<button type="button" class="btn btn-sm btn-danger">❌</button> 
					<br>
					<button type="button" class="btn btn-sm btn-light">결제하기</button>
				</td>
			</tr>
			</c:forEach>
		
		</table>
	</div>
	
	
</div>
	
	
	
	
		
	
	</div>




</div>








</body>
</html>