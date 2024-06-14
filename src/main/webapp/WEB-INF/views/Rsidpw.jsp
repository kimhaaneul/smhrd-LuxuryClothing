<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 재설정 페이지</title>
    <style type="text/css">
    /* @charset "UTF-8"; */
/* 페이지 전체를 가운데로 정렬 */
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* 섹션 스타일 */
.section {
    text-align: center;
    width: 100%;
    margin: 20px;
    
}

/* h2 태그 스타일 */
h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

/* hr 태그 스타일 */
hr {
    border: none;
    border-top: 1px solid black;
    width: 350px;
   

}

/* input 태그 스타일 */
.input-container {
    display: flex;
    flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 가운데 정렬 */
}

input[type="text"],
input[type="email"] {
    width: 50%;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* 버튼 스타일 */
button {
    padding: 10px 20px;
    border-radius: 5px;
    border: none;
    background-color: black;
    color: white;
    cursor: pointer;
}
    
    
    
    
    
    </style>
</head>
<body>

<!-- 페이지 헤더바 -->
<div class="header">
    <!-- 헤더바 내용 -->
</div>

<!-- 섹션들 -->
<div class="sections">
    <!-- 첫 번째 섹션 -->
    <section class="section">
        <h2>아이디를 잊으셨나요?</h2>
        <br>
        <hr>
        <br>
        <div class="input-container">
            <input type="text" name="name" placeholder="이름 입력">
            <input type="email" name="email" placeholder="이메일 입력">
        </div>
        <br>
        <button>아이디 찾기</button>
    </section>

    <!-- 두 번째 섹션 -->
    <br>
    <section class="section">
        <h2>비밀번호를 잊으셨나요?</h2>
        <br>
        <hr>
        <br>
        <div class="input-container">
            <input type="text" name="name" placeholder="이름 입력">
            <input type="email" name="email" placeholder="이메일 입력">
        </div>
        <br>
        <button>비밀번호 찾기</button>
    </section>
</div>

</body>
</html>
