<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>위탁 안내사항</title>

<!-- 필요한 CSS 파일들을 여기에 추가 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/font-awesome.css">

<link rel="stylesheet" href="${path}/resources/assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="${path}/resources/assets/css/owl-carousel.css">

<link rel="stylesheet" href="${path}/resources/assets/css/lightbox.css">

<link rel="stylesheet" href="${path}/resources/assets/css/consignmentGuide.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


</head>


<body>

	<%@include file="header.jsp"%>
	<div style="text-align: center">
		<div class="input-box" style="text-align: center">
			<form action="/위탁신청경로" method="post">
				<br> <br> <br> <br> <br> <br> <br>
				<br>
				<hr>
				<p>1. 위탁기간&회수</p>
				<hr>
				<br> 위탁기간 : 상품의 위탁기간은 상품 인도일로부터 기본 60일이며. 위탁기간이 종료된 후 별도의 수령의사가
				없으면 자동으로 연장됩니다.<br> 단 60일 이내에 고객님께서 상품수령을 원하시면, 본인 신분증과 위탁품
				보관증을 가지고 당사로 방문하시면 상품회수가 가능합니다.<br> <br> <br>
				<p>회수</p>
				위탁 후 60일 이후는 언제든지 회수 가능하나, 60일 이내 회수시에는 위약금 30,000원이 발생합니다.<br>
				회수요청이 없으면 1년까지 위탁 가능합니다. <br> <br>
				<hr>
				<p>2. 위탁 수수료</p>
				<hr>
				<br> 위탁상품의 수수료는 상품판매가의 현금/카드동일 기본 18% 입니다.<br> (단, 20만원 이하
				제품은 금액에 상관없이 40,000원)<br> 100만원 -18%는 82만원. 단, 의류 수수료는 20% 입니다.<br>
				<br> 위탁금액이 300만원 초과시 위탁수수료는 13% 입니다. <br> <br> <br>
				<br>
				<p>위탁 수수료 안내</p>
				<table>
					<!-- 첫 번째 행 -->
					<tr>
						<td></td>
						<td>~20만원 미만</td>
						<td>20~200만원 미만</td>
						<td>200~300만원 미만</td>
						<td>300~1000만원 미만</td>
						<td>1000~2000만원 미만</td>
						<td>2000만원 이상</td>
					</tr>
					<!-- 두 번째 행 -->
					<tr>
						<td>가방/주얼리/시계/지갑/기타</td>
						<td>4만원</td>
						<td>18%</td>
						<td>15%</td>
						<td>15%</td>

						<td class="adjustment" colspan="2">수수료 조정</td>
					</tr>
				</table>

				<table>
					<!-- 첫 번째 행 -->
					<tr>
						<td></td>
						<td>~20만원 미만</td>
						<td>20~200만원 미만</td>
						<td>200~300만원 미만</td>
						<td>500만원 이상</td>
					</tr>
					<!-- 두 번째 행 -->
					<tr>
						<td>가방/주얼리/시계/지갑/기타</td>
						<td>4만원</td>
						<td>18%</td>
						<td>15%</td>
						<td>수수료 조정</td>
					</tr>
				</table>
				<br>
				<hr>
				<p>3. 감정 후 위탁가격 결정</p>
				<hr>
				<br> 접수 : 온라인 위탁 신청을 통한 접수<br> 촬영 : 고객님께서 직접 촬영한 상품별 사진 등록<br>
				등록 : 상태, 색상, 사이즈, 소재 등 상품별 특징을 작성<br> <br> 위탁가격 결정기준 :
				진품여부, 컨디션, 현재 시세, 유행여부, 계절, 인기품목 여부, 부속품 유무 등을 종합적으로 고려하여 결정하게 됩니다.<br>
				<br> <br>
				<hr>
				<p>4. 감정 후 위탁가격 결정</p>
				<hr>
				<br> 판매 후 7일 이후 정산 됩니다. <br> <br>
				<hr>
				<br> <input type="radio" required> 위 내용을 확인하였습니다. <br>
				<br> <br> <br>
				
				<button type="button" style="border-radius: 10px;"
					onclick="goBack()">돌아가기</button>

				
				<button type="button" style="border-radius: 10px;"
					onclick="goToConsignmentPage()">위탁신청</button>

			</form>
		</div>
	</div>

	<%@include file="footer.jsp"%>


	<script>
		// 돌아가기 버튼 클릭 시 이전 화면으로 돌아가기
		function goBack() {
			window.history.back();
		}

		// 위탁신청 버튼 클릭 시 위탁신청 홈페이지로 이동
		function goToConsignmentPage() {
			// 위탁신청 홈페이지 URL을 여기에 입력
			var consignmentPageUrl = "http://localhost:8081/LuxuryClothing/csgnApplyPage.do";
			window.location.href = consignmentPageUrl;
		}
	</script>
</body>

</html>