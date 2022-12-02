<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dao.StoryRepository" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="java.time.*" %>
    <%@page import="java.util.List" %>
    <%@page import="java.sql.Timestamp" %>
    <%@page import= "dto.Story" %>
    <%@page import= "dao.StoryRepository" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>KGUgram</title>
    <link rel="stylesheet" href="./resources/css/login.css">
	<script src="https://kit.fontawesome.com/d5bc63d84b.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d224346be3f9dc509e043201060a5f4"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
	<link href="./resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script> -->
    <style>
    @font-face {
    	font-family: 'InkLipquid';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/InkLipquid.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
 
     */
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
  <body>
    <%@include file="header.jsp" %>
<main class="bg-light"  style="margin-top:50px">
<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:setBundle basename="bundle.message"/>
<%!
	
	String displayTimestamp(Timestamp storyT){
		LocalDateTime current = LocalDateTime.now();	// LocalDateTime 현재 날짜 가져오기
		LocalDateTime storyT2 = storyT.toLocalDateTime();
		
		Period diff_date = Period.between(storyT2.toLocalDate(), current.toLocalDate());
		Duration diff_time = Duration.between(storyT2.toLocalTime(),current.toLocalTime());
		
		if(diff_date.getYears()>0){
			return diff_date.getYears()+"";
		}
		if(diff_date.getMonths()>0){
			return diff_date.getMonths()+"";
		}
		if(diff_date.getDays()>0){
			return diff_date.getDays()+"";
		}
		if(diff_time.toHours()>0){
			return diff_time.toHours()+"";
		}
		if(diff_time.toMinutes()>0){                                                                          
			return diff_time.toMinutes()+"";
		}
		return "";
	}
String displaytamp(Timestamp storyT){
	LocalDateTime current = LocalDateTime.now();	// LocalDateTime 현재 날짜 가져오기
	LocalDateTime storyT2 = storyT.toLocalDateTime();
	
	Period diff_date = Period.between(storyT2.toLocalDate(), current.toLocalDate());
	Duration diff_time = Duration.between(storyT2.toLocalTime(),current.toLocalTime());
	
	if(diff_date.getYears()>0){
		return "years";
	}
	if(diff_date.getMonths()>0){
		return "months";
	}
	if(diff_date.getDays()>0){
		return "days";
	}
	if(diff_time.toHours()>0){
		return "hours";
	}
	if(diff_time.toMinutes()>0){                                                                          
		return "mins";
	}
	return "seconds";
}
%>
<%
	StoryRepository storyDao = new StoryRepository();
	List<Story> storyList = storyDao.getList();

%>

  <!-- MAP 위치 -->
  <section class="py-5 text-center container">
  	<p class="text-end" style="color:#000;margin-right:5%"><a href="?language=ko" style="text-decoration:none">Korean </a>|<a href="?language=en" style="text-decoration:none"> English</a>
    <div class="row py-lg-5">
      <div class="mx-auto">
        <h1 class="fw-light"><fmt:message key="map"/></h1>
        <p class="lead text-muted"><fmt:message key="map_description"/></p>
        <!--  MAPP -->
        <div id="map" style="width:100%;height:760px; border-radius: 15px;"></div>		
        
      </div>
    </div>
  </section>
	
  <div class="album py-5 bg-light">
  	
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <%
      	for(int i=0; i<storyList.size();i++){	
   		%>
   			<div class="col">
          		<div class="card shadow-sm">
          			<div style="width:100%;height:250px; display: flex;padding:15px">
          				<img  onerror="this.src='./resources/assets/img/logo.png';" class="bd-placeholder-img card-img-top" style="width:100%;object-fit: scale-down;" src="./resources/img/<%=storyList.get(i).getImg_name()%>"></img>
          			</div>
            		<hr>
            		<div class="card-body">
            			
            			<p class="card-text"><span style="font-weight:bold; font-size:1.1rem"><% out.print(storyList.get(i).isIs_anonymous() ?"Anoymous":storyList.get(i).getWriter_id());%> </span> <%= storyList.get(i).getContent() %></p>
              			<div class="d-flex justify-content-between align-items-center">
              				<div></div>
                			<small class="text-muted"><%= displayTimestamp(storyList.get(i).getDate()) %><fmt:message key="<%= displaytamp(storyList.get(i).getDate())%>"/></small>
             			</div>
           			</div>
          		</div>
        	</div>	
      	<%	
      	}
   
      %>              
      </div>
    </div>
  </div>

</main>

	<%@include file="footer.jsp" %>
<script src="./resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">

	window.onload = function(){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.3001, 127.0354), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); 
		
		// 마커 생성
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 		// 마커 이미지의 이미지 주소입니다
		<%
		for(int i=0; i<storyList.size();i++){
		%>
			 // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, new kakao.maps.Size(24, 35)); 
			var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new kakao.maps.LatLng(<%=storyList.get(i).getLatitude() %>,<%=storyList.get(i).getLongitude() %>), // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    });
			
			// 마커에 표시할 인포윈도우를 생성
            var content = `<div style="position: absolute; left: -50px; top: -50px;background-color:#fff;">
                <div style="width:250px;height:75px;text-align:center;padding:6px;">
                <p style="text-align:left;margin-left:5px;margin-bottom:5px;color:#D0D0D0;font-size:0.8rem"><%=displayTimestamp(storyList.get(i).getDate())%>
                <p class="info_title" style="text-align:center;font-size:1rem;overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=storyList.get(i).getContent().contentEquals("")?"":storyList.get(i).getContent() %>
            </div>
        </div>`;
		    var infowindow = new kakao.maps.InfoWindow({
		        content: content,
		        yAnchor: 1 // 인포윈도우에 표시할 내용
		    });
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			<%
		}	
	
		%>
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	}
		

</script>
      
  </body>
</html>
    