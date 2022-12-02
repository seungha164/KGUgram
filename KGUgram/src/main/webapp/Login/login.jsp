<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/login.css">
	<title>LOGIN</title>
	
</head>
<body>
<%
	// 아이디 기억하기 - 쿠키 이용
	Cookie[] cookies = request.getCookies();
	String myId = "";
	if(cookies!=null){
		for(Cookie c:cookies){
			if(c.getName().contentEquals("u_id")){
				myId = c.getValue();
			}
		}
	}
%>
<div class="contentsWrap" >
        <div class="loginWindow">
        	<img src="../resources/assets/img/KGUgram_logo.png" alt="" id="instaLogo" style="width:100px">
        	<!-- form -->
        	<form method="post" action="login_process.jsp" name="login_form">
        		<input name="id" type="text" placeholder="학번을 입력해주세요" class="inlineToBlock" value="<%=myId %>">
           	 	<input name="pw" type="password" placeholder="비밀번호" class="inlineToBlock">
           	 	<div style="text-align:left">
           	 		<input type="checkbox" name="idcheck" value="y" style="height:20px;width:20px;text-align:left"> 아이디 기억하기
           	 	</div>
           	 	<input type="button" value="로그인" class="inlineToBlock ordinaryLogin" style="background-color:#8FAADC" onclick="login_validation()">
        	</form>
        	<!--  회원가입  -->
       		 <div class="horizonAndOrWrap">
            	<hr class="leftHr">
            	<div class="or">또는</div>
            	<hr class="rightHr">
        	</div>
        	<div class="haveAccount">
        		<p>계정이 없으신가요?</p>
        		<p><a href="./register.jsp" class="noneunderline">가입 하기</a>
    		</div>
    	</div>
    	
</div>
<script type="text/javascript" src="../resources/js/auth_validation.js"></script>
</body>
</html>