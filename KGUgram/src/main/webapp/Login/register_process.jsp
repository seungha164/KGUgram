<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.UserRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("u_id");
	String pw = request.getParameter("pass");
	String department = request.getParameter("department");
	String nickname = request.getParameter("nickname");

	// INSTANCE 생성
	UserRepository userRepository = new UserRepository();
	// 회원가입
	userRepository.register(id,pw,department,nickname);
	%>
	<script>	
		alert("회원가입에 성공했습니다");	
		location.href='./login.jsp';
	</script>
	<% 
%>
</body>
