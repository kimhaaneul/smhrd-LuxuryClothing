package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.main.model.UserDAO;
import com.smhrd.users.model.CartDAO;
import com.smhrd.users.model.CartDTO;

public class CartListInsertCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 2. 요청 데이터 꺼내오기(6개)
		String user_id = request.getParameter("user_id");
		String prod_id = request.getParameter("prod_id");
		
		CartDAO dao = new CartDAO();
		CartDTO dto = new CartDTO();
		
		dto.setUser_id(user_id);
		dto.setProd_id(prod_id);
		
		System.out.println("luxury CartListInsertCon : join.jsp");
		System.out.println("luxury CartListInsertCon User_id : " + dto.getUser_id());
		System.out.println("luxury CartListInsertCon Prod_id : " + dto.getProd_id());
		int res = dao.CartListInsert(dto);
		
		return "redirect:/carts.do";
	}

}
