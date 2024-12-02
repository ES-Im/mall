<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>


	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
	     
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
@import url(http://weloveiconfonts.com/api/?family=entypo);
@import url(https://fonts.googleapis.com/css?family=Roboto);

/* zocial */
[class*="entypo-"]:before {
  font-family: 'entypo', sans-serif;
}

*,
*:before,
*:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box; 
}


h2 {
  color:#123478;
  margin-left:12px;
}

body {
  background: white;
  font-family: 'Roboto', sans-serif;
  
}

form {
  position:relative;
  margin: 50px auto;
  width: 380px;
  height: auto;
}

input {
  padding: 16px;
  border-radius:7px;
  border:0px;
  background: #F6F6F6;
  display: block;
  margin: 15px;
  width: 300px;  
  color: #123478;
  font-size:18px;
  height: 54px;
}

input:focus {
  outline-color: #EAEAEA;
  background: #EAEAEA;
  color: #123478;
}

button {
  float:right;
  height: 121px;
  width: 50px;
  border: 0px;
  background: #000030;
  border-radius:7px;
  padding: 10px;
  color:white;
  font-size:22px;
}

.inputUserIcon {
  position:absolute;
  top:68px;
  right: 80px;
  color: #123478;
}

.inputPassIcon {
  position:absolute;
  top:136px;
  right: 80px;
  color: #123478;
}

input::-webkit-input-placeholder {
  color: #123478;
}

input:focus::-webkit-input-placeholder {
  color: #123478;
}

#joinLink{
	text-decoration: none;
	color : #000030;
}

#joinLink:hover{
	color : #4374D9;
}


</style>
<script>
$(document).ready(function(){ // <body>까지 메모리에 올라간 후 script 실행.
	
	$(".user").focusin(function(){
	  $(".inputUserIcon").css("color", "#123478");
	}).focusout(function(){
	  $(".inputUserIcon").css("color", "#123478");
	});

	$(".pass").focusin(function(){
	  $(".inputPassIcon").css("color", "#123478");
	}).focusout(function(){
	  $(".inputPassIcon").css("color", "#123478");
	});
	
	/* 유효성 검사 */
	const emailTest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
	const isStaffTest = /^@[a-zA-Z0-9]+$/;
	
	$('#btnLogin').click(function() {
		
		if($('#id').val() == null || $('#id').val() == ''){
			alert('id를 입력하세요.');
			$('#id').focus();
			return;
			
		}else if(isStaffTest.test($('#id').val()) == false){// staffId가 아니라면 회원이메일 유효성 검사하기
			
			if(emailTest.test($('#id').val()) == false){
				alert('E-Mail을 입력해주세요.');
				$('#id').focus();
				return;
			}
			
		}
		
		if($('#pw').val() == null || $('#pw').val() == ''){
			alert('password를 입력해주세요.');
			$('#pw').focus();
			return;
		}
		
		
		$('#loginForm').submit();

	})
	
	// 'msg' 값 가져오기
    const msg = '${loginMsg}';
		
	if(msg != ''){
		alert(msg);
		return;
	}
	

})
</script>

</head>
<body class="d-flex justify-content-center" >


	<div class="col-sm-4 p-5" id="formDiv">
		
		<form action="${pageContext.request.contextPath}/off/login" method="post" id="loginForm">
		  
		  <h2><span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login</h2>
		 
		  <!-- 로그인 버튼  -->
		  <button type="button" class="button mt-2" id="btnLogin"><span class="entypo-lock"><i class="fa fa-lock"></i></span></button>
		  
		  <!-- ID 입력부분 -->
		  <span class="entypo-user inputUserIcon">
		     <i class="fa fa-user"></i>
		  </span>
		  <input type="text" class="user" placeholder="ID" name="id" id="id" />
		  
		  <!-- PW 입력부분 -->
		  <span class="entypo-key inputPassIcon">
		     <i class="fa fa-key"></i>
		  </span>
		  <input type="password" class="pass"placeholder="PASSWORD" name="pw" id="pw" />
		</form>
	
		<div class="d-flex justify-content-end pe-5">
			<a href="#" class="pe-4" id="joinLink">회원가입</a>
		</div>
	
	
	</div>



</body>

</html>