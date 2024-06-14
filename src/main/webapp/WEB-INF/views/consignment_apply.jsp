<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Luxury Clothing</title>

    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/csgnApply.css">

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
	<div class="content_box">

		<div class="service_cont">
			<!-- <div class="mplTab">
                <ul>
                    <li><a href="/service/trust_sell_guide.php">위탁안내사항</a></li>
                    <li class="select"><a href="/service/trust_sell_request.php">위탁신청</a></li>
                </ul>
            </div> -->
            <div class="bannercocoService bannercocoService2">
                <span>
                    Luxury Clothing에서는 고객님과의 상호 신뢰를 바탕으로 위탁판매 서비스를 실시하고 있습니다.
                </span>
                <p>전문가의 정확한 감정과 합리적인 가격 책정으로 위탁 고객님과 구매고객님께 </span> 
                <p>모두 만족을 드리는 차별화된 코코럭스만의 서비스를 체험해보세요.</p>
            </div>
            <form action="csgnApply.do" method="post" enctype="multipart/form-data" >
            	<input type="hidden" name="user_id" id="user_id" value="${user_result.user_id}">
                <div class="cocoService">
                    <h1 class="title"><span>01</span> 주문자 정보</h1>
                    <div class="checkSame">
                        <span class="form_element">
                            <input type="checkbox" id="sameCustomer" name="sameCustomer" onclick="checkSame();">
                            <label for="sameCustomer" class="on">회원정보와 동일</label>
                        </span>
                    </div>
                    <section >
                    <table class="consignment_table" border="0" cellpadding="0" cellspacing="0" >
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" name="name" id="name" maxlength="30" >
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="text" name="email" id="email">
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td class="address">
                                <div class="address_input">
                                        <input type="text" name="address" id="address" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰번호</th>
                            <td>
                                <input type="text" name="phone" id="phone">
                            </td>
                        </tr>
                    </tbody>
                </table>
                </section>
                	<h1 class="title"><span>02 </span>제품 정보</h1>
                <table border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="25%">
                            <col width="75%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>영수증</th>
                                <td>
                                    <span class="certification">
                                        <input type="checkbox" id="tmp_certify_goods1_1" name="tmp_certify_goods[]" value="1">
                                        <!-- OCR 기능 사용 방법에 따라 변경 -->
                                    </span>

                                </td>
                            </tr>
								<!-- img 배열로 바꿀 예정 -->                            
                            <tr>
                            	<!-- 파일 선택 버튼 이 클래스에서 크기좀 줄여야함. -->
                                <th>메인 사진<br>판매 상품의 이미지</th>
                                <td>
                                    <div class="btn_upload_box">
                                        <input type="file" name="mainImg" id="mainImg" class="file" onchange="mainImageView(event);">
                                        <div id="mainImage_container"></div>
                                        <div id="mainImageUpname_container"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                            	<!-- 파일 선택 버튼 이 클래스에서 크기좀 줄여야함. -->
                                <th>서브 사진</th>
                                <td>
                                    <div class="btn_upload_box">
                                        <input type="file" name="subImg" id="subImg" class="file" onchange="subImageView(event);">
                                        <div id="subImage_container"></div>
                                        <div id="subImageUpname_container"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                            	<!-- 파일 선택 버튼 이 클래스에서 크기좀 줄여야함. -->
                                <th>영수증 사진</th>
                                <td>
                                    <div class="btn_upload_box">
                                        <input type="file" name="yongImg" id="yongImg" class="file" onchange="yongImageView(event);">
                                        <div id="yongImage_container"></div>
                                        <div id="yongImageUpname_container"></div>
                                        <input type="button" onclick="uploadFile();" value="조회">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>제품명</th>
                            	<td>
                                	<input required="required" type="text" name="goods_name" id="goods_name">
                            	</td>
	                        </tr>
	                        <tr>
	                            <th>구매가격</th>
	                            <td>
	                                <input required="required" type="number" name="goods_price" id="goods_price">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>희망가격</th>
	                            <td>
	                                <input required="required" type="number" name="wish_price">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>상품 종류</th>
	                            <td>
		                            <select class="category" name="goods_kind" id="goods_kind">
										<option value="모자">모자</option>
										<option value="상의">상의</option>
										<option value="하의">하의</option>
										<option value="하의">신발</option>
										<option value="악세서리">악세서리</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>상품 정보 기입</th>
								<td><textarea required="required" name="goods_option"
										id="goods_option"
										placeholder="상품 사이즈, 색상 등 관련 정보를 적어주세요(500자 이내)"
										style="width: 400px; height: 150px; font-size: 13px;"></textarea></td>
							</tr>
							<tr>
								<th>제품상태 <br>상세설명
								</th>
								<td><textarea required="required" name="goods_detail"
										id="goods_detail" placeholder="2000자 이내"
										style="width: 400px; height: 150px; font-size: 13px;"></textarea></td>
										
							</tr>
						</tbody>
					</table>
					<button type="submit" id="submit">신청서 작성완료</button>
				</div>
			</form>
		</div>
	</div>
	
	<form id="uploadForm">
	    <input type="file" name="file"/>
	</form>



	<%@include file="footer.jsp"%>
	

	<script type="text/javascript">
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

		function checkSame() {
			// 체크박스가 체크되었는지 확인
			if ($('input:checkbox[id="sameCustomer"]').is(":checked") == true) {
				// 세션에서 사용자 정보 가져오기
				var user_name = "${user_result.user_name}";
				var user_email = "${user_result.user_email}";
				var user_address = "${user_result.user_addr}";
				var user_phone = "${user_result.user_phone}";

				// 사용자 정보를 각 입력 필드에 할당
				$('#name').val(user_name);
				$('#email').val(user_email);
				$('#address').val(user_address);
				$('#phone').val(user_phone);
			} else {
				// 체크가 해제되면 입력 필드 비우기
				$('#name').val("");
				$('#email').val("");
				$('#address').val("");
				$('#phone').val("");
			}
		}
	</script>
	
	
	<script type="text/javascript">
	
	// 파일 업로드 (메인)
		function mainImageView(event) {
		
		    // 이전에 업로드된 이미지와 관련 요소들을 모두 제거합니다.
		    var prevImage = document.querySelector("div#mainImage_container img");
		    var prevDeleteButton = document.querySelector("div#mainImageUpname_container button");
		    var prevFileNameList = document.querySelector("div#mainImageUpname_container butten");
		    var prevBrTag = document.querySelector("div#mainImageUpname_container br");
		
		    if (prevImage) prevImage.parentNode.removeChild(prevImage);
		    if (prevDeleteButton) prevDeleteButton.parentNode.removeChild(prevDeleteButton);
		    if (prevFileNameList) prevFileNameList.parentNode.removeChild(prevFileNameList);
		    if (prevBrTag) prevBrTag.parentNode.removeChild(prevBrTag);
			
			for (var image of event.target.files) {
				var reader = new FileReader();
				
				/////////////////// 업로드한 이미지 데이터 추출  ///////////////////
				// 확장자가 이미지 파일인지 확인
				var fileExt = image.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
				var fileName = image.name.split(".")[0]; // 파일명에서 이름만 가져온다.
				console.log("fileName : " + fileName);
				console.log("fileExt : " + fileExt);
				  
				// 이미지 확장자에 따라 판별
				var fileUpload_yn = ($.inArray(fileExt, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
				console.log("fileUpload_yn 등록허가 : " + fileUpload_yn);
				
				// 파일의 최대 사이즈 확인
				var maxSize = 5 * 1024 * 1024; // 5MB로 제한 
				(image.size > maxSize) ? true : false;
				
				/////////////////// 실행 이벤트 항시 대기  ///////////////////
					reader.onload = function (event) {
					var img = document.createElement("img");	// 이미지 태그 선언
					img.setAttribute("src", event.target.result);	
					
				    // 이미지 크기 설정
				    img.style.width = '300px';
				    img.style.height = '300px';
					
					document.querySelector("div#mainImage_container").appendChild(img);
					
					// 파일명 추가 코드
					var deleteButton = document.createElement("button"); 	// 삭제 <butten> 태그 선언
					var brTag =	document.createElement("br");				// <br> 태그 선언
					var fileNameList = document.createElement("butten");	// <butten> 태그 선언
					
					deleteButton.textContent = "이미지 삭제"; 		// 삭제 버튼 내용(content) 설정
					fileNameList.textContent = image.name;	// 업로드한 파일 이름
					
					// html 태그 생성
					document.querySelector("div#mainImageUpname_container").appendChild(deleteButton);	// 삭제버튼 생성
					document.querySelector("div#mainImageUpname_container").appendChild(brTag);			// br 생성
					
					// 삭제 버튼 클릭시 이벤트 발생
					deleteButton.addEventListener("click", function () {
						img.parentNode.removeChild(img);					// 이미지 제거
						deleteButton.parentNode.removeChild(deleteButton);	// 삭제버튼 제거
						brTag.parentNode.removeChild(brTag);				// br태그 제거
						// 파일 입력 필드 초기화
					    document.getElementById('mainImg').value = '';
					});
				};
				reader.readAsDataURL(image);	// 이미지 보여짐
			}
		}
	</script>
	
	
	
	<script type="text/javascript">
	// 파일 업로드 (서브)
		function subImageView(event) {
		
		    // 이전에 업로드된 이미지와 관련 요소들을 모두 제거합니다.
		    var prevImage = document.querySelector("div#subImage_container img");
		    var prevDeleteButton = document.querySelector("div#subImageUpname_container button");
		    var prevFileNameList = document.querySelector("div#subImageUpname_container butten");
		    var prevBrTag = document.querySelector("div#subImageUpname_container br");
		
		    if (prevImage) prevImage.parentNode.removeChild(prevImage);
		    if (prevDeleteButton) prevDeleteButton.parentNode.removeChild(prevDeleteButton);
		    if (prevFileNameList) prevFileNameList.parentNode.removeChild(prevFileNameList);
		    if (prevBrTag) prevBrTag.parentNode.removeChild(prevBrTag);
			
			for (var image of event.target.files) {
				var reader = new FileReader();
				
				/////////////////// 업로드한 이미지 데이터 추출  ///////////////////
				// 확장자가 이미지 파일인지 확인
				var fileExt = image.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
				var fileName = image.name.split(".")[0]; // 파일명에서 이름만 가져온다.
				console.log("fileName : " + fileName);
				console.log("fileExt : " + fileExt);
				  
				// 이미지 확장자에 따라 판별
				var fileUpload_yn = ($.inArray(fileExt, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
				console.log("fileUpload_yn 등록허가 : " + fileUpload_yn);
				
				// 파일의 최대 사이즈 확인
				var maxSize = 5 * 1024 * 1024; // 5MB로 제한 
				(image.size > maxSize) ? true : false;
				
				/////////////////// 실행 이벤트 항시 대기  ///////////////////
					reader.onload = function (event) {
					var img = document.createElement("img");	// 이미지 태그 선언
					img.setAttribute("src", event.target.result);	
					
				    // 이미지 크기 설정
				    img.style.width = '300px';
				    img.style.height = '300px';
					
					document.querySelector("div#subImage_container").appendChild(img);
					
					// 파일명 추가 코드
					var deleteButton = document.createElement("button"); 	// 삭제 <butten> 태그 선언
					var brTag =	document.createElement("br");				// <br> 태그 선언
					var fileNameList = document.createElement("butten");	// <butten> 태그 선언
					
					deleteButton.textContent = "이미지 삭제"; 		// 삭제 버튼 내용(content) 설정
					fileNameList.textContent = image.name;	// 업로드한 파일 이름
					
					// html 태그 생성
					document.querySelector("div#subImageUpname_container").appendChild(deleteButton);	// 삭제버튼 생성
					document.querySelector("div#subImageUpname_container").appendChild(brTag);			// br 생성
					
					// 삭제 버튼 클릭시 이벤트 발생
					deleteButton.addEventListener("click", function () {
						img.parentNode.removeChild(img);					// 이미지 제거
						deleteButton.parentNode.removeChild(deleteButton);	// 삭제버튼 제거
						brTag.parentNode.removeChild(brTag);				// br태그 제거
						// 파일 입력 필드 초기화
					    document.getElementById('subImg').value = '';
					});
				};
				reader.readAsDataURL(image);	// 이미지 보여짐
			}
		}
	</script>
	


	<script type="text/javascript">
	// 파일 업로드 (영수증)
		function yongImageView(event) {
		
		    // 이전에 업로드된 이미지와 관련 요소들을 모두 제거합니다.
		    var prevImage = document.querySelector("div#yongImage_container img");
		    var prevDeleteButton = document.querySelector("div#yongImageUpname_container button");
		    var prevFileNameList = document.querySelector("div#yongImageUpname_container butten");
		    var prevBrTag = document.querySelector("div#yongImageUpname_container br");
		
		    if (prevImage) prevImage.parentNode.removeChild(prevImage);
		    if (prevDeleteButton) prevDeleteButton.parentNode.removeChild(prevDeleteButton);
		    if (prevFileNameList) prevFileNameList.parentNode.removeChild(prevFileNameList);
		    if (prevBrTag) prevBrTag.parentNode.removeChild(prevBrTag);
			
			for (var image of event.target.files) {
				var reader = new FileReader();
				
				/////////////////// 업로드한 이미지 데이터 추출  ///////////////////
				// 확장자가 이미지 파일인지 확인
				var fileExt = image.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 
				var fileName = image.name.split(".")[0]; // 파일명에서 이름만 가져온다.
				console.log("fileName : " + fileName);
				console.log("fileExt : " + fileExt);
				  
				// 이미지 확장자에 따라 판별
				var fileUpload_yn = ($.inArray(fileExt, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
				console.log("fileUpload_yn 등록허가 : " + fileUpload_yn);
				
				// 파일의 최대 사이즈 확인
				var maxSize = 5 * 1024 * 1024; // 5MB로 제한 
				(image.size > maxSize) ? true : false;
				
				/////////////////// 실행 이벤트 항시 대기  ///////////////////
					reader.onload = function (event) {
					var img = document.createElement("img");	// 이미지 태그 선언
					img.setAttribute("src", event.target.result);	
					
				    // 이미지 크기 설정
				    img.style.width = '300px';
				    img.style.height = '300px';
					
					document.querySelector("div#yongImage_container").appendChild(img);
					
					// 파일명 추가 코드
					var deleteButton = document.createElement("button"); 	// 삭제 <butten> 태그 선언
					var brTag =	document.createElement("br");				// <br> 태그 선언
					var fileNameList = document.createElement("butten");	// <butten> 태그 선언
					
					deleteButton.textContent = "이미지 삭제"; 		// 삭제 버튼 내용(content) 설정
					fileNameList.textContent = image.name;	// 업로드한 파일 이름
					
					// html 태그 생성
					document.querySelector("div#yongImageUpname_container").appendChild(deleteButton);	// 삭제버튼 생성
					document.querySelector("div#yongImageUpname_container").appendChild(brTag);			// br 생성
					
					// 삭제 버튼 클릭시 이벤트 발생
					deleteButton.addEventListener("click", function () {
						img.parentNode.removeChild(img);					// 이미지 제거
						deleteButton.parentNode.removeChild(deleteButton);	// 삭제버튼 제거
						brTag.parentNode.removeChild(brTag);				// br태그 제거
						// 파일 입력 필드 초기화
					    document.getElementById('yongImg').value = '';
					});
				};
				reader.readAsDataURL(image);	// 이미지 보여짐
			}
		}
	</script>
	
	<script type="text/javascript">
	function uploadFile() {
		console.log('uploadFile 방문');
		
	    $('#file').val( $('#yongImg').val() );
	    var file = $('#uploadForm')[0];
	    
	    var formData = new FormData(file);
	    formData.append('file', file);

	    console.log(file);
	    $('#goods_price').val( 21000 );
	    
	    $.ajax({
	        url: 'yongImg.do',
	        type: 'POST',
	        data: formData,
	        contentType : false ,
	        processData : false ,
	        success: function(data) {
	            console.log(data);
	            console.log('파일 업로드 성공!');
	            
	            
	        },
	        error: function(e) {
	            console.log('파일 업로드 실패!');
	        } 
	    });
	}
	
	</script>
	
</body>
</html>