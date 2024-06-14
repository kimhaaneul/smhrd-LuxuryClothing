package com.smhrd.products.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductImageDTO;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class ProductListCon implements Controller {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("luxury ProductListCon : product_list.jsp");
		
		// 4. DAO 불러오기
		ProductsDAO dao = new ProductsDAO();
		// 5. DAO에 있는 로그인 기능 사용
		List<ProductImageDTO> result = dao.selectImageMain();
		int count = dao.selectImageMainCount();
		
//		System.out.println("ProductsSearchCon result 값 받음 ");
		
		if (result != null) {
			System.out.println("상품 전체조회 성공");
			// session 공간 불러오기
			HttpSession session = request.getSession();
			// session에 데이터 담기
			session.setAttribute("result", result);
			session.setAttribute("count", count);
		// 6-2. 로그인 실패해도 main.jsp
		} else {
			System.out.println("상품 전체조회 실패");
		}
		// 7. main.jsp
		return "product_list";
		
	}
}
