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
<title>상품 상세 정보</title>

<!-- 필요한 CSS 파일들을 여기에 추가 -->

<link rel="stylesheet"	href="${path}/resources/assets/css/product_detail.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


</head>

<body>

	<%@include file="header.jsp"%>

	<div class="container">

		<div class="product-image">
			<!-- 상품 이미지 -->
			<img
				src="${path}/resources/assets/images/products/${prod_mainImage.file_name}">
		</div>

		<c:forEach var="arr" items="${prod_subImages}" varStatus="status">
			<img src="${path}/resources/assets/images/products/${arr.file_name}">
		</c:forEach>

		<div class="product-details">
			<%-- <c:set var="product" value="<%=request.getAttribute("product_detail")%>"></c:set> --%>

			<%--
        	ProductsDTO dto = (ProductsDTO)(request.getAttribute("prod_detail")); 
        	
        	String prod_name = dto.getProd_name();
        	String prod_price = dto.getProd_price();
        	String prod_category = dto.getProd_category();
        	String prod_desc = dto.getProd_desc();
        	String prod_option = dto.getProd_option();
        	String prod_status = dto.getProd_status();
        	
        	%> --%>
			<!-- 형변환 필요 object type이기 때문에 -->
			<c:set var="prod" value="${sessionScope.prod_detail}" />
			<%-- <c:set var="user" value="${sessionScope.user_result}"/> --%>

			<form action="payment.do" method="get" id="payment">
				<br> <br> <br> <br> <br>
				<h1>${prod.prod_name}</h1>
				<%-- <h1><%= prod_name %></h1>
            <h3><%= prod_price %></h1> --%>
				<hr>


				<!-- ================== 여기서부터 table 로 해볼 공간====================  -->

				<table>
					<tr>
						<th>가격</th>
						<td>${prod.prod_price}원</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${prod.prod_category}</td>
					</tr>
					<tr>
						<th>상세정보</th>
						<td>${prod.prod_option}</td>
					</tr>
					<tr>
						<th>제품상태</th>
						<td>${prod.prod_desc}</td>
					</tr>
					<tr>
						<th>외부상태</th>
						<td><div class="condition">
								<span>신품/</span> <span>미사용</span></td>
					</tr>
					<tr>
						<th>내부상태</th>
						<td><div class="condition">
								<span>신품/</span> <span>미사용</span>
							</div></td>
					</tr>
					<tr>
						<th>부속품</th>
						<td>더스크백, 케이스</td>
					</tr>
					<tr>
						<th>색상</th>
						<td>블랙</td>
					</tr>
				</table>


				<!-- ======================여기 아래론 건들면 안댄다 ========================= -->
			</form>
			<hr>
			<div class="box">
				<span>S 신품과 동일,</span> <span>A+ 미세한 사용감 외 매우 좋은 상태,</span> <span>A
					사용감은 있지만 매우 좋은 상태,</span> <span>B+ A와 B의 중간정도 상태 ,</span> <span>B
					적당한 상태,</span> <span>C 사용감이 많고 중고품으로 사용가능한 최저상태</span>
			</div>

			<hr>
			<div style="position: relative; left: 250px;">
				<h3><span style="font-weight: bold;">총 결제금액 :</span> <span
					style="font-weight: bold;">${prod.prod_price} 원</span></h3>
			</div>
			<hr>
			
			<div style="position: relative; left: 160px;">
							<button class="cartPickList">장바구니</button>
				<button id="buyNow">바로 구매</button>
			</div>
			
		</div>

	</div>

	<form action="cartPickList.do" id="insertForm" name="insertForm">
		<input type="hidden" id="user_id" name="user_id"
			value="${user_result.user_id}"> <input type="hidden"
			id="prod_id" name="prod_id" value="${prod.prod_id}">
	</form>
	</div>
	</div>

	<%@include file="footer.jsp"%>

	<script type="text/javascript">
    	var user = "${user_result}";
		
	    <!-- 세션에 저장된 user_result 가져오기 -->
  
		$("#buyNow").on("click", function(){
			console.log("event")
			
			if(user == null || user == ""){
				window.location.href="loginpage.do"
			}else{
				$("#payment").submit();
			}
			
			
		});
		
		// 장바구니 버튼 클릭시 장바구니 상품 담기
		$(".cartPickList").on("click", function(){
			console.log("event")
			
			if(user == null || user == ""){
				window.location.href="loginpage.do"
			}else{
				// form 태그 실행
			 	var form = document.getElementById('insertForm');
			 	form.submit();
			}
		});
		
		
    	</script>

</body>