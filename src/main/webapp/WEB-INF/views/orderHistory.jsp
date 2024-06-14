<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="com.smhrd.products.model.ProductsDTO"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path}/resources/assets/css/orderHistory.css">
<title>주문/배송조회</title>


<!-- 필요한 CSS 파일들을 여기에 추가 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


</head>

	<!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
   <%@include file ="header.jsp" %>

<body>
    <div class="container">
        <br>
        <hr>
        <div class="menu-container">
            <p><a href="#">회원 정보 변경</a></p>
            <p><a href="#">위탁 상품 관리</a></p>
            <p><a href="#">주문 목록 내역</a></p>
            <p><a href="#">환불/입금 내역</a></p>
            <p><a href="#">회원탈퇴</a></p>
        </div>
        <hr>
        <br>
        <br>
        <p>주문/배송조회</p>
        <hr>
        <div class="line-box">
            <div class="button-container">
                <button>오늘</button>
                <button>7일</button>
                <button>15일</button>
                <button>1개월</button>
                <button>3개월</button>
                <button>1년</button>
                <div class="dateBox">
                    <input type="date">
                </div>
                <span>~</span>
                <div class="dateBox">
                    <input type="date">
                </div>
                <button>조회</button>
                <hr>
            </div>
        </div>
        <br><br><br><br><br><br>


        <p id="orderCount">주문목록 / 배송조회</p>
        <hr>
        <div class="table-container">
        
        <table>
        	<c:if test="${user_result != null}">
                <tr>
                    <!-- <td style="width: 100px;"><input type="checkbox" id="productCheckbox"></td> -->
                    <td style="width: 240px;">주문일시</td>
                    <td style="width: 220px;">상품 이미지</td>
                    <td style="width: 220px;">상품금액</td>
                    <td style="width: 220px;">주문상태</td>
                    <td style="width: 220px;">배송지</td>
                </tr>
                                <!-- 아래 각 행에 추가된 가로선을 표시 -->
			<c:forEach var="payRecord" items="${payRecord}" varStatus="status">
                <tr>
                  <!-- <td><input type="checkbox" id="productCheckbox"></td> -->
                    <td>${payRecord.ordered_at}
                    <br>
                    주문번호: ${payRecord.order_seq}</td>
                    <td>
                        <img class="payRecord_img" src="${path}/resources/assets/images/products/${payRecord.file_name}">
                        <p class="product-name">
                    </td>
                    <td>
                        <p class="goods_price">${payRecord.prod_name}</p>
                        <br>
                        <p class="goods_price">₩${payRecord.paid_amount}</p>
                    </td>
                    <c:if test="${payRecord.order_status == 'paid'}">
                    	<td>결제 완료</td>
                    </c:if>
                    <td>
                        <p>${payRecord.deli_addr}</p>
                    </td>
                </tr>
        	</c:forEach>
        	</div>
    </c:if>
        <c:if test="${user_result == null}">
			<tr >
				<td class="text_all" colspan="8">검색 조건에 해당하는 상품이 없습니다.</td>
			</tr>
		</c:if>
    </table>
        <button onclick="goBack()">돌아가기</button>
    </div>
    </div>
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
        function goBack() {
            window.history.back();
        }

        // 주문 개수를 표시하는 코드
        document.getElementById('orderCount').innerText = '주문목록/배송조회 (' + document.querySelectorAll('.order-details').length + '개)';

    </script>
</body>


</body>
</html>