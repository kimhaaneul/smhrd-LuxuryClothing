package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogOutCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. session 꺼내기
				//HttpSession session = request.getSession();
				// 2. session 무효화
				//session.invalidate();
				// 3. mail.jsp로 redirect방식으로 이동
				request.getSession().invalidate();
		return "redirect:/main.do";
	}

}
