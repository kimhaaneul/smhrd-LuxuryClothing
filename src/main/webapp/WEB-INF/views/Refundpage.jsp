<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="detailedInquiry.css">
    <title>환불/입금 내역</title>
    <style>
    body {
    font-family: Arial, sans-serif;
}

hr {
    border: 0;
    height: 1px;
    background-color: #000;
}

.container {
    width: 1100px;

}

.button-container {
    margin-top: 10px;
    justify-content: space-around;
    border-radius: 10px;
}

.button-container button {
    background-color: #000000;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    color: white;
}

.button-container button:hover {
    background-color: #ffffff;
    color: rgb(0, 0, 0);
}

.dateBox {
    border: 1px solid #ccc;
    display: inline-block;
    height: 30px;
    width: 150px;
    margin: 0 10px;
    vertical-align: middle;
}

.dateBox input[type="date"] {
    height: 100%;
    width: 70%;
    border: none;
    outline: none;
    float: left;
    padding: 0 5px;
}

.dateBox button {
    height: 100%;
    width: 30%;
    background-color: #ddd;
    border: none;
    cursor: pointer;
    float: left;

}

p {
    font-weight: bold;
    text-align: left;
    font-size: 18px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table tr {
    border-bottom: 1px solid #000;

}

table td {
    border: none;
    text-align: center;
    
}


table td img {
    width: 150px;
    height: 150px;
    display: block;
    margin: 0 auto;
}
    </style>
</head>

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
            <br><br><br>
            <p>환불/입금 내역</p>
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


            <p id="orderCount">환불/입금 내역</p>
            <hr>
            <div class="table-container">
                <table>
                    <tr>
                        <!-- <td style="width: 100px;"><input type="checkbox" id="productCheckbox"></td> -->
                        <td style="width: 220px;">날짜/주문번호</td>
                        <td style="width: 220px;">상품명/옵션</td>
                        <td style="width: 220px;">상품금액/수량</td>
                        <td style="width: 220px;">처리상태</td>
                        <td style="width: 220px;">확인/리뷰</td>
                    </tr>
                    <!-- 아래 각 행에 추가된 가로선을 표시 -->


                    <tr>

                        <!-- <td><input type="checkbox" id="productCheckbox"></td> -->
                        <td>2022-03-01<br>주문번호: 123456</td>
                        <td>
                            <img src="https://via.placeholder.com/150" alt="상품 이미지">
                            <p class="product-name">

                        </td>
                        <td>
                            <p>상품명 / 옵션내역</p>
                            <br>
                            <p>₩50,000</p>
                            <p>2개</p>
                        </td>
                        <td>처리완료</td>
                        <td>
                            <p>확인완료</p>
                            <p>리뷰작성완료</p>
                        </td>
                    </tr>
                    <tr>
                        <!-- <td><input type="checkbox" id="productCheckbox"></td> -->
                        <td>2022-03-01<br>주문번호: 123456</td>
                        <td>
                            <img src="https://via.placeholder.com/150" alt="상품 이미지">
                            <p class="product-name">

                        </td>
                        <td>
                            <p>상품명 / 옵션내역</p>
                            <br>
                            <p>₩50,000</p>
                            <p>2개</p>
                        </td>
                        <td>처리완료</td>
                        <td>
                            <p>확인완료</p>
                            <p>리뷰작성완료</p>
                        </td>
                    </tr>
                </table>
            </div>

            <button onclick="goBack()">돌아가기</button>
    </div>
    </div>


    <script>
        function goBack() {
            window.history.back();
        }

        // 주문 개수를 표시하는 코드
        document.getElementById('orderCount').innerText = '환불/입금 내역 (' + document.querySelectorAll('.order-details').length + '개)';

    </script>
</body>

</html>