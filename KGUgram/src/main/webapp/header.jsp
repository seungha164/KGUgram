<header>
<div class="navbar navbar box-shadow fixed-top" style="background-color:#fff;">
	<div class="container d-flex justify-content-between">
		<a href="./index.jsp" class="navbar-brand d-flex align-items-center"><strong style="color:#9DC3E6;font-family:InkLipquid;font-size:1.5rem;">KGUgram</strong></a>
		<div>
    		<%
    			if(session.getAttribute("u_id")==null){	// login 버튼
    			
    		%>
    			<button type="button"  onclick="location='./Login/login.jsp'" class="btn btn-link"  style="color: #000;">LOGIN</button>
    		<% 
    			}else{	// logout 버튼
    			%>
    				<button type="button" onclick="location='./Story/write_story.jsp'" class="btn btn-link"  style="color: #000;"><i class="bi bi-plus-square"></i></button>
    				<button type="button"  onclick="location='./homePage.jsp'" class="btn btn-link"  style="color: #000;"><i class="bi bi-house-door-fill"></i></button>
    				<button type="button"  onclick="location='./Login/logout.jsp'" class="btn btn-link"  style="color: #000;">LOGOUT</button>
    			<%
    			}
    		%>
    	</div>
	</div>
</div>
</header>