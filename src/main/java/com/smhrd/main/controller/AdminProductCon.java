package com.smhrd.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class AdminProductCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자  AdminProductCon : admin_products.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		
		// 초기 화면임으로 dao 값은 없음 !
		List<ProductsDTO> result = dao.selectSearchProducts(null);
		int count = dao.selectSearchProductsCount(null);
		
		if (result != null) {
			System.out.println("관리자 상품 전체조회 성공");
			HttpSession session = request.getSession();
			session.setAttribute("result", result);
			session.setAttribute("count", count);
		} else {
			System.out.println("관리자 상품 전체조회 실패");
		}
		
		return "admin_products";
	}

}
