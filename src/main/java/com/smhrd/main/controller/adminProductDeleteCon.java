package com.smhrd.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class adminProductDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자  adminProductDeleteCon 검색 : admin_products.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();
		
		String arr = request.getParameter("delete_id");
		System.out.println("받아온 데이터 : " + arr);
		String[] productId = arr.split(",");
		
		for (int i = 0; i < productId.length; i++) {
			dto.setProd_id(productId[i]);
			System.out.println("adminProductDeleteCon Prod_id : " + dto.getProd_id());
			dao.adminProductDeleteCon(dto);
		}
		
		System.out.println("adminProductDeleteCon 방문 ");
				
		return "redirect:/adminProducts.do";
	}

}
