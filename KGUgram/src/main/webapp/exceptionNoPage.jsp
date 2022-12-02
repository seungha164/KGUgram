<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="./resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./resources/css/login.css">
    <meta name="description" content="">
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
      @font-face {
    font-family: 'Humanbumsuk';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Humanbumsuk.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<meta charset="UTF-8">
<title>Exception Page</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div>
	<main class="" style="margin-top:50px">
		<section class="py-5 text-center" style="background-color:#fff;border-bottom:1px solid #dfdfdf;height:230px">
			<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
			<div style="height:40px"></div>
			<button class="inlineToBlock ordinaryLogin" style="background-color:#8FAADC;width:80%;margin:0 auto"  onclick="location.href='./index.jsp'">HOME</button>
		</section>
	
		<p style="font-family:Humanbumsuk;font-size:0.8;margin-left:100px; margin-top: 20px"><%= request.getRequestURI() %></p>
		<div class="py-5 container" style="height:100%">
			<div class="container" style="width:80%">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3">
			</div>
			</div>
		</div>
	</main>
	</div>
</body>
</html>