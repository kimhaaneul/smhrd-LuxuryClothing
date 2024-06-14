package com.smhrd.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.admin.model.AdminDAO;
import com.smhrd.admin.model.AdminDTO;
import com.smhrd.main.controller.Controller;

public class SearchUserCon implements Controller {
	
    private static final String SEARCH_USER_JSP = "searchUser";
    private final AdminDAO adminDAO;

    public SearchUserCon() {
        this.adminDAO = AdminDAO.getInstance(); // 싱글톤 AdminDAO 객체 생성
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        List<AdminDTO> userList = null;

        try {
            // SQL Injection 방어를 위해 PreparedStatement 사용
            userList = adminDAO.searchUserById(userId);
        } catch (Exception e) {
            // 오류 발생 시 처리
            e.printStackTrace(); // 나중에는 로그로 대체하는 것이 좋음
            // 에러 메시지를 request에 저장하여 JSP에서 처리하도록 함
            request.setAttribute("errorMessage", "회원 검색 중 오류가 발생했습니다.");
        }

        // 검색 결과를 request에 저장
        request.setAttribute("userList", userList);

        // JSP 파일명 반환
        return SEARCH_USER_JSP;
    }
}