package com.smhrd.main.controller;

import com.smhrd.main.model.UserDAO;
import com.smhrd.main.model.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class changePWController implements Controller {

	UserDAO userDAO = new UserDAO();
	UserDTO dto = new UserDTO();

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서 사용자 정보 가져오기
		HttpSession session = request.getSession();
		String userId = request.getParameter("user_id"); // 세션에서 가져오는 부분을 사용자가 입력한 아이디를 사용하도록 수정
		String newPassword = request.getParameter("newPassword");
		System.out.println(userId);

		// 새 비밀번호가 일치하는지 확인하는 로직
		String confirmPassword = request.getParameter("confirmPassword");
		if (!newPassword.equals(confirmPassword)) {
			// 새 비밀번호와 확인용 비밀번호가 일치하지 않을 경우
			request.setAttribute("errorMessage", "새 비밀번호와 확인용 비밀번호가 일치하지 않습니다.");
			return "changePW.jsp"; // 변경 실패 시 다시 비밀번호 변경 페이지로 이동
		}

		// 사용자 DTO 생성
		dto.setUser_id(userId);
		dto.setUser_pw(newPassword);

		// 비밀번호 변경 처리
		int result = userDAO.changePassword(dto);
		if (result > 0) {
			// 비밀번호 변경에 성공한 경우
			 System.out.println("비밀번호가 성공적으로 변경되었습니다.");
			request.setAttribute("successMessage", "비밀번호가 성공적으로 변경되었습니다.");
			return "main"; // 변경 성공 시 메인 페이지로 이동
		} else {
			// 비밀번호 변경에 실패한 경우
			 System.out.println("비밀번호가 변경에 실패하였습니다.");
			request.setAttribute("errorMessage", "비밀번호 변경에 실패하였습니다.");
			return "changePW"; // 변경 실패 시 다시 비밀번호 변경 페이지로 이동
		}
	}
}
