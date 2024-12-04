<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			// 삭제 버튼 클릭
			$('.btnRemoveStaff').click(function(event) {
				// 기본 링크 클릭 동작을 막기 (페이지 이동을 막기)
				event.preventDefault();
				
				// 삭제 확인 
				var result = confirm("정말로 삭제하시겠습니까?");
				if (result) {
					window.location.href = $(this).attr('href');
					alert('삭제 성공하였습니다.');
				} else {
					return false;
				}
			});
		});
	</script>
	<meta charset="UTF-8">
	<title>Staff List</title>
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
				<h3>Staff List</h3>
			</div>
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">
				<div class="list-group">
					<c:forEach var="staff" items="${staffList}">
						<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;">
						<div class="d-flex gap-2 w-100 justify-content-between">
							<div>
								<i class="bi bi-person-fill"> No.${staff.staffNo}</i> 
								<p class="mb-1">Name : ${staff.firstName} ${staff.lastName}</p>
								<div class="justify-content-between">
									<p class="mb-1">ID : ${staff.staffId}</p>
								</div>
							</div>
							<div>
								<div style="text-align: right;">
									<a href="${pageContext.request.contextPath}/staff/removeStaff?staffNo=${staff.staffNo}" class="btnRemoveStaff btn btn-sm btn-outline-danger">
										remove
									</a>
								</div>
								<br>
								<small class="opacity-75 text-nowrap">CreateDate : ${staff.createDate}</small>
							</div>
						</div>
						</div>
						<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>