<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
		img{
			width: 50px;
			height: 50px;
		}
	</style>
	

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>장바구니</title>
<!-- 외부 CSS 파일 연결 -->
<link rel="stylesheet"
	href="${path}/resources/assets/css/shopping_basket.css">
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
</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
		</div>
	</div>
	<!-- ***** Preloader End ***** -->
	<%@include file="header.jsp"%>
	<!-- ***** Contact Area Starts ***** -->
	<div class="contact-us">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 장바구니 기능 부분 -->
				<div class="col-lg-12">
					<div class="section-heading text-center">
						<h2>장바구니</h2>
					</div>
					<hr class="border-line">
					<!-- 장바구니 내용 -->
					<div id="cart-container">
					
						<!-- 여기에 장바구니 내용을 표시할 것입니다 -->
						<form id="cartForm">
							<div class="product-list">
							
								<table class="product_table">
									<c:if test="${totalPrice > 0}">
										<tr>
											<td class="search_admin_td">선택</td>
											<td class="search_admin_td">번호</td>
											<td class="search_admin_td">이미지</td>
											<td class="search_admin_td">상품 코드</td>
											<td class="search_admin_td">상품 명</td>
											<td class="search_admin_td">상품 등급</td>
											<td class="search_admin_td">판매가</td>
										</tr>
										
									
										<c:forEach var="result" items="${cartItems}" varStatus="status">
											<input type="hidden" value="${result.prod_yn}">
											<input type="hidden" value="${result.prod_id}" name="prod_id${result.prod_id}" id="prod_id${result.prod_id}">
											
											<tr>
												<td><input type="checkbox" value="${result.prod_id}" name="prod_check${result.prod_id}" id="prod_check${result.prod_id}"></td>
												<td> ${status.index+1}</td>
												<td> <img class="cart_img" src="${path}/resources/assets/images/products/${result.file_name}"></td>
												<td> ${result.prod_id} </td>
												<td> <input type="hidden" value="${result.prod_name}" id="prod_name${result.prod_id}"> ${result.prod_name} </td>
												<td> <input class="prod_grade" type="hidden" value="${result.prod_grade}" id="prod_grade${result.prod_id}"> ${result.prod_grade} </td>
												<td> <input class="input_list2" type="hidden" value="${result.prod_price}" id="prod_price${result.prod_id}"> ${result.prod_price} </td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
								
								<table class="product_table" style="margin-top: 100px">
									<c:if test="${totalPrice > 0}">
										<tr>
											<!-- 장바구니 합계 -->
											<td class="text_all">
												총 ${count}개의 상품 
											</td>
										</tr>
										<tr>
											<!-- 장바구니 합계 -->
											<td class="text_all">
												장바구니 합계 : ${totalPrice} 원
											</td>
										</tr>
										<tr><td></td></tr>
										<tr>
											<!-- 장바구니 합계 -->
											<td class="text_all" colspan="7">
												<button type="button" onclick="cartDelete();">선택 삭제</button>
												<button type="button" onclick="cartPayPage();">결제</button>
											</td>
										</tr>
									</c:if>
									<c:if test="${totalPrice == 0}">
										<tr>
											<!-- 장바구니가 비어있을 때 메시지 -->
											<td>장바구니에 상품이 없습니다.</td>
										</tr>
									</c:if>
								</table>
								
							</div>
						</form>
						
					</div>
					
		
				</div>
			</div>
		</div>
	</div>
	
		<!-- 삭제 세팅 -->
	<form action="cartProductDelete.do" method="post" id="deleteForm" name="deleteForm">
		<input type="hidden" value="" name="deleteProd_id" id="deleteProd_id">
		<input type="hidden" value="" name="deleteUser_id" id="deleteUser_id">
	</form>
	
	<form action="cartPayPage.do" method="post" id="cartPayForm" name="cartPayForm">
		<input type="hidden" value="" name="cartPayProd_id" id="cartPayProd_id">
	</form>
	<!-- ***** Contact Area Ends ***** -->
	


	<script>
		// 페이지 로딩시 장바구니 상태 업데이트
		// updateCart();
		// 페이지 로딩시 장바구니 상태 업데이트
		$(document).ready(function() {
			// 페이지 로딩시 총 가격 계산
			updateTotalPrice();

			// 각 상품 체크박스의 변경 이벤트를 감지하여 합계 가격을 계산
			$(".product-checkbox").change(updateTotalPrice);
		});

		
		// 장바구니 상품의 총 가격 보여주기
		function updateTotalPrice() {
			var totalPrice = 0;
			$(".product-checkbox:checked").each(
					function() {
						// 선택된 상품의 가격을 가져오기
						var price = parseInt($(this).closest(".product-item")
								.find(".product-price").text().trim().replace(
										"원", ""));
						// 가져온 가격이 숫자인지 확인하고 숫자가 아니면 무시
						if (!isNaN(price)) {
							totalPrice += price;
						}
					});
			// 합산된 가격을 화면에 출력
			$("#totalPrice").text(totalPrice);
		}
		
		
		// 선택항목 지워주기
		function cartDelete() {
			// 체크박스가 체크된 input 요소들을 선택
			var checkedInputs = document.querySelectorAll('input[type=checkbox]:checked');
			
			// 체크된 input 요소들의 값들을 저장할 배열
			var values = [];
			// 각 체크된 input 요소에 대해
			checkedInputs.forEach(function(input) {
			    // 해당 요소의 값을 배열에 추가
			    values.push(input.value);
			});
			
			console.log(values);  // 체크된 input 요소들의 값들을 출력
			
			$('#deleteProd_id').val(values);
			$('#deleteUser_id').val($('#user_id').val());
			
			// form 태그 실행
	 	 	var form = document.getElementById('deleteForm');
		 	form.submit();
			
		}
		
		// 체크된 항목들 결제하기
		function cartPayPage() {
			// 체크박스가 체크된 input 요소들을 선택
			var checkedInputs = document.querySelectorAll('input[type=checkbox]:checked');
			
			// 체크된 input 요소들의 값들을 저장할 배열
			var values = [];
			// 각 체크된 input 요소에 대해
			checkedInputs.forEach(function(input) {
			    // 해당 요소의 값을 배열에 추가
			    values.push(input.value);
			});
			
			console.log(values);  // 체크된 input 요소들의 값들을 출력
			
			$('#cartPayProd_id').val(values);
			
			// form 태그 실행
	 	 	var form = document.getElementById('cartPayForm');
		 	form.submit();
			
		}
	</script>
</body>
<%@include file="footer.jsp"%>
</html>
