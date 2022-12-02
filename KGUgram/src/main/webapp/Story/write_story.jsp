<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
#story_back{
	color:#000;
}
#story_share{
	text-decoration: none;
	font-size:1rem;
}
.write_nav{
	
	background-color:#f6f6f6;

		padding-top : 10px;
		padding-bottom : 10px;
		box-shadow: 0 1px 1px rgb(0 0 0 / 0.2);
}	
</style>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d224346be3f9dc509e043201060a5f4"></script>
   
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>New STORY</title>
	<link rel="stylesheet" href="../resources/css/login.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d224346be3f9dc509e043201060a5f4"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
	<link href="../resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script> -->
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:setBundle basename="bundle.message"/>
<!--  HEADER   -->
	<header>
		<div class="navbar" style="background-color:#fff;border-bottom:1px solid #f0f0f0;height:50px">
			<div class="container">
				<a href="#" onClick="history.back()" id="story_back"><i class="bi bi-arrow-left fa-2x"></i></a>
				<strong><fmt:message key="story_new"/></strong>
				<div></div>
			</div>		
		</div>
	</header>
<!-- MAIN -->
<div style="height: 50px;"></div>
<div class="container">
<p class="text-end" style="color:#000;"><a href="?language=ko" style="text-decoration:none">Korean </a>|<a href="?language=en" style="text-decoration:none"> English</a>
   
	<form method="post" name="fileForm" enctype="multipart/form-data" action="write_story_process.jsp" onsubmit="return upload_validation();">
		<!--  1. 익명 여부  -->
	<div class="float-end">
		<div class="mb-3">
		<div class="form-check form-check-inline">
  			<input class="form-check-input" type="radio" name="is_anonymous" id="inlineRadio1" value="False" checked>
  			<label class="form-check-label" for="inlineRadio1"><fmt:message key="nickname"/></label>
		</div>
		<div class="form-check form-check-inline">
  			<input class="form-check-input" type="radio" name="is_anonymous" id="inlineRadio2" value="True">
  			<label class="form-check-label" for="inlineRadio2"><fmt:message key="anonymous"/></label>
		</div>
	</div>
	</div>
	<!--  2. content  -->
	<div class="mb-3">
  		<label for="exampleFormControlTextarea1" class="form-label"><fmt:message key="content"/></label>
  		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
	</div>
	<!--  3. 위치 추가  -->
	<div class="mb-3">
  		<label for="exampleFormControlTextarea1" class="form-label"><fmt:message key="sele_location"/></label>
  		<div id="map" style="width:100%;height:450px;"></div>
  		<input type="text" name="latitude" id="latitude_marker" style="color:#fff;border:none;background-color:#fff"  />	
  		<input type="text" name="longitude" id="longitude_marker" style="color:#fff;border:none;background-color:#fff"  />
	</div>
	<!--  4. 이미지  -->
	<div class="mb-3">
  		<label for="formFile" class="form-label"><fmt:message key="sele_img"/></label>
  		<input class="form-control" type="file" id="formFile" name="filename">
	</div>
	<!--  제출 버튼  -->
	<div class="mb-3">
  		<input type="submit" value="<fmt:message key="upload"/>" class="inlineToBlock ordinaryLogin" 
  			style="margin-top: 30px;background-color:#8FAADC;width:100%">
	</div>
	</form>
	<div style="height:100px"></div>
</div>
	
 	<script type="text/javascript" src="../resources/js/auth_validation.js"></script>
	<script src="../resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		//var 
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.3001, 127.0354), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			var latlng = mouseEvent.latLng; // 클릭한 위도, 경도 정보를 가져옵니다 
		    marker.setPosition(latlng);		// 마커 위치를 클릭한 위치로 옮깁니다	  
		    document.getElementById('latitude_marker').value = latlng.getLat();
		    document.getElementById('longitude_marker').value = latlng.getLng();	
		});
</script>
</body>
</html>