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
		<div>
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
		  		<div class="list-group">
  					<c:forEach var="customer" items="${customerList}">
  						<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;">
	      					<div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
	      							<i class="bi bi-person-fill"> ${customer.customerEmail}</i>
						        	<p class="mb-1">Gender : ${customer.customerGender}</p>
						        	<div class="justify-content-between">
						        		<p class="mb-1">Birth : ${customer.customerBirth}</p>
						        	</div>
						        </div>
						        <div>
					        		<div style="text-align: right;">
									    <a href="${pageContext.request.contextPath}/staff/removeCustomerByStaff?customerEmail=${customer.customerEmail}" class="btn btn-sm btn-outline-danger">remove</a>
									</div>
					        		<br>
					        		<small class="opacity-75 text-nowrap">CreateDate : ${customer.createDate}</small>
				        		</div>
				        	</div>
				    	</div>
				    	<br>
  					</c:forEach>
		  		</div>
			</div>
		</div>
	</div>
</div>
<!-- footer -->

</body>

</html>