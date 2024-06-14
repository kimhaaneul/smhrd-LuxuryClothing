<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!DOCTYPE html>
<html>
<head>

   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>결제시스템</title>
   
   <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/font-awesome.css">

    <link rel="stylesheet" href="${path}/resources/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="${path}/resources/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="${path}/resources/assets/css/lightbox.css">

    <link rel="stylesheet" href="${path}/resources/assets/css/payment.css">
   
   <!--

   TemplateMo 571 Hexashop

   https://templatemo.com/tm-571-hexashop

   -->

</head>
<body>
    <c:set var="prod" value="${sessionScope.prod_detail}"/>
    <c:set var="user" value="${sessionScope.user_result}"/>

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
      
        <!-- 헤더 바 아래에 h1 태그로 주문서 작성/결제 텍스트 추가 -->
    <h1 style="text-align: center;">주문서 작성/결제</h1>

    <!-- 테이블 추가 -->
    <table border="1" align="center" class="fuck">
        <!-- 첫 번째 행 -->
        <tr>
            <td>상품정보</td>
            <td>수량</td>
            <td>상품금액</td>
            <td>상품명</td>
            <td>합계</td>
            <td>배송비</td>
        </tr>
        <!-- 두 번째 행 -->
        <tr>
            <!-- 상품정보 이미지 -->
            <td class="img"><img alt="상품 이미지" src="${path}/resources/assets/images/products/${prod.file_name}"></td>
            <!-- 상품명 -->
            <td>1개</td>
            <!-- 수량 -->
            <td>${prod.prod_price}</td>
            <!-- 상품금액 -->
            <td>${prod.prod_name}</td>
            <!-- 할인/적립 -->
            <td>${prod.prod_price}</td>
            <!-- 합계 -->
            <td>0원</td>
        </tr>
    </table>

    <!-- 두 번의 개행 -->
    <br><br>

    <!-- 추가 정보를 담을 div -->
    <div class="rufwp" style="border: 1px solid black; padding: 10px; position=relative top=200px">
        <!-- 상품의 총 금액을 보여줄 부분 -->
        <span style="float: right;">총 결제금액 : ${prod.prod_price}</span>
        <div style="clear: both;"></div> <!-- float 해제 -->
    </div>
   <br>
   <br>
    <!-- 기존의 나머지 코드는 생략 -->

    <div class="sibal">
        <div class="input-box">
          
                <br>
                <p>주문자 정보</p>
                <br>
 
            <span class="form_element">
                   <input type="checkbox" id="sameCustomer" name="sameCustomer" onclick="checkSame();">
                   <label for="sameCustomer" class="on">회원정보와 동일</label>
                </span><br>
                <label for="주문자이름">주문하시는 분</label>
                <input type="text" id="name" name="name" required="required">
                <br>
                <label for="연락처">연락처</label>
                <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678" required="required">
                <br>
                <label for="이메일">이메일 주소</label>
                <input type="email" id="email" name="email" required="required">
                <br>
                <br>

                <p>배송 정보</p>
                <label for="주문자이름">배송지 입력</label>
                <input type="text" id="deli_addr" name="deli_addr" required>
                <br>
                <label for="주소">수령인</label>
                <input type="text" id="deli_name" name="deli_name" required>
                <br>
                <label for="연락처">수령인 연락처</label>
                <input type="tel" id="deli_phone" name="deli_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                    placeholder="010-1234-5678" required>
                <br>
                <label for="주소">배송 메세지</label>
                <input type="text" id="deli_message" name="deli_message" required>
                <br>
                <br>

                <p>결제 정보</p>

                <label for="pay_method"><input type="radio" id="pay_method" name="pay_method" required="required">카카오페이</label>
                <br>
                
                <div class="bottomrufwp" style="border: 1px solid black; padding: 10px; position=relative top=200px">
        <!-- 상품의 총 금액을 보여줄 부분 -->
        <span style="float: right;">총 결제금액 : ${prod.prod_price}</span>
        <div style="clear: both;"></div> <!-- float 해제 -->
    </div>
                <br>

                <div class="button-container">
                    <button onclick="goBack()">결제취소</button>
                    <button id="pay" disabled="disabled" onclick="requestPay()">결제하기</button>
                </div>
            <!-- </form> -->
        </div>
    </div>
    
    <%@include file ="footer.jsp" %>

    <!-- jQuery -->
    <script src="${path}/resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="${path}/resources/assets/js/popper.js"></script>
    <script src="${path}/resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="${path}/resources/assets/js/owl-carousel.js"></script>
    <script src="${path}/resources/assets/js/accordions.js"></script>
    <script src="${path}/resources/assets/js/datepicker.js"></script>
    <script src="${path}/resources/assets/js/scrollreveal.min.js"></script>
    <script src="${path}/resources/assets/js/waypoints.min.js"></script>
    <script src="${path}/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="${path}/resources/assets/js/imgfix.min.js"></script> 
    <script src="${path}/resources/assets/js/slick.js"></script> 
    <script src="${path}/resources/assets/js/lightbox.js"></script> 
    <script src="${path}/resources/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="${path}/resources/assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

        function goBack() {
			window.history.back();
		}
        
        function checkSame() {
            // 체크박스가 체크되었는지 확인
            if ($('input:checkbox[id="sameCustomer"]').is(":checked") == true){
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
        
        $(function(){
            $("input").keyup(function(){
                var name=$("#name").val();
                var phone=$("#phone").val();
                var email=$("#email").val();
                var deli_addr=$("#deli_addr").val();
                var deli_name=$("#deli_name").val();
                var deli_phone=$("#deli_phone").val();
                var deli_message=$("#deli_message").val();
                var pay_method=$("#pay_method").val();
                
                
                if(name != "" && phone != "" && email != "" && deli_addr != "" && deli_name != "" && deli_phone != "" && deli_message != "" && pay_method != ""){
                    // 비밀번호가 일치하는지 확인
                        $("#pay").removeAttr("disabled"); // 회원가입 버튼 활성화
                } else {
                    $("#pay").attr("disabled", "disabled"); // 모든 필수 입력 칸이 채워지지 않은 경우 회원가입 버튼 비활성화
                }
                
            });
        });
        
        IMP.init("imp03167257");
		
        function requestPay() {
        	
          IMP.request_pay({
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: "test_fa${prod.prod_id}",
            name: "${prod.prod_name}",
            amount: ${prod.prod_price},
            popup: true,
            buyer_name: "${user.user_name}",
            buyer_tel: "${user.user_phone}",
            buyer_email: "${user.user_email}",
            buyer_addr: "${user.user_addr}",
          }, function (rsp) { 
             // callback
              if (rsp.success) {
                 console
                 var user_id = "${user.user_id}";
                 var prod_price = "${prod.prod_price}";
                 var pay_method = rsp.pay_method;
                 var paid_amount = rsp.paid_amount;
                 var prod_id = "${prod.prod_id}";
                 var deli_addr = $("#deli_addr").val();
                 var deli_name = $("#deli_name").val();
                 var deli_phone = $("#deli_phone").val();
                 var deli_message = $('#deli_message').val();
                 var status = rsp.status;
                 
                 console.log(user_id);
                 console.log(prod_price);
                 console.log(paid_amout);
                 console.log(status);
                 console.log(pay_method);
                 console.log(prod_id);
                 console.log(deli_addr);
                 console.log(deli_phone);
                 console.log(deli_name);
                 
                   var paymentData = {
                         user_id: user_id,
                         prod_price: prod_price,
                        pay_method: pay_method,
                        paid_amount: paid_amount,
                         prod_id: prod_id,
                         deli_addr: deli_addr,
                         deli_name: deli_name,
                         deli_phone: deli_phone,
                         deli_message : deli_message,                         
                        status: status
                     // 필요한 경우 다른 정보도 추가 가능
                      };
                   /* const obj = JSON.stringify(paymentData); */
                   console.log(paymentData);
                   $.ajax({
                       url: 'paySuccess.do', // 서버로 전송할 URL
                       type: 'POST', // 전송 방식
                       data: paymentData, // 전송할 데이터
                       // dataType: 'json', // 전송 데이터 형식
                       success: function(response) {
                           console.log('Data sent successfully:', response);
                           window.location.href = "payEndPage.do"
                           // 추가적인 처리 가능
                       },
                       error: function(xhr, status, error) {
                           console.error('Error occurred while sending data:', error);
                           // 에러 처리
                       }
                   });
              } else {
                  console.log(rsp);
              }
          });
        }
   </script>
</body>
</html>