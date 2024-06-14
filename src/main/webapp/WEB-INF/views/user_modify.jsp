<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>회원정보변경</title>

<link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/update_modify.css">

</head>
<%@include file ="header.jsp" %>

<body>

	<div class="container">
		<br>
		<br>
		<br>
		<br>
        <br>
        <h1>마이페이지</h1>
        <br>
        <br>
        <hr>
		
		 <a class="top_manu" href="#" onclick="return false;">회원정보변경</a> 
         <a class="top_manu" href="#" onclick="return false;">위탁 상품관리</a> 
         <a class="top_manu" href="#" onclick="return false;">주문목록 내역</a> 
         <a class="top_manu" href="#" onclick="return false;">환불/입금 내역</a> 
         <a class="top_manu" href="#" onclick="return false;">회원탈퇴</a>
		<hr>
			
		<br>
		<br>
		<h2>회원정보변경</h2>
		<br>
		<form action="userModify.do" method="post">
			<table>
				<tr>
					<th>이름</th>
					<td><input required="required" type="text" name="name"
						id="name" placeholder="이름을 입력하세요"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input required="required" type="tel" name="phone"
						id="phone" placeholder="연락처를 입력하세요"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input required="required" type="email" name="email"
						id="email" placeholder="이메일을 입력하세요"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input required="required" type="text" name="address"
						id="address" placeholder="주소를 입력하세요"></td>
				</tr>
			</table>

			<button id="goBack" type="button" border-radius="10px">돌아가기</button>
			<button id="changePWPage" type="button" border-radius="10px">비밀번호 변경</button>
			<button type="button" onclick="showAlert()">정보 수정</button>
		</form>
	</div>

	<%@include file="footer.jsp"%>

	<script type="text/javascript">
		$(function() {
			var selectedClass = "";
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);

			});
		});

		const goback = document.getElementById("goBack");

		goback.addEventListener("click", function() {
			console.log("event")
			window.location.href = "main.do"
		});
		
		const changePW = document.getElementById("changePWPage");

		changePW.addEventListener("click", function() {
			console.log("event")
		    window.location.href = "changePWPage.do"
		});

		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();

				if (pwd1 != "" && pwd2 != "") {
					// 비밀번호가 일치하는지 확인
					if (pwd1 == pwd2) {
						$("#alert-success").show(); // 비밀번호 일치 알림 보이기
						$("#alert-danger").hide(); // 비밀번호 불일치 알림 숨기기
						$("#submit").removeAttr("disabled"); // 회원가입 버튼 활성화
					} else {
						$("#alert-success").hide(); // 비밀번호 일치 알림 숨기기
						$("#alert-danger").show(); // 비밀번호 불일치 알림 보이기
						$("#submit").attr("disabled", "disabled"); // 회원가입 버튼 비활성화
					}
				} else {
					$("#submit").attr("disabled", "disabled"); // 모든 필수 입력 칸이 채워지지 않은 경우 회원가입 버튼 비활성화
				}

			});
		});
		function showAlert() {
		      // 버튼 클릭 시 정보 수정 완료 안내창 표시
		      window.alert("정보 수정이 완료되었습니다.");
		    }
	</script>

</body>

</html>