package com.smhrd.main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.admin.controller.SearchUserCon;
import com.smhrd.admin.controller.selectAllCon;
import com.smhrd.products.controller.CartPayPageCon;
import com.smhrd.products.controller.CsgnApplyCon;
import com.smhrd.products.controller.CsgnApplyPageCon;
import com.smhrd.products.controller.CsgnGuideCon;
import com.smhrd.products.controller.PayPageCon;
import com.smhrd.products.controller.ProductDetailCon;
import com.smhrd.products.controller.ProductListCon;
import com.smhrd.products.controller.ProductsImageSelectCon;
import com.smhrd.products.controller.ProductsSearchCon;
import com.smhrd.users.controller.CartController;
import com.smhrd.users.controller.CartsPage;
import com.smhrd.purchases.controller.PaySuccess;
import com.smhrd.purchases.controller.CartPaySuccess;
import com.smhrd.purchases.controller.OrderHistoryCon;
import com.smhrd.purchases.controller.PayEndPageCon;

@WebServlet(urlPatterns={"*.do", ""}) // *.do ㅣ .do로 : 끝나는 모든 요청
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// HashMap 자료구조
	// key - value 형태로 데이터(자바 객체를) 저장하는 자료 구조(딕셔너리랑 비슷)
	// 처음 선언한 자료형만 저장할 수 있다.
	// 자료 검색속도가 빠름
	// HashMap<key의 자료형, value의 자료형>
	private HashMap<String, Controller> handlerMapping = new HashMap<String, Controller>();
	
	
	// Servlet이 메모리에 할당될때 실행되는 메서드
	// 첫 번째 요청이 들어와서 Servlet이 메모리에 생성될때 단 한번만 실행
	@Override
	public void init() throws ServletException {
		
		// 처음 서버 구동하면 메인 페이지로 이동
		handlerMapping.put("/", new MainCon() );
		
		// HashMap에 URLMapping을 키 값으로 하고, POJO(Controller)를 Value로 하도록 세팅
		// .put (key, value);
		
		// 메인 및 회원 관련
		handlerMapping.put("/main.do", new MainCon() );
		handlerMapping.put("/login.do", new LoginCon() );
		handlerMapping.put("/join.do", new JoinCon() );
		handlerMapping.put("/JoinOut.do", new JoinOutCon() );
		handlerMapping.put("/user_list.do", new selectAllCon());
		handlerMapping.put("/searchUser.do", new SearchUserCon());
		handlerMapping.put("/joinpage.do", new JoinPageCon());
		handlerMapping.put("/logo.do", new MainCon());
		handlerMapping.put("/loginpage.do", new LoginPageCon());
		handlerMapping.put("/logOutCon.do", new LogOutCon());
		handlerMapping.put("/JoinOutCon.do", new JoinOutPage());
		handlerMapping.put("/question.do", new questionCon());
		
		// 회원
		handlerMapping.put("/userModifyPage.do", new UserModifyPageCon());
		handlerMapping.put("/userModifyEnter.do", new UserModifyEnterCon());
		handlerMapping.put("/userModify.do", new UserModifyCon());
		handlerMapping.put("/Rsidpw.do", new RsidpwCon());
		handlerMapping.put("/changePWPage.do", new changePWCon());
		handlerMapping.put("/changePW.do", new changePWController());

		// 장바구니
		handlerMapping.put("/carts.do", new CartController());	// 장바구니 페이지 
		handlerMapping.put("/cartPickList.do", new CartListInsertCon());	// 장바구니에 넣기
		handlerMapping.put("/cartProductDelete.do", new CartProductDeleteCon());	// 장바구니에 선택항목 제거
		
		// 상품
		handlerMapping.put("/product_list.do", new ProductListCon() );
		handlerMapping.put("/product_search.do", new ProductsSearchCon() );
		handlerMapping.put("/csgnApplyPage.do", new CsgnApplyPageCon());
		handlerMapping.put("/csgnApply.do", new CsgnApplyCon());
		handlerMapping.put("/consignmentGuide.do", new CsgnGuideCon());
		
		handlerMapping.put("/product_detail.do", new ProductDetailCon());
		handlerMapping.put("/payment.do", new PayPageCon());
		handlerMapping.put("/yongImg.do", new YongImgCon());
		
		// 상품 이미지
//		handlerMapping.put("/ProductImageUpload.do", new ProductsImageUploadCon() );	// 이미지 업로드 테스트용
		handlerMapping.put("/test_ImageUpload.do", new TEST_ImageUpload() );
		handlerMapping.put("/ProductSelect.do", new ProductsImageSelectCon() );
		
		// 관리자단
		handlerMapping.put("/adminUsers.do", new AdminUserCon() );
		handlerMapping.put("/adminSearchProducts.do", new AdminSearchProductsCon() );
		handlerMapping.put("/adminProducts.do", new AdminProductCon() );
		handlerMapping.put("/adminProductUpdate.do", new adminProductUpdateCon() );	// 관리자 상품관리에서 수정버튼 누르면 해당 내용으로 업데이트
		handlerMapping.put("/adminProductDelete.do", new adminProductDeleteCon() );	// 관리자 상품관리에서 삭제버튼 누르면 해당 상품 삭제

		// 결제
		handlerMapping.put("/paySuccess.do", new PaySuccess());
		handlerMapping.put("/payEndPage.do", new PayEndPageCon());
		handlerMapping.put("/orderHistory.do", new OrderHistoryCon());
		handlerMapping.put("/cartPayPage.do", new CartPayPageCon());
		handlerMapping.put("/cartPaySuccess.do", new CartPaySuccess());
		
		// 마이페이지
		handlerMapping.put("/csgnOfficerCrown.do", new CsgnOfficerCrownCon());	// 위탁상품관리
		handlerMapping.put("/userMyProductDelete.do", new UserProductDeleteCon());	// 위탁상품관리
		handlerMapping.put("/userMyProductSellUpdate.do", new UserMyProductSellUpdate());	// 위탁상품관리
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청구분
		//http://localhost:8081/LuxuryClothing/joinpage.do
		
		// MessageSystem/login.do
		String uri = request.getRequestURI();
		System.out.println(uri);
		// MessageSystem
		String cpath = request.getContextPath();
		
		// login.do
		// 문자열 슬라이싱
		String mapping = uri.substring( cpath.length() );
		System.out.println("luxury MainController : " + mapping);
		
		// =========================================================================
		String nextPage = null;
		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		Controller con = null;
		con = handlerMapping.get(mapping);
		
		if(con != null) {
			nextPage = con.execute(request, response);
		}
		
		//=====================================================================================
		
		// 3. 페이지 이동
		if(nextPage != null) {
			
			// 페이지 이동하는 redirect / forward는 반드시 한번만 실행되어야함.
			// 만약 redirect를 하고 싶다면, UrlMapping 앞에 "redirect:/" 문자열 붙이자 !
			if (nextPage.contains("redirect:/")) {
				response.sendRedirect(nextPage.split(":/")[1]);
			} else {
				// jsp 이동시 redirect 불가, 무조건 forward만 사용가능
				String prefix = "WEB-INF/views/"; // 접두사(앞에 붙는 경로)
				String suffix = ".jsp"; // 접미사(뒤에 붙는 경로)
				
				RequestDispatcher rd = request.getRequestDispatcher(prefix + nextPage + suffix);
				System.out.println(prefix + nextPage + suffix);
				
				rd.forward(request, response);
			}
			
		}
	}

}
