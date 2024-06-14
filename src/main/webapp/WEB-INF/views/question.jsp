<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주묻는 질문</title>
    
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/font-awesome.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/owl-carousel.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/lightbox.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/question.css">
    
    

   

</head>

<body>
       	<%@include file ="header.jsp" %>
       	<br>
       	<br>
       	<br>
       	<br>
       	<br>
       	<br>
    <h2 class="wkwn">자주묻는 질문</h2>
    <br>
       	<br>
    <hr>
    <br>
       	<br>
    <table class="ctable">
        <tr>
            <td style="width: 250px; border-left: none;">분류</td>
            <td style="width: 750px;">제목</td>
        </tr>
        <!-- 추가적인 10행 만들어 주세요. -->
        <tr>
            <td>결제/배송</td>
            <td>배송 시키면 언제 와요?</td>
        </tr>
        <tr>
            <td>상품관련</td>
            <td>어떻게 판별하고 보내주시는거죠?</td>
        </tr>
        <tr>
            <td>교환/반품/환불</td>
            <td>상품을 교환하고 싶은데 어떻게 해야하나요?</td>
        </tr>
        <tr>
            <td>교환/반품/환불</td>
            <td>상품을 환불받고 싶어요</td>
        </tr>
        <tr>
            <td>회원관련</td>
            <td>회원탈퇴를 하고 싶어요</td>
        </tr>
        <tr>
            <td>회원관련</td>
            <td>정보를 변경하고 싶은데 어떻게 해야하나요?</td>
        </tr>
        <tr>
            <td>결제/배송</td>
            <td>배송 주소를 변경하고 싶어요</td>
        </tr>
        <tr>
            <td>교환/반품/환불</td>
            <td>환불하면 언제 금액이 들어오나요?</td>
        </tr>
        <tr>
            <td>상품관련</td>
            <td>상품을 받았는데 상태가 이상해요. 교환 되나요? </td>
        </tr>
        

    </table>
    <br>
    <br>
    <br>
    <br>
    <button onclick="goBack()" class="cbutton">돌아가기</button>
    <br>
    <br>
    <br>
    <br>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

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
</body>

</html>