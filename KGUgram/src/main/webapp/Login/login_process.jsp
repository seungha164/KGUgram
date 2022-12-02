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

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String idCheck = request.getParameter("idcheck");
	out.println(idCheck);
	// isntance 생성
	   UserRepository userRepository = new UserRepository();
	   String result = userRepository.login(id,pw);
	   if(result!=null){      // 로그인 성공
	      session.setAttribute("u_id", id);      // 1. 세션 넣기 - ID
	      if(idCheck!=null){
	    	  Cookie cookie = new Cookie("u_id",id);   // 2. 쿠키 넣기 - 닉네임
		      cookie.setMaxAge(1800);
		      response.addCookie(cookie);
	      }
	      response.sendRedirect("../index.jsp");      // 3. index.jsp 로 이동
	   }
	   else{
	   %>
	      <script>   alert("로그인에 실패하였습니다");   
	               history.back();
	      </script>
	   <% 
	   }
	
%>
</body>
