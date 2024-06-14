<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제 완료 - 쇼핑몰</title>
<link rel="stylesheet" href="${path}/resources/assets/css/payEndPage.css">

</head>
<body>
  <div class="container">
    <img src="${path}/resources/assets/images/payEndPage.png" alt="결제 완료 이미지" width="300" height="300">
    <br>
    <br>
    <h1>주문이 완료되었습니다</h1>
    <br>
    <br>
    <table>
      <tr>
        <td>상품명</td>
        <td>${payEndDto.prod_name}</td>
      </tr>
      <tr>
        <td>결제금액</td>
        <td>₩${payEndDto.paid_amount}</td>
      </tr>
      <tr>
        <td>주문번호</td>
        <td>#${payEndDto.order_seq}</td>
      </tr>
    </table>
    <br>
    <br>
    <div class="buttons">
      <button id = "checkSession" class="btn">주문상세</button>
      <a href="main.do" class="btn">홈으로</a>
    </div>
  </div>
  
  <script type="text/javascript">
	var user = "${user_result}";
  
  	$("#checkSession").on("click", function() {
		if(user != null || user == ""){
			window.location.href = "orderHistory.do"
		}else{
			alert("로그인 세션이 만료되었습니다.");
			window.location.href = "main.do"
		}
	});
  </script>
</body>
</html>