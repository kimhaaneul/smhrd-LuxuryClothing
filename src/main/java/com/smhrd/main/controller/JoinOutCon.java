package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.model.UserDAO;
import com.smhrd.main.model.UserDTO;

public class JoinOutCon implements Controller {
    
    UserDAO userDAO = new UserDAO();
    UserDTO dto = new UserDTO();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	
    	// 세션에서 사용자 정보 가져오기
        HttpSession session = request.getSession();
        
        String userId = request.getParameter("user_id");
        // 사용자가 입력한 비밀번호
        String password = request.getParameter("password");
        dto.setUser_id(userId);
        dto.setUser_pw(password);
        System.out.println("JoinOutCon 유저 id : "+dto.getUser_id());
        
        String url = null;
        System.out.println(userId);
        // 세션에 사용자 ID가 없으면 로그인 페이지로 리다이렉트
        if (userId == null || userId.isEmpty()) {
        	url = "redirect:/loginpage.do";
        }
        
        // 회원 탈퇴 실행
        int result = userDAO.JoinOut(dto);
        
        // 회원 탈퇴 결과에 따라 처리
        if (result > 0) {
            // 회원 탈퇴 성공 시 세션 해제하고 메인 페이지로 리다이렉트
            session.invalidate();
            System.out.println("회원 탈퇴에 성공하였습니다.");
            return "redirect:/main.do";
        } else {
            // 회원 탈퇴 실패 시 메시지 설정
        	url = "JoinOut";
        	System.out.println("회원 탈퇴에 실패하였습니다.");
            request.setAttribute("message", "회원 탈퇴에 실패하였습니다.");
            return url; // 회원 탈퇴 페이지로 다시 이동
        }
    }
}