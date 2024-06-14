<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/update_modify.css">
</head>

<%@include file ="header.jsp" %>

<body>
    <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <h1>비밀번호 변경</h1>
        <br>
        <form action="changePW.do" method="post">
        <input type="hidden" id="user_id" name="user_id" value="${user_result.user_id}">
            <table>
                <tr>
                    <th>새 비밀번호</th>
                    <td><input required="required" type="password" name="newPassword" id="newPassword"
                            placeholder="새 비밀번호를 입력하세요"></td>
                </tr>
                <tr>
                    <th>새 비밀번호 확인</th>
                    <td><input required="required" type="password" name="confirmPassword" id="confirmPassword"
                            placeholder="새 비밀번호를 다시 입력하세요"></td>
                </tr>
            </table>
            <button id="goBack" type="button" border-radius="10px">돌아가기</button>
            <button type="submit" onclick="showAlert()">비밀번호 변경</button>
        </form>
    </div>

    <%@include file="footer.jsp"%>

    <script type="text/javascript">
        const goBack = document.getElementById("goBack");

        goBack.addEventListener("click", function () {
            window.location.href = "main.do"
        });

        $(function () {
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function () {
                var newPassword = $("#newPassword").val();
                var confirmPassword = $("#confirmPassword").val();

                if (newPassword != "" && confirmPassword != "") {
                    // 비밀번호가 일치하는지 확인
                    if (newPassword == confirmPassword) {
                        $("#alert-success").show(); // 비밀번호 일치 알림 보이기
                        $("#alert-danger").hide(); // 비밀번호 불일치 알림 숨기기
                        $("button[type='submit']").removeAttr("disabled"); // 비밀번호 변경 버튼 활성화
                    } else {
                        $("#alert-success").hide(); // 비밀번호 일치 알림 숨기기
                        $("#alert-danger").show(); // 비밀번호 불일치 알림 보이기
                        $("button[type='submit']").attr("disabled", "disabled"); // 비밀번호 변경 버튼 비활성화
                    }
                } else {
                    $("button[type='submit']").attr("disabled", "disabled"); // 모든 필수 입력 칸이 채워지지 않은 경우 비밀번호 변경 버튼 비활성화
                }
            });
        });

        function showAlert() {
            // 버튼 클릭 시 비밀번호 변경 완료 안내창 표시
            window.alert("비밀번호가 성공적으로 변경되었습니다.");
        }
    </script>
</body>
</html>
