<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 복붙코드 제이쿼리 : 제이쿼리 불러오기 ! ***** -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
	<!-- 해당 페이지는 우리가 jsp를 작성하며 지켜야할 규칙입니다. -->
     <!-- 복붙코드 jsp : header 불러오기 ! ***** -->
    <%@include file ="header.jsp" %>





    <!-- 복붙코드 jsp : footer 불러오기 ! ***** -->
    <%@include file ="footer.jsp" %>

</body>
</html>