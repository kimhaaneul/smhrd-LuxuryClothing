package com.smhrd.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.model.UserDAO;
import com.smhrd.main.model.UserDTO;

public class UserModifyEnterCon implements Controller {
		
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = null;
		
		System.out.println(url);
		// 세션에서 id값 가져와 id 세팅, request에서 pw가져와 pw 세팅
		HttpSession session = request.getSession();
		UserDTO user_dto = (UserDTO)(session.getAttribute("user_result"));
		String id = user_dto.getUser_id();
		String pw = request.getParameter("pw");
		
		user_dto.setUser_id(id);
		user_dto.setUser_pw(pw);
		
		// DB에서 id,pw가 같은 튜플을 객체로 아이디만 가져옴.
		UserDAO dao = new UserDAO();
		UserDTO result = dao.userModifyEnter(user_dto);
		System.out.println(url);
		
		try {
			if(result.getUser_id().equals(id)) {
				System.out.println("성공 시 id값 : "+ result.getUser_id());
				url = "user_modify";
			} else {
				System.out.println("try else 실패1");
			}
		} catch (Exception e) {
			url = "main";
			System.out.println("catch 실패");
		}
		return url;

	}

}

