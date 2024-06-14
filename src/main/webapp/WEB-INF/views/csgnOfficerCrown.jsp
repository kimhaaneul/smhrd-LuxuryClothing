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
<title>위탁 상품관리</title>


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
        <br>
        <br>
        <br>
        <br>
        <br>
        <h1>위탁 상품 관리</h1>
        <br>
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
        <p></p>
        <hr>
        <div class="line-box">
            <div class="button-container">
                <button id="toDay">오늘</button>
                <button id="to7Day">7일</button>
                <button id="to15Day">15일</button>
                <button id="to1Mon">1개월</button>
                <button id="to3Mon">3개월</button>
                <button id="to1Year">1년</button>
                <div class="dateBox">
                    <input type="date" id="dateTo">
                </div>
                <span>~</span>
                <div class="dateBox">
                    <input type="date" id="dateFr">
                </div>
                <button>조회</button>
                <hr>
            </div>
        </div>
        <br><br><br><br><br><br>


        <p id="orderCount">위탁 상품관리</p>
        <hr>
        <div class="table-container">
        
        <table>
        	<c:if test="${result != null}">
                <tr>
                    <!-- <td style="width: 100px;"><input type="checkbox" id="productCheckbox"></td> -->
                    <td style="width: 200px;">번호</td>
                    <td style="width: 240px;">위탁상품</td>
                    <td style="width: 220px;">위탁신청일</td>
                    <td style="width: 220px;">판매가격</td>
                    <td style="width: 220px;">등급</td>
                    <td style="width: 220px;">관리</td>
                </tr>
                                <!-- 아래 각 행에 추가된 가로선을 표시 -->
			<c:forEach var="arr" items="${result}" varStatus="status">
                <tr>
                  <!-- <td><input type="checkbox" id="productCheckbox"></td> -->
                    <td>${arr.created_at}
                    <br>
                    상품 번호: ${arr.prod_id}</td>
                    <td>
                    <c:if test="${arr.prod_status != 'N' && arr.prod_status != 'D'}">
                    	<a href="product_detail.do?product_id=${arr.prod_id}">
                        	<img class="payRecord_img" src="${path}/resources/assets/images/products/${arr.file_name}">
                    	<a>
                    </c:if>
                    <c:if test="${arr.prod_status == 'N' || arr.prod_status == 'D'}">
                        <img class="payRecord_img" src="${path}/resources/assets/images/products/${arr.file_name}">
                    </c:if>
                        <p class="product-name">
                    </td>
                    <td>
                        <p class="goods_price">${arr.prod_name}</p>
                        <br>
                        <p class="goods_price">₩${arr.prod_price}</p>
                    </td>
                    <c:if test="${arr.prod_status == 'N'}">
                    	<td style="color: gray;">배송/검수진행</td>
                    </c:if>
                    <c:if test="${arr.prod_status == 'Y'}">
                    	<td>판매 상품</td>
                    </c:if>
                    <c:if test="${arr.prod_status == 'D'}">
                    	<td style="color: red;">판매 중단</td>
                    </c:if>
                    
                    <!-- 상품 등급 -->
                    <c:if test="${arr.prod_grade == 'N'}">
	                    <c:if test="${arr.prod_status == 'N'}">
                    		<td>배송/검수진행</td>
	                    </c:if>
	                    <c:if test="${arr.prod_status == 'D'}">
	                    	<td style="color: red;">판매 중단</td>
                    	</c:if>
                    </c:if>
                    <c:if test="${arr.prod_grade != 'N'}">
                    	<td>${arr.prod_grade}</td>
                    </c:if>
                    <td>
                    	<c:if test="${arr.prod_grade != 'N' && arr.prod_status != 'D'}">
                    		<button onclick="DeleteButton(${arr.prod_id});">판매중단 요청</button>
	                    </c:if>
	                    <c:if test="${arr.prod_status == 'D'}">
	                    	<button onclick="UpdateButton(${arr.prod_id});">판매 요청</button>
                    	</c:if>
                    </td>
                </tr>
        	</c:forEach>
        	</div>
    </c:if>
    <c:if test="${result == null}">
		<tr >
			<td class="text_all" colspan="8">검색 조건에 해당하는 상품이 없습니다.</td>
		</tr>
	</c:if>
	
	<form action="userMyProductDelete.do" method="post" id="deleteForm" name="deleteForm">
		<input type="hidden" id="delete_id" name="delete_id">
	</form>
	
	<form action="userMyProductSellUpdate.do" method="post" id="updateForm" name="updateForm">
		<input type="hidden" name="data_id" id="data_id">
	</form>
	
    </table>
        <button onclick="goBack()">돌아가기</button>
    </div>
    </div>
	<%@include file ="footer.jsp" %>


    <script>
        function goBack() {
            window.history.back();
        }

        // 주문 개수를 표시하는 코드
        document.getElementById('orderCount').innerText = '위탁 상품 (' + ${count} + '개)';

    </script>
    
    <script type="text/javascript">
 		// 판매 요청
	    function UpdateButton(id) {
    		console.log("삭제버튼 눌러짐!" + id);
    		$('#data_id').val(id);
    		
    		var form = document.getElementById('updateForm');
    	 	form.submit();
	    }
    </script>
    
    <script type="text/javascript">
    	// 판매중단 요청
	    function DeleteButton(id) {
    		console.log("삭제버튼 눌러짐!" + id);
    		$('#delete_id').val(id);
    		
    		var form = document.getElementById('deleteForm');
    	 	form.submit();
	    }
    </script>
    
    <script type="text/javascript">
    
	    let today = new Date();
	    let preDate = new Date();
	    
	    let dd = String(today.getDate()).padStart(2, '0');
	    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	    let yyyy = today.getFullYear();
	    today = yyyy + '-' + mm + '-' + dd;
	    
	    // 오늘 날짜 조회
 		$("#toDay").on("click", function () {
			$('#dateTo').val(today);
			$('#dateFr').val(today);
		});
	    
 		$("#to7Day").on("click", function () {
 			preDate.setDate(preDate.getDate() - 7);
 			let dd = String(preDate.getDate()).padStart(2, '0');
 		    let mm = String(preDate.getMonth() + 1).padStart(2, '0'); //January is 0!
 		    let yyyy = preDate.getFullYear();
 		    today = yyyy + '-' + mm + '-' + dd;
 		    
			$('#dateTo').val(preDate);
			$('#dateFr').val(today);
		});
 		

	    
    </script>
    
</body>


</body>
</html>