<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="dao.StoryRepository" %>
<%
	//상대경로를 절대경로로 바꿔주는 코드 
	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img");

MultipartRequest multi = new MultipartRequest(request,uploadPath,
		5*1024*1024,"utf-8", new DefaultFileRenamePolicy());

Map<String, Object> map = new HashMap<>();
Enumeration params = multi.getParameterNames();
while(params.hasMoreElements()){
	String name = (String) params.nextElement();
	if(name=="anonymous"){
		map.put(name,Boolean.parseBoolean((String)multi.getParameter(name)));
	}
	else if(name=="latitude" || name=="longitude"){
		map.put(name, Double.parseDouble((String)multi.getParameter(name)));
	}
	else{
		map.put(name,multi.getParameter(name));
	}
}

map.put("writer_id", (String) session.getAttribute("u_id"));

Enumeration files = multi.getFileNames();
String img_name = "";
while(files.hasMoreElements()){
	String name = (String) files.nextElement();
	String filename = multi.getFilesystemName(name);
	String original = multi.getOriginalFileName(name);
	String type = multi.getContentType(name);
	File file = multi.getFile(name);
	
	out.println("요청 파라미터 이름 : "+name+"<br>");
	out.println("실제 파일 이름 : "+original+"<br>");
	out.println("저장 파일 이름 : "+filename+"<br>");
	img_name = filename;
}
map.put("img_name", img_name);
// INSTANCE 생성
StoryRepository storyDAO = new StoryRepository();
out.println(map);
if(storyDAO.write(map)==-1){	
	%>
	<script>	alert("업로드에 실패하였습니다");	
				history.back();
	</script>
<% 
}else{
	response.sendRedirect("../index.jsp");
}
	
%>