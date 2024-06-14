package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.model.UserDAO;
import com.smhrd.main.model.UserDTO;

public class JoinCon implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 2. 요청 데이터 꺼내오기(6개)
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String phone = request.getParameter("phone");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				// String joinedAt = request.getParameter("현재시간 추출하는 파라미터 추출");
				
				
				UserDTO dto = new UserDTO();
				dto.setUser_id(id);
				dto.setUser_pw(pw);
				dto.setUser_phone(phone);
				dto.setUser_name(name);
				dto.setUser_email(email);
				dto.setUser_addr(address);
				
				System.out.println("luxury JoinCon : join.jsp");
				UserDAO dao = new UserDAO();
				int res = dao.join(dto);
				
				if (res > 0) {
		            System.out.println("회원 가입 성공");
		            
		        } else {
		        	System.out.println("회원 가입 실패");
		        }
				
		return "redirect:/main.do";
	}
}
