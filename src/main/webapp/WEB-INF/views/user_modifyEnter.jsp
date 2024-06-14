<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

	<title>Luxury Clothing</title>
	
	<!-- Additional CSS Files -->
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/update_modifyEnter.css">
	
	
</head>
<body>

	    <div id="preloader" style="margin-top: 100px">
	        <div class="jumper">
	            <div></div>
	            <div></div>
	            <div></div>
	        </div>
	    </div>  
	  
	    	    
	<%@include file ="header.jsp" %>
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
	    <form action="userModifyEnter.do" method="post">
		        <h2>회원정보변경</h2>
		        <br>
		        <br>
		        <br>
		        <h4>회원님의 정보를 안전하게 보호하기 위해 비밀번호를</h4>
		        <h4>다시 한 번 입력해 주세요.</h4>
		        <br>
		        <br>  
		        비밀번호   :  <input type="password" name="pw" id="pw">
		        <br>
		        <br>
		        <br>
		        <hr>
		        <br> 
		        <br>
		        <button type="submit" id="submit">인증하기</button>
		    </div>
		    
		</form>
    
    <%@include file ="footer.jsp" %>

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
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });
        
	</script>
</body>
</html>