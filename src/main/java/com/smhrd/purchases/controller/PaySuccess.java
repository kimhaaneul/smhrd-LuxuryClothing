package com.smhrd.purchases.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDTO;
import com.smhrd.purchases.model.PurchasesDAO;
import com.smhrd.purchases.model.PurchasesDTO;
import com.smhrd.purchases.model.PurchasesRecordDTO;

public class PaySuccess implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("PaySuccess 방문");
		
		// JSON 데이터를 받아오기
		String user_id  = request.getParameter("user_id");
		String prod_price  = request.getParameter("prod_price");
		String pay_method  = request.getParameter("pay_method");
		String paid_amount  = request.getParameter("paid_amount");
		String prod_id  = request.getParameter("prod_id");
		String deli_addr  = request.getParameter("deli_addr");
		String deli_name  = request.getParameter("deli_name");
		String deli_phone  = request.getParameter("deli_phone");
		String deli_message  = request.getParameter("deli_message");
		String status  = request.getParameter("status");
		
		
		System.out.println(status);
		
		PurchasesDTO dto = new PurchasesDTO();
		dto.setUser_id(user_id);
		dto.setTotal_amount(prod_price);
		dto.setPay_method(pay_method);
		dto.setPaid_amount(paid_amount);
		dto.setProd_id(prod_id);
		dto.setDeli_addr(deli_addr);
		dto.setRecipient_name(deli_name);
		dto.setRecipient_phone(deli_phone);
		dto.setDeli_message(deli_message);
		dto.setOrder_status(status);
		
		HttpSession session = request.getSession();
		
		PurchasesDAO dao = new PurchasesDAO();
		int res = dao.purchaseRecord(dto);
		
		if (res > 0) {
            System.out.println("결제 성공");
            
            int nRes= dao.setNo(prod_id);
            if(nRes > 0) {
            	System.out.println("판매 여부 N 변경 성공");
            }else {
            	System.out.println("판매 여부 N 변경 실패");
            }
            
            PurchasesRecordDTO payEndDto = dao.payEndDto(prod_id);
            session.setAttribute("payEndDto", payEndDto);
        } else {
        	System.out.println("결제 실패");
        }
		
		return null;
		
	}

}

