package com.smhrd.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.model.UserDTO;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class CsgnOfficerCrownCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("CsgnOfficerCrownCon 방문");

		HttpSession session = request.getSession();
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();

		UserDTO user_dto = (UserDTO) (session.getAttribute("user_result"));
		String id = user_dto.getUser_id();
		dto.setUser_id(id);
		System.out.println("CsgnOfficerCrownCon user_id : " + dto.getUser_id());

		// 마이페이지 위탁상품 리스트와 개수
		List<ProductsDTO> result = dao.selectMyProducts(dto); 
		int count = dao.selectMyProductsCount(dto);
		 
		if (result != null) { 
			 System.out.println("마이페이지 위탁상품관리 전체조회 성공"); 
			 session.setAttribute("result", result);
			 session.setAttribute("count", count); 
		} else {
			 System.out.println("마이페이지 위탁상품관리 전체조회 실패"); }
		 

		return "csgnOfficerCrown";
	}

}
