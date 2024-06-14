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

<title>로그인</title>


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
						<h2>LOGIN</h2>
						<br></br>

					</div>
					<form id="contact" action="login.do" method="post">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<input type="text" class="input-field" name="user_id" id="user_id"
										style="border-radius: 10px;" placeholder="아이디를 입력하세요.">
								</div>
								<div class="form-group">
									<input type="password" class="input-field" name="user_pw" id="user_pw"
										style="border-radius: 10px;" placeholder="비밀번호를 입력하세요.">
								</div>

							</div>
							<div class="col-lg-12"></div>
						</div>
						<div class="col-lg-12 text-center">
							<div class="form-group">
								<input type="submit" value="로그인">
							</div>
						</div>
						<div class="col-lg-12 text-center mt-3">
							<hr
								style="width: -900px; border: 0.2px solid #000; margin: auto;">
						</div>

						<div class="col-lg-12 text-center mt-3">
							<div class="form-group">
								<a href="joinpage.do" class="btn btn-secondary" style="background-color: black;
    color: white;">회원가입</a> 
								<a href="Rsidpw.do" class="btn btn-danger" style="background-color: black;
    color: white;  border: none;">ID & PW 찾기</a>
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
/* 		const signupButton = document.getElementById('signupButton');
		signupButton.addEventListener('click', function() {

			window.location.href = '${path}/joinpage.do'; // 여기에 실제 URL을 넣어주세요.
		}); */
	</script>

</body>

</html>