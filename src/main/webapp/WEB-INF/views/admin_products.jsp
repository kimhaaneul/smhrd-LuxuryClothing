<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.button_margin{
		margin-top: 10px;
	}
	
	.product_table tr td{
		padding-right: 40px;
	}
	
	.cart_img{
		width: 50px;
		height : 50px;
	}
	
	.text_all{
		text-align: center;
	}
</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 복붙코드 제이쿼리 : 제이쿼리 불러오기 ! ***** -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style type="text/css">

</style>
</head>

<body>
	<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
	<%@include file="header.jsp"%>
		<!-- 여백용 공간 -->
	<div class="content_box">
		<form action="adminSearchProducts.do">
			<div class="div_inline">
				<div class="search_div">
					<h3 class="search_admin_main">관리자 상품관리</h3>
					<b class="search_margin">등급 및 종류</b>
					<select name="rating" id="rating">
						<option value="전체 등급">전체 등급</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
					</select> 
					<select name="kind" id="kind">
						<option value="상품 종류">상품 종류</option>
						<option value="모자">모자</option>
						<option value="상의">상의</option>
						<option value="하의">하의</option>
						<option value="악세서리">악세서리</option>
					</select>
					<select name="prod_yn" id="prod_yn">
						<option value="등록 여부">등록 여부</option>
						<option value="Y">Y</option>해당
						<option value="N">N</option>
					</select>
					<hr>
					<!-- 구매 희망가격 슬라이더 STR -->
					<div>
					<b class="search_margin">판매 가격(원)</b>
						<label for="amount">
							<div>
								<input type="text" id="amount" name="amount">
							</div>
								<p id="slider-range" class="slider-range"></p>
						</label> 
					</div>
					<!-- 구매 희망가격 슬라이더 END -->
					<hr>
					<b class="search_margin">상품 검색어</b>
					<input class="search_box" type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하세요">
					<button>검색</button>
					<button id="reset">초기화</button>
					<div id="searchResults"></div>
				</div>
			</div>
		</form>
	</div>


	<!-- ***** 상품리스트 Area Starts ***** -->
	<div class="container">
		<div class="row">
			<div class="col-lg-6" style="margin-top: 60px">
				<div class="section-heading">
				<b style="color: red;">${count}</b>건 조회
				<br>
				<button class="button_margin" onclick="adminDelete();">선택 판매중단</button>
				<button class="button_margin">상품 등록</button>
				</div>
			</div>
		</div>
	</div>
	<br>
	<table class="product_table">
		<c:if test="${result != null}">
			<tr>
				<td class="search_admin_td">선택</td>
				<td class="search_admin_td">번호</td>
				<td class="search_admin_td">이미지</td>
				<td class="search_admin_td">상품 코드</td>
				<td class="search_admin_td">상품 명</td>
				<td class="search_admin_td">최초 등록 일</td>
				<td class="search_admin_td">상품 등급</td>
				<td class="search_admin_td">판매가</td>
				<td class="search_admin_td">관리</td>
			</tr>
			
			<c:forEach var="result" items="${result}" varStatus="status">
				<input type="hidden" value="${result.prod_yn}">
				<input type="hidden" value="${result.prod_id}" name="prod_id${result.prod_id}" id="prod_id${result.prod_id}">
				
				<tr class="${result.prod_yn == 'Y' ? 'td_product_y' : 'td_product_n'}">
					<td><input type="checkbox" value="${result.prod_id}" name="prod_check${result.prod_id}" id="prod_check${result.prod_id}"></td>
					<td> ${status.index+1}</td>
					<td> <img class="cart_img" src="${path}/resources/assets/images/products/${result.file_name}"></td>
					<td> ${result.prod_id} </td>
					<td> <input type="text" value="${result.prod_name}" id="prod_name${result.prod_id}"> </td>
					<td> ${result.created_at} </td>
					<td> <input class="input_list1" type="text" value="${result.prod_grade}" id="prod_grade${result.prod_id}"> </td>
					<td> <input class="input_list2" type="text" value="${result.prod_price}" id="prod_price${result.prod_id}"> </td>
					<td> 
						<button value="${result.prod_id}" 
								onclick="updateButton(${result.prod_id});">수정
						</button>
					</td>
				</tr>
			</c:forEach>
			
		</c:if>
		<c:if test="${result == null}">
			<tr >
				<td class="text_all" colspan="8">검색 조건에 해당하는 상품이 없습니다.</td>
			</tr>
		</c:if>
	</table>
	
	<!-- 엡데이트 세팅 -->
	<form action="adminProductUpdate.do" method="post" id="updateForm" name="updateForm">
		<input type="hidden" value="" name="data_id" id="data_id">
		<input type="hidden" value="" name="data_name" id="data_name">
		<input type="hidden" value="" name="data_grade" id="data_grade">
		<input type="hidden" value="" name="data_price" id="data_price">
	</form>
	
	<!-- 삭제 세팅 -->
	<form action="adminProductDelete.do" method="post" id="deleteForm" name="deleteForm">
		<input type="hidden" value="" name="delete_id" id="delete_id">
	</form>
	<hr>

	<!-- ***** Men Area Ends ***** -->

	<script>
 	<!-- 구매 희망가격 슬라이더 STR -->
	$( function() {
		$( "#slider-range" ).slider({
			range: true,
			min: 0,
			max: 5000000,
			values: [ 0, 5000000 ],
			step: 10000, // 증가 값 설정
			slide: function( event, ui ) {
			  $( "#amount" ).val( ui.values[ 0 ] + " ~ " + ui.values[ 1 ] );
			}
		});
		
		$( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
		" ~ " + $( "#slider-range" ).slider( "values", 1 ) );
	});
	
	  
	<!-- 검색기록 남겨두기 STR -->
	 $(document).ready(function() {
		 
		// 이전 검색 기록 세팅하기
		// 1) 세션의 데이터 가져오기
        let prod_grade = "${serch.prod_grade}";
        let prod_category = "${serch.prod_category}";
        let prod_priceMin = "${serch.prod_priceMin}";
        let prod_priceMax = "${serch.prod_priceMax}";
        let prod_name = "${serch.prod_name}";
        let prod_yn = "${serch.prod_yn}";
		console.log(prod_grade);
		console.log(prod_category);
		console.log(prod_priceMin);
		console.log(prod_priceMax);
		console.log(prod_name);
		console.log(prod_yn);
		
		// 2) 태그에 이전 검색 기록 대입하기(값 넣어주기)
		if (	   (prod_grade === null || prod_grade === undefined || prod_grade === '') 
				&& (prod_category === null || prod_category === undefined || prod_category === '') 
				&& (prod_priceMin === null || prod_priceMin === undefined || prod_priceMin === '') 
				&& (prod_priceMax === null || prod_priceMax === undefined || prod_priceMax === '') 
				&& (prod_name === null || prod_name === undefined || prod_name === '')
				&& (prod_yn === null || prod_yn === undefined || prod_yn === '')) {
			// 첫 페이지 시작시 검색 값 세팅
			$('#rating').val("전체 등급").prop("selected", true);
			$('#kind').val("상품 종류").prop("selected", true);
			$('#prod_yn').val("등록 여부").prop("selected", true);
			$('#amount').val('0 ~ 5000000');
			$('#searchInput').val("");
			console.log("검색 데이터 초기화");
		} else {
			$('#rating').val(prod_grade).prop("selected", true);
			$('#kind').val(prod_category).prop("selected", true);
			$('#prod_yn').val(prod_yn).prop("selected", true);
			$('#amount').val(prod_priceMin + ' ~ ' + prod_priceMax);
			$('#searchInput').val(prod_name);
			console.log("검색 이전 데이터 세팅");
		}


		// 리셋버튼 누르면 초기화 시킴
		$("#reset").on("click", function () {
			$('#rating').val("전체 등급").prop("selected",true);
			$('#kind').val("상품 종류").prop("selected",true);
			$('#prod_yn').val("등록 여부").prop("selected",true);
			$('#amount').val('0 ~ 5000000');
			$('#searchInput').val("");
		});
		
	 });   
	 
 	</script>
 	
 	<script type="text/javascript">
	 
 	// 관리자 페이지에서 수정 버튼 누르면 해당 데이터 전송하기
	function updateButton(id) {
 		
		var prod_id = 'prod_id'+id;
		var prod_name = 'prod_name'+id;
		var prod_grade = 'prod_grade'+id;
		var prod_price = 'prod_price'+id;
		
		console.log("prod 데이터 확인 : " + prod_id, prod_name, prod_grade, prod_price);
 		
		var id = document.getElementById(prod_id).value;
		var name = document.getElementById(prod_name).value;
		var grade = document.getElementById(prod_grade).value;
		var price = document.getElementById(prod_price).value;
 		
	 	console.log("데이터 확인 : " + id, name, grade, price);
	 	
	 	$('#data_id').val(id);
	 	$('#data_name').val(name);
	 	$('#data_grade').val(grade);
	 	$('#data_price').val(price);
	 	
	 	// form 태그 실행
	 	var form = document.getElementById('updateForm');
	 	form.submit();
	};
	
	
	function adminDelete() {
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
		$('#delete_id').val(values);
		
		// form 태그 실행
	 	var form = document.getElementById('deleteForm');
	 	form.submit();
		
	}
 	
 	</script>


	<!-- 복붙코드 jsp : footer 불러오기 ! ***** -->
	<%@include file="footer.jsp"%>
</body>
</html>