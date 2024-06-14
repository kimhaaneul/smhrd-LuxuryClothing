package com.smhrd.purchases.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.main.model.UserDTO;
import com.smhrd.purchases.model.PurchasesDAO;
import com.smhrd.purchases.model.PurchasesRecordDTO;

public class OrderHistoryCon implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. user_id를 사용해서 DB에서 결제 내역을 PurchasesDTO로 꺼내온다.
		// 2. 꺼내온 PurchasesDTO에서 prod_id를 가지고 ProductsDTO를 가져와 사용
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("user_result");
		String user_id = userDto.getUser_id();
		
		PurchasesDAO dao = new PurchasesDAO();
		List<PurchasesRecordDTO> payRecord = dao.getRecord(user_id);
		session.setAttribute("payRecord", payRecord);
		
		return "orderHistory";

	}

}

