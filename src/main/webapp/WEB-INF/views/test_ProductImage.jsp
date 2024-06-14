<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	img {
		width: 200px;
	}
</style>
</head>

<!-- 해당 페이지는 우리가 jsp를 작성하며 지켜야할 규칙입니다. -->
<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@include file ="header.jsp" %>
<div style="margin-top: 100px"></div>

<body>
상품 코드 21번의 이미지 화면 


<br>
<br>
<br>

<c:forEach var="arr" items="${images}" varStatus="status" >
<br>
유저 정보 : ${arr.prod_id} , 사진명 : ${arr.file_name} , ${status.index} 번째
	<img alt="" src="${path}/resources/assets/images/products/${arr.file_name}">
	<hr>
</c:forEach>
</body>
<%@include file ="footer.jsp" %>
</html>