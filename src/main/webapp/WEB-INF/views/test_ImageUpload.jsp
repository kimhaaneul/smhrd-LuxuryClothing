<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 해당 페이지는 우리가 jsp를 작성하며 지켜야할 규칙입니다. -->
<!-- 복붙코드 jsp : header 불러오기 ! ***** -->
<%@include file ="header.jsp" %>
<div style="margin-top: 100px"></div>

<body>
html 화면 


<br>
<a href="ProductSelect.do">상품 21번의 등록된 이미지 보러가기</a>
<br>
<br>

<form action="ProductImageUpload.do" method="post" enctype="multipart/form-data">
	<input type="file" name="file" id="image" onchange="setThumbnail(event);" />
	<input type="hidden" name="arrImages" id="arrImages">
	<br>
	<div>업로드 파일명 : </div>
	<input type="submit" value="이미지 등록">
	<table>
		<tr>
			<div id="imageUpname_container">
			</div>
		</tr>
	</table>
	
	<div id="image_container"></div>
</form>

<!-- 이미지 불러오기 
<img alt="" src="resources/assets/images/products/smmi.png">
-->

<script type="text/javascript">

//////////////////////////////////////////////////////////////////
// 				script	아래 코드 사용하지 말것 ! 
//////////////////////////////////////////////////////////////////



var arrImag = [];	// 등록시 이미지 정보를 전송할 배열
var num = 0;	//배열 주소를 구분할 식별자

// 파일 업로드하면 이벤트 발생!
function setThumbnail(event) {
	
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
		
		// 배열에 정보 넣어줌!
		arrImag[num] = fileName+"/"+fileExt+"/"+maxSize;
		num ++;
		
		/////////////////// 실행 이벤트 항시 대기  ///////////////////
		reader.onload = function (event) {
			var img = document.createElement("img");	// 이미지 태그 선언
			img.setAttribute("src", event.target.result);	
			document.querySelector("div#image_container").appendChild(img);
			    
			// 파일명 추가 코드
			var fileNameList = document.createElement("butten");	// <butten> 태그 선언
			var brTag =	document.createElement("br");				// <br> 태그 선언
			var deleteButton = document.createElement("button"); 	// 삭제 <butten> 태그 선언
			deleteButton.textContent = "삭제"; 		// 삭제 버튼 내용(content) 설정
			fileNameList.textContent = image.name;	// 업로드한 파일 이름
			fileNameList.value = num;		// 파일명에 id 부여(식별자)
			
			// html 태그 생성
			document.querySelector("div#imageUpname_container").appendChild(fileNameList);	// 파일명 생성
			document.querySelector("div#imageUpname_container").appendChild(deleteButton);	// 삭제버튼 생성
			document.querySelector("div#imageUpname_container").appendChild(brTag);			// br 생성
			
			// 삭제 버튼 클릭시 이벤트 발생
			deleteButton.addEventListener("click", function () {
				img.parentNode.removeChild(img);					// 이미지 제거
				deleteButton.parentNode.removeChild(deleteButton);	// 삭제버튼 제거
				fileNameList.parentNode.removeChild(fileNameList);	// 파일이름 제거
				brTag.parentNode.removeChild(brTag);				// br태그 제거
				arrImag.splice( parseInt(fileNameList.value)-1, 1 );	// 배열의 인덱스 위치 값 삭제
				document.getElementById("arrImages").value = arrImag;	// input태그에 배열 값 재설정
				// 삭제후 배열 상태표기
				console.log("삭제할 인덱스 : " + fileNameList.value);
				console.log("삭제 후 배열 : " + arrImag);
				});
		};
		
		reader.readAsDataURL(image);	// 이미지 보여짐
		document.getElementById("arrImages").value = arrImag;


	}
	
}

</script>

</body>
<%@include file ="footer.jsp" %>
</html>