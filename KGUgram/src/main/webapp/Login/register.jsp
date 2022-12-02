<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../resources/css/login.css">
<title>Sing Up</title>
</head>
<body>
<div class="contentsWrap">
        <div class="loginWindow">
        	<img src="../resources/assets/img/KGUgram_logo.png" alt="" id="instaLogo" style="width:100px">
            
           <form class="login__input" action="register_process.jsp" method="post" name="register_form">
                            <input class="inlineToBlock" type="text" name="u_id" placeholder="학번" required="required" />
                            <input type="password" name="pass" placeholder="패스워드" required="required" />
                            <input type="text" name="department" placeholder="학부(소속)" required="required" />
                            <input type="text" name="nickname" placeholder="닉네임" required="required" />
                            <br>
                            <input type="button" value="가입" class="inlineToBlock ordinaryLogin unactivatedLoginColor" style="background-color:#8FAADC" onclick="register_validataion()">
                   
                        </form>
       		 <div class="horizonAndOrWrap">
            	<hr class="leftHr">
            	<div class="or">또는</div>
            	<hr class="rightHr">
        	</div>
        	<div class="haveAccount">
        		<p>계정이 있으신가요?</p>
        		<p><a href="./login.jsp" class="noneunderline">로그인 하기</a>
    		</div>
    	</div>
</div>
<script type="text/javascript" src="../resources/js/auth_validation.js"></script>
</body>
</html>