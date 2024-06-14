
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Luxury Clothing</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
	
	   <style>

        
		/*         
		.slider:nth-child(1)::before {content: '이미지1';}
        .slider:nth-child(2)::before {content: '이미지2';}
        .slider:nth-child(3)::before {content: '이미지3';}
        .slider:nth-child(4)::before {content: '이미지4';}
        .slider:nth-child(5)::before {content: '이미지5';}
        .slider:nth-child(1) {z-index: 5;}
        .slider:nth-child(2) {z-index: 4;}
        .slider:nth-child(3) {z-index: 3;}
        .slider:nth-child(4) {z-index: 2;}
        .slider:nth-child(5) {z-index: 1;} 
        */
    </style>
    
</head>

<body>

	
	<!-- ***** header 불러오기 ! ***** -->
	<%@include file="header.jsp"%>
	<!-- ***** 헤더의 공간 확보 100px ***** -->
	<div style="margin-top: 100px"></div>
	
	<!-- ***** 메인 글씨 이미지로 추가 ***** -->
	<img src="${path}/resources/assets/images/Main_luxuryClothing.jpg" class="main_luxuryClothing" >
	<!-- ***** 이벤트 슬라이드 화면  ***** -->
	<main id="main">
	    <div class="slider__wrap">
	        <div class="slider__img">
	            <div class="slider"><img src="${path}/resources/assets/images/team-member-04.png" ></div>
	            <div class="slider"><img src="${path}/resources/assets/images/team-member-05.png" ></div>
	            <div class="slider"><img src="${path}/resources/assets/images/team-member-06.png" ></div>
	            <div class="slider"><img src="${path}/resources/assets/images/slider-240221-02.jpg" ></div>
	        </div>
	    </div>
	</main>
	<!-- ***** Main Banner Area End ***** -->
	
	<script>
        // 선택자
        const sliderWrap = document.querySelector(".slider__wrap");
        const sliderImg = sliderWrap.querySelector(".slider__img");
        const slider = sliderWrap.querySelectorAll(".slider");

        let currentIndex = 0;               // 현재 보이는 이미지
        let sliderCount = slider.length;    // 이미지 갯수
        let sliderInterval = 3000;          // 이미지 변경 간격 시간
        
        
		setInterval(() => {
		    let nextIndex = (currentIndex + 1) % sliderCount;
		  
		    $(slider[currentIndex]).animate({ opacity: 0 }, 500); // 현재 슬라이더 숨기기
		    $(slider[nextIndex]).animate({ opacity: 1 }, 500); // 다음 슬라이더 보여주기
		  
		    currentIndex = nextIndex;
		}, sliderInterval);
    </script>

	<!-- ***** 전체 Area Starts ***** -->
	<section class="section" id="men">
	<div class="container">
		<div>
			<div >
				<div>
					<h3 class="product_category_namme">상품 리스트	</h3>
					<table class="product_table">
						<tr>
							<td class="product_category">전체</td>
							<td class="product_category">모자</td>
							<td class="product_category">상의</td>
							<td class="product_category">하의</td>
							<td class="product_category">신발</td>
							<td class="product_category">악세서리</td>
						</tr>
					</table>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="men-item-carousel">
					<div class="owl-men-item owl-carousel">
					
						<c:forEach var="arr" items="${product_result}" varStatus="status">
							<div class="item">
								<div class="thumb">
									<a href="product_detail.do?product_id=${arr.prod_id}">
										<img src="${path}/resources/assets/images/products/${arr.file_name}" alt="이미지 준비 중">
									</a>
								</div>

								<div class="down-content ">
									<h4>${arr.prod_name}</h4>
									<div class="inline_price">
										<table class="prod_list">
											<tr>
												<td>
													<b class="prod_grade">${arr.prod_grade}</b>
												</td>
												<td class="prod_price">
													<span >${arr.prod_price} 원</span>
												</td>
											</tr>
										</table>
									</div>
								</div>
								
							</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- ***** 전체 Area Ends ***** -->

	<!-- ***** 추천 Area Starts ***** -->
	<section class="section" id="women">
	<div class="container">
		<div>
			<div >
				<div>
					<h3 class="product_category_namme">이번 주 특별 추천</h3>
					<h5 class="product_category_sub">나만의 특별한 상품</h5>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="men-item-carousel">
					<div class="owl-men-item owl-carousel">
					<c:if test="${product_pick != null}">
						<c:forEach var="arr" items="${product_pick}" varStatus="status">
							<div class="item">
								<div class="thumb">
									<a href="product_detail.do?product_id=${arr.prod_id}">
										<img src="${path}/resources/assets/images/products/${arr.file_name}" alt="이미지 준비 중">
									</a>
								</div>

								<div class="down-content ">
									<h4>${arr.prod_name}</h4>
									<div class="inline_price">
										<table class="prod_list">
											<tr>
												<td>
													<b class="prod_grade">${arr.prod_grade}</b>
												</td>
												<td class="prod_price">
													<span >${arr.prod_price} 원</span>
												</td>
											</tr>
										</table>
									</div>
								</div>
								
							</div>
						</c:forEach>
						</c:if>
						<c:if test="${product_pick == null}">
							<img src="${path}/resources/assets/images/imageNot.png" alt="이미지 준비 중">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- ***** 추천 Area Ends ***** -->


	<!-- ***** footer 불러오기 ! ***** -->
	<%@include file="footer.jsp"%>



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
		
		

	</script>

</body>
</html>