package com.smhrd.main.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.model.UserDAO;
import com.smhrd.main.model.UserDTO;

public class UserModifyCon implements Controller {

   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

		String url = "user_modify";
		
		HttpSession session = request.getSession();
		UserDTO user_dto = (UserDTO)(session.getAttribute("user_result"));
		String name = request.getParameter("name");
		String id = user_dto.getUser_id();
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		System.out.println(id);
		UserDTO dto = new UserDTO();
		dto.setUser_addr(address);
		dto.setUser_email(email);
		dto.setUser_name(name);
		dto.setUser_phone(phone);
		dto.setUser_id(id);
		
		UserDAO dao = new UserDAO();
		int res = dao.update(dto);
		System.out.println(url);
		
		if (res > 0) {
            System.out.println("수정 완료");
            url = "main";
        } else {
        	System.out.println("수정 가입 실패");
        }
		
		return url;
	}

}
