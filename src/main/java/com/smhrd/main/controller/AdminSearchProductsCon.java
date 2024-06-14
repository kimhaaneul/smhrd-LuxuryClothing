package com.smhrd.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.products.model.ProductImageDTO;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class AdminSearchProductsCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자  AdminSearchProductsCon 검색 : admin_products.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO serch = new ProductsDTO();
		
		String rating = request.getParameter("rating");
		String kind = request.getParameter("kind");
		String amount = request.getParameter("amount");
		String searchInput = request.getParameter("searchInput");
		String productYn = request.getParameter("prod_yn");
		String[] splitValues = amount.split(" ~ ");
		String amountMin = splitValues[0];
		String amountMax = splitValues[1];
		
		ProductsDTO dto = new ProductsDTO();
		dto.setProd_grade(rating);
		dto.setProd_category(kind);
		dto.setProd_priceMin(amountMin);
		dto.setProd_priceMax(amountMax);
		dto.setProd_name(searchInput);
		dto.setProd_yn(productYn);
		
		System.out.println("ProductsSearchCon Prod_grade : " + dto.getProd_grade());
		System.out.println("ProductsSearchCon Prod_category : " + dto.getProd_category());
		System.out.println("ProductsSearchCon Prod_priceMin : " + dto.getProd_priceMin());
		System.out.println("ProductsSearchCon Prod_priceMax : " + dto.getProd_priceMax());
		System.out.println("ProductsSearchCon Prod_name : " + dto.getProd_name());
		System.out.println("ProductsSearchCon Product_yn : " + dto.getProd_yn());
		System.out.println("ProductsSearchCon 방문 ");
		
		
		List<ProductsDTO> result = dao.selectSearchProducts(dto);
		int count = dao.selectSearchProductsCount(dto);
		
		
		if (result != null) {
			System.out.println("관리자 상품 검색조회 성공");
			HttpSession session = request.getSession();
			session.setAttribute("result", result);
			session.setAttribute("count", count);
		} else {
			System.out.println("관리자 상품 검색조회 실패");
		}
		
		return "admin_products";
	}

}
