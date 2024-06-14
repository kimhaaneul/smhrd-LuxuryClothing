package com.smhrd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.admin.model.AdminDAO;
import com.smhrd.admin.model.AdminDTO;
import com.smhrd.main.controller.Controller;

public class LoginCon_admin implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		AdminDTO dto = new AdminDTO();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		
		AdminDAO dao = new AdminDAO();
		AdminDTO result = dao.ad_login(dto);
		
		if (result != null) {
			System.out.println("로그인 성공");
			// session 공간 불러오기
			HttpSession session = request.getSession();
			// session에 데이터 담기
			session.setAttribute("result", result);
		// 6-2. 로그인 실패해도 main.jsp
		} else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:/test_main.do";
	}
	
}
