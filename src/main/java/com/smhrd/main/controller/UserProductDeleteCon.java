package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class UserProductDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자  UserProductDeleteCon 검색 : csgnOfficerCrown.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();
		
		String del = request.getParameter("delete_id");
		
		dto.setProd_id(del);
		System.out.println("UserProductDeleteCon Prod_id : " + dto.getProd_id());
		// 유저 판매중단요청을 관리자 상품 판매중단요청으로도 사용함!
		// 단 유저는 하나씩 처리하는 정도
		dao.adminProductDeleteCon(dto);
		
		System.out.println("UserProductDeleteCon 방문 ");
				
		return "redirect:/csgnOfficerCrown.do";
	}

}
