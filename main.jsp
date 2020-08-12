<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>FINDANIMAL</title>
</head>
<body>
	<header>
		<ul>
			<li><a href="main.jsp" ><img src="#" alt="로고" width="120px" height="120px"></a></li>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">직원소개</a></li>
			<li><a href="adoption.an">유기동물 입양</a></li>
			<li><a href="realFindu.jsp">반려동물을 찾습니다.</a></li>
			<li><a href="#">후원하기</a></li>
			<li>
				<div class="join">
					
					<a href="login.an" class="login">로그인</a>
					<a href="join.jsp" class="joiner">회원가입</a>
					
				</div>
			</li>
			
		</ul>
	</header>
	
	
	<section>
		<div class="backgroud">
			<img src="#" alt="배경">
		</div>
		<div class="frame">
			<table border="1">
				<tr>
					<td>${ani.name }(이)를 찾습니다.</td>
					<td><img src="/WebSite/upload/${ani.img}"></td>
				</tr>
			</table>
		</div>
		
	</section>
	
	
	
	<footer>
		<p>회사정보</p>
	</footer>
	

</body>
</html>