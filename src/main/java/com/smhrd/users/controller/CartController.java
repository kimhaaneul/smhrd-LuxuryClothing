package com.smhrd.users.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.main.model.UserDTO;
import com.smhrd.users.model.CartDAO;
import com.smhrd.users.model.CartDTO;

public class CartController implements Controller {

	CartDAO usersDAO = new CartDAO(); // DAO 객체 생성 (실제로는 주입되어야 함)
	CartDTO usersDTO = new CartDTO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // 세션에서 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    UserDTO user = (UserDTO) session.getAttribute("user_result");

	    // 세션에 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	    if (user == null || user.getUser_id() == null || user.getUser_id().isEmpty()) {
	        return "redirect:/loginpage.do";
	    }
	    

	    // 사용자 ID 가져오기
	    String userId = user.getUser_id();
	    
	    // 장바구니에 담긴 상품 정보 가져오기
	    List<CartDTO> cartItems = usersDAO.getCartItems(userId);
	    // 장바구니의 총 개수 가져오기
	    int count = usersDAO.selectCartCount(userId);
	    // 현재 장바구니에 담겨있는 전체 상품의 가격의 합 출력
	    int totalPrice = usersDAO.getTotalPrice(userId);
	    
	    // 장바구니에 담긴 상품들의 출력
	    session.setAttribute("cartItems", cartItems);
	    session.setAttribute("count", count);
	    session.setAttribute("totalPrice", totalPrice);

	    // 장바구니 페이지로 이동
	    return "carts";
	}


}
