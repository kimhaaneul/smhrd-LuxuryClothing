package com.smhrd.products.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;


public class ProductsSearchCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 2. 요청 데이터 꺼내오기
		String rating = request.getParameter("rating");
		String kind = request.getParameter("kind");
		String amount = request.getParameter("amount");
		String searchInput = request.getParameter("searchInput");
		// 구매희망가격 뽑아오기
		String[] splitValues = amount.split(" ~ ");
		String amountMin = splitValues[0];
		String amountMax = splitValues[1];
		
		// 3. 데이타 하나로 묶어주기(MemberDTO)
		ProductsDTO dto = new ProductsDTO();
		dto.setProd_grade(rating);
		dto.setProd_category(kind);
		dto.setProd_priceMin(amountMin);
		dto.setProd_priceMax(amountMax);
		dto.setProd_name(searchInput);
		
		System.out.println("ProductsSearchCon Prod_grade : " + dto.getProd_grade());
		System.out.println("ProductsSearchCon Prod_category : " + dto.getProd_category());
		System.out.println("ProductsSearchCon Prod_priceMin : " + dto.getProd_priceMin());
		System.out.println("ProductsSearchCon Prod_priceMax : " + dto.getProd_priceMax());
		System.out.println("ProductsSearchCon Prod_name : " + dto.getProd_name());
		System.out.println("ProductsSearchCon 방문 ");
		
		// 4. DAO 불러오기
		ProductsDAO dao = new ProductsDAO();
		// 5. DAO에 있는 로그인 기능 사용
		ProductsDTO serch = dto;
		
		List<ProductsDTO> result = dao.selectProductsAll(dto);
		int count = dao.selectProductsAllCount(dto);
		
		if (result != null) {
			System.out.println("상품조회 성공");
			int num = 0;
			for (int i = 0; i < result.size(); i++) {
				num++;
				System.out.println(num+"번 ProductsSearchCon 값 받음 "+ result.get(i));
			}
			// session 공간 불러오기
			HttpSession session = request.getSession();
			// session에 데이터 담기
			session.setAttribute("result", result);
			session.setAttribute("count", count);
			session.setAttribute("serch", serch);
		// 6-2. 로그인 실패해도 main.jsp
		} else {
			System.out.println("상품조회 실패");
		}
		// 7. main.jsp
		return "product_list";
		
		
	}

}
