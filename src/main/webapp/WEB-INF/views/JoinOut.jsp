<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Hexashop - Contact Page</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/css/font-awesome.css">

<link rel="stylesheet"
	href="${path}/resources/assets/css/templatemo-hexashop.css">

<link rel="stylesheet"
	href="${path}/resources/assets/css/owl-carousel.css">

<link rel="stylesheet" href="${path}/resources/assets/css/lightbox.css">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->


	<%@include file="header.jsp"%>


	<!-- ***** Contact Area Starts ***** -->
	<div class="contact-us">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 가운데 정렬 -->
				<div class="col-lg-6">
					<div class="section-heading text-center"></div>
					<div class="col-lg-12 text-center">
						<h2>회원 탈퇴</h2>
						<br></br>

					</div>
					<form id="contact" action="JoinOut.do" method="post">
					<input type="hidden" id="user_id" name="user_id" value="${user_result.user_id}">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<input type="password" class="input-field" name="password"
										id="password" style="border-radius: 10px;"
										placeholder="비밀번호를 입력하세요.">
								</div>
								<div class="form-group">
									<input type="checkbox" id="agreeCheckbox" name="agree" required>
									<label for="agreeCheckbox">유의사항에 동의합니다.</label>
								</div>
							</div>
						</div>
						<div class="col-lg-12 text-center">
							<div class="form-group">
								<input type="submit" value="회원 탈퇴" class="btn btn-primary" id="withdrawalButton" disabled
								style="background-color:black; color:white; border:none; ">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Contact Area Ends ***** -->

	<%@include file="footer.jsp"%>


	<!-- jQuery -->
	<script src="${path}/resources/assets/js/jquery-2.1.0.min.js"></script>

	<!-- Bootstrap -->
	<script src="${path}/resources/assets/js/popper.js"></script>
	<script src="${path}/resources/assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="${path}/resources/assets/js/owl-carousel.js"></script>
	<script src="${path}/resources/assets/js/accordions.js"></script>
	<script src="${path}/resources/assets/js/datepicker.js"></script>
	<script src="${path}/resources/assets/js/scrollreveal.min.js"></script>
	<script src="${path}/resources/assets/js/waypoints.min.js"></script>
	<script src="${path}/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="${path}/resources/assets/js/imgfix.min.js"></script>
	<script src="${path}/resources/assets/js/slick.js"></script>
	<script src="${path}/resources/assets/js/lightbox.js"></script>
	<script src="${path}/resources/assets/js/isotope.js"></script>

	<!-- Global Init -->
	<script src="${path}/resources/assets/js/custom.js"></script>

	<script>
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
		// 체크박스 상태에 따라 버튼 활성화/비활성화
		$(document).ready(function() {
			$('#agreeCheckbox').change(function() {
				if($(this).is(":checked")) {
					$('#withdrawalButton').prop('disabled', false); // 체크되었을 때 버튼 활성화
				} else {
					$('#withdrawalButton').prop('disabled', true); // 체크 해제되었을 때 버튼 비활성화
				}
			});
		});
	</script>

</body>

</html>
