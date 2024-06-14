package com.smhrd.users.controller;

import com.smhrd.main.controller.Controller;
import com.smhrd.users.model.CartDAO;
import com.smhrd.users.model.CartDTO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartOutCon implements Controller {
	
	CartDAO cartDAO = new CartDAO();
	CartDTO cartDTO = new CartDTO();
	
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		 
		// 세션에서 사용자 정보 가져오기
	        HttpSession session = request.getSession();
	        String userId = request.getParameter("user_id");
	        String prodId = request.getParameter("prod_id");
	        
	        cartDTO.setUser_id(userId);
	        cartDTO.setProd_id(prodId);
	        System.out.println("유저 id : "+cartDTO.getUser_id());
	        String url = null;
	        if (userId == null || userId.isEmpty()) {
	        	url = "carts";
	        }
	        
	        int removeCart = cartDAO.removeFromCart(cartDTO);
	        
	        if(removeCart>0) {
	        	System.out.println("성공");
	        	return "carts";
	        }
	        else {
	        	System.out.println("실패");
	        	url = "main";
	        	return url;
	        	
	        }
	 }

}
