<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "dto.Story" %>
<%@page import= "dao.StoryRepository" %>
<%
	String s_id = request.getParameter("s_id");
	StoryRepository storyDao = new StoryRepository();
	if(storyDao.deleteStory(s_id)==-1){
		%>
		<script>	alert("실패");
					history.back();
		</script>
	<% 
	}else{
		
		response.sendRedirect("../homePage.jsp");
	}
%>