package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class UserMyProductSellUpdate implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("관리자  UserMyProductSellUpdate 검색 : admin_products.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();
		
		dto.setProd_id(request.getParameter("data_id"));
		
		System.out.println("UserMyProductSellUpdate Prod_id : " + dto.getProd_id());
		System.out.println("UserMyProductSellUpdate 방문 ");
		
		dao.userMyProductSellUpdate(dto);
				
		return "redirect:/csgnOfficerCrown.do";
	}

}
