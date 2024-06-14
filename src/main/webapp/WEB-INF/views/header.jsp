<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/css/font-awesome.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/owl-carousel.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/lightbox.css">
</head>
<body>
   <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                   
                        
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                        <c:if test="${user_result !=null}">
                       		<li><a href="main.do">${user_result.user_id} 님 환영합니다.</a></li>
                        </c:if>
                        <c:if test="${user_result == null}">
                       		<li><a href="main.do">메인으로</a></li>
                        </c:if>
                            <!-- <li class="scroll-to-section"><a href="#top" class="active">메인</a></li> -->
                            <!-- <li class="scroll-to-section"><a href="#men">남성의류</a></li>
                            <li class="scroll-to-section"><a href="#women">여성의류</a></li> -->
                            <li class="submenu">
                                <a class="list" href="javascript:;">위탁서비스</a>
                                <ul>
                                    <li><a href="consignmentGuide.do">위탁안내 사항</a></li>
                                    <c:if test="${user_result !=null}">
                                    	<li><a href="csgnApplyPage.do">위탁판매 신청</a></li>
                                    </c:if>
                                    <c:if test="${user_result ==null}">
                                    	<li>
	                                    	<a href="loginpage.do">위탁판매 신청</a>
                                    	</li>
                                    </c:if>
                                    
                                </ul>
                            
                            </li>
                            <li class="submenu">
                                <a href="javascript:;">상품목록</a>
                                <ul>
                                    <li><a href="product_list.do">전체</a></li>
                                    <li><a href="#">모자</a></li>
                                    <li><a href="#">상의</a></li>
                                    <li><a href="#">하의</a></li>
                                    <li><a href="#">신발</a></li>
                                    <li><a href="#">악세서리</a></li>
                                </ul>
                            </li>
                            	<c:if test="${user_result != null}">
		                            <li class="submenu">
		                                <a href="javascript:;">마이페이지</a>
		                                <ul>
		                                    <li><a href="userModifyPage.do">회원정보수정</a></li>
		                                    <li><a href="csgnOfficerCrown.do">위탁상품관리</a></li>
		                                    <li><a href="orderHistory.do">주문내역조회</a></li>
		                                    <li><a rel="nofollow" href="#" target="_blank">입금 조회 및 환불</a></li>
		                                	<li class="scroll-to-section"><a href="JoinOutCon.do">회원탈퇴</a></li>
		                                </ul>
		                            </li>
		                            <li class="submenu2">
		                            <input type="hidden" id="user_id" name="user_id" value="${user_result.user_id}">
		                            	<a href="carts.do">장바구니</a>
		                            </li>
		                        </c:if>
		                    <c:if test="${user_result == null}">
	                            <li class="submenu3">
	                            	<a href="loginpage.do">로그인</a>
	                            </li>
	                            <li class="submenu3">
	                            	<a href="#">/</a>
	                            </li>
	                            <li class="submenu3">
	                            	<a href="joinpage.do">회원가입</a>
	                            </li>
	                        </c:if>
	                        <c:if test="${user_result != null}">
								<li class="submenu3"><a href="logOutCon.do">로그아웃</a></li>
								<c:if test="${user_result.user_id != 'admin'}">
									<li class="submenu3"><a href="#">/</a></li>
								</c:if>
							</c:if>
							<!-- 빈 <li> 요소 추가 -->
							<li class="submenu3"></li>
	                        <li class="scroll-to-section">
	                        <c:if test="${user_result.user_id != 'admin'}">
	                        	<a href="question.do">고객센터</a>
	                        </c:if>
	                        <c:if test="${user_result.user_id == 'admin'}">
		                        <li class="submenu">
		                        	<a href="javascript:;">관리자 권한</a>
		                           	<ul>
	                                    <li><a href="adminUsers.do">회원관리</a></li>
	                                    <li><a href="adminProducts.do">상품관리</a></li>
	                                </ul>
	                            </li>
	                        </c:if>
	                        </li>
                        </ul>        
              <!--      <a class='menu-trigger'>
                            <span>Menu</span>
                        </a> -->
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
</body>
</html>