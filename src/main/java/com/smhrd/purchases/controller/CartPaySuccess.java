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
import com.smhrd.users.model.CartDAO;
import com.smhrd.users.model.CartDTO;

public class CartPaySuccess implements Controller {

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
		String prodsName = request.getParameter("prodsName");
		
		System.out.println(status);
		HttpSession session = request.getSession();
		String arr = (String)session.getAttribute("arr");
		
		String[] productId = arr.split(",");
		
		
		PurchasesDTO dto = new PurchasesDTO();
		CartDTO cartDto = new CartDTO();
		
		dto.setUser_id(user_id);
		dto.setTotal_amount(prod_price);
		dto.setPay_method(pay_method);
		dto.setPaid_amount(paid_amount);
		dto.setProd_id(productId[0]);
		dto.setDeli_addr(deli_addr);
		dto.setRecipient_name(deli_name);
		dto.setRecipient_phone(deli_phone);
		dto.setDeli_message(deli_message);
		dto.setOrder_status(status);
		
		
		PurchasesDAO dao = new PurchasesDAO();
		CartDAO cartDao = new CartDAO();
		int res = dao.purchaseRecord(dto);
		
		if (res > 0) {
            System.out.println("결제 성공");
            
            // 각 상품 판매여부 N으로 변경
            for (int i = 0; i < productId.length; i++) {

            	int nRes= dao.setNo(productId[i]);
            	
    			if(nRes > 0) {
    				System.out.println("판매 여부 N 변경 성공");
    			}else {
    				System.out.println("판매 여부 N 변경 실패");
    			}
    		}
            
            PurchasesRecordDTO payEndDto = dao.payEndDto(productId[0]);
            payEndDto.setProd_name(prodsName);
            session.setAttribute("payEndDto", payEndDto);
            
            for (int i = 0; i < productId.length; i++) {
    			cartDto.setProd_id(productId[i]);	// 상품 id
    			cartDto.setUser_id(user_id);			// 회원 id
    			System.out.println("CartPaySuccess Prod_id : " + dto.getProd_id());
    			System.out.println("CartPaySuccess user_Id : " + dto.getUser_id());
    			cartDao.removeFromCart(cartDto);
    		}
        } else {
        	System.out.println("결제 실패");
        }
		
		return null;
		
	}

}

