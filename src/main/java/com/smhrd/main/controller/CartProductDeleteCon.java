package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;
import com.smhrd.users.model.CartDAO;
import com.smhrd.users.model.CartDTO;

public class CartProductDeleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("관리자  CartProductDeleteCon 검색 :carts.jsp");
		
		CartDAO dao = new CartDAO();
		CartDTO dto = new CartDTO();
		
		String userId = request.getParameter("deleteUser_id");
		String arr = request.getParameter("deleteProd_id");
		System.out.println("받아온 데이터 : " + arr);
		String[] productId = arr.split(",");
		
		for (int i = 0; i < productId.length; i++) {
			dto.setProd_id(productId[i]);	// 상품 id
			dto.setUser_id(userId);			// 회원 id
			System.out.println("CartProductDeleteCon Prod_id : " + dto.getProd_id());
			System.out.println("CartProductDeleteCon user_Id : " + dto.getUser_id());
			dao.removeFromCart(dto);
		}
		
		System.out.println("CartProductDeleteCon 방문 ");
				
		return "redirect:/carts.do";
	}

}
