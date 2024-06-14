package com.smhrd.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class adminProductUpdateCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자  adminProductUpdateCon 검색 : admin_products.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();
		
		dto.setProd_id(request.getParameter("data_id"));
		dto.setProd_grade(request.getParameter("data_grade"));
		dto.setProd_name(request.getParameter("data_name"));
		dto.setProd_price(request.getParameter("data_price"));
		
		System.out.println("adminProductUpdateCon Prod_id : " + dto.getProd_id());
		System.out.println("adminProductUpdateCon Prod_name : " + dto.getProd_name());
		System.out.println("adminProductUpdateCon Prod_grade : " + dto.getProd_grade());
		System.out.println("adminProductUpdateCon Prod_price : " + dto.getProd_price());
		System.out.println("adminProductUpdateCon 방문 ");
		
		int result = dao.adminProductUpdate(dto);
				
		return "redirect:/adminProducts.do";
	}

}
