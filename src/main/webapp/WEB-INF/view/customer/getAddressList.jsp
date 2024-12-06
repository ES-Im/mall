<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {	        
	     // 주소 등록
	     $('#btnAddAddress').click(function() {
	     	
	    	 if($('#addressDetail').val() == null || $('#addressDetail').val() == ''){
	    		 alert('주소를 입력하세요.');
	    		 $('#addressDetail').focus();
	    		 return;
	    	 }

	    	 // 특수문자 유효성 검사
	    	 const symbols = /[{}[\]/?.,;:|)*~`!^\-_+<>@#$%&=('"\\]/g;;
	    	 
	    	 if(symbols.test($('#addressDetail').val())){
	    		 alert('특수문자는 입력할 수 없습니다.');
	    		 $('#addressDetail').val(''); /* 리셋 */
	    		 $('#addressDetail').focus();
	    		 return;
	    	 }

		     $('#addAddressForm').submit();

	     });
	        
        // 'msg' 값 가져오기
        const msg = '${addressMsg}';
 		
 		if(msg != ''){
 			alert(msg);
 			return;
 		}

	});
	</script>
	<style>
		.customer-link {
        	color: black;
        	text-decoration: none;
        }
        
        .customer-link:hover {
            color: #D8D8D8;
            text-decoration: none;
        }
        
        .customer-link:visited {
        	color: black;
        	text-decoration: none;
        }
	</style>
	<meta charset="UTF-8">
	<title>GET ADDRESS LIST</title>
</head>
<body>
	 <!-- header -->
	<div>
		<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	</div>
	
		
	<div class="row">
        <!-- leftbar -->
		<div class="col-sm-2 p-0">
			<c:import url="/WEB-INF/view/inc/customerLeftMenu.jsp"></c:import>
		</div>


		<div class="col-sm-10 p-0">
			<!-- main -->
			<div style="margin-left: 80px; margin-top: 90px;">
				<h3>배송지 목록</h3>
			</div>
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-3 align-items-center" style="margin-left: 110px;">
				<div class="border d-flex p-3 justify-content-between" style="width: 700px;">
					<form action="${pageContext.request.contextPath}/customer/addAddress" method="post" id="addAddressForm">
						<textarea rows="3" cols="75" name="addressDetail" placeholder="주소 입력" id="addressDetail" style="width: 660px; margin-top:10px;"></textarea>
						<div style="text-align: right; margin-top: 10px">
							<button type="button" class="mt-2 btn btn-sm btn-outline-danger" id="btnAddAddress">등록</button>
						</div>
					</form>	        		
				</div>
			</div>
			
			
			<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-4 align-items-center" style="margin-left: 110px;">		
				<div class="d-flex flex-column scrollbar" style="max-height: 800px; overflow-y: auto;"> <!-- 일정 길이를 넘는다면 스크롤바 추가 --> 
			  		<div class="list-group">
						<c:forEach var="address" items="${addressList}">
							<div class="list-group-item list-group-item-action d-flex gap-3 py-3" style="width: 700px;">
								<div class="d-flex gap-2 w-100 justify-content-between">
									<div>
										<i class="bi bi-chat-right-text-fill">&nbsp;&nbsp;${address.customerEmail}</i>
										<p class="mb-1">AddressNo : ${address.addressNo}</p>
										<p class="mb-1">Address : ${address.addressDetail}</p>
										<small class="opacity-75 text-nowrap">UpdateDate : ${fn:substring(address.updateDate, 0, 10)  }</small>
										<small class="opacity-75 text-nowrap">CreateDate : ${fn:substring(address.createDate, 0, 10)}</small>
										
									</div>
									<div>
										<div style="text-align: right;">
											<a href="${pageContext.request.contextPath}/customer/removeAddress?addressNo=${address.addressNo}" class="btnRemoveBoard btn btn-sm btn-outline-danger">remove</a>
										</div>
										<br>
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