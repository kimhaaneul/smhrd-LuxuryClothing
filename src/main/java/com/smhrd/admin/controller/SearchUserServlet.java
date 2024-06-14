package com.smhrd.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.admin.model.AdminDAO;
import com.smhrd.admin.model.AdminDTO;

@WebServlet("/searchUser")
public class SearchUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");

        // 검색 바가 비어있는지 확인
        if (userId == null || userId.isEmpty()) {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<html><head><title>User Search Result</title></head><body>");
            response.getWriter().write("<p>검색 바가 비어 있습니다.</p>");
            response.getWriter().write("</body></html>");
            return;
        }

        AdminDAO adminDAO = new AdminDAO();
        List<AdminDTO> userList = adminDAO.searchUserById(userId);

        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().write("<html><head><title>User Search Result</title></head><body>");
        
        if (userList.isEmpty()) {
            // 검색 결과가 없는 경우 처리
            response.getWriter().write("<p>검색 결과가 없습니다.</p>");
        } else {
            // 검색 결과가 있는 경우 HTML 테이블 생성
            response.getWriter().write("<table border='1'>");
            response.getWriter().write("<tr><th>ID</th><th>Name</th><th>Email</th></tr>");
            for (AdminDTO user : userList) {
                response.getWriter().write("<tr>");
                response.getWriter().write("<td>" + user.getUser_id() + "</td>");
                response.getWriter().write("<td>" + user.getUser_name() + "</td>");
                response.getWriter().write("<td>" + user.getUser_email() + "</td>");
                response.getWriter().write("</tr>");
            }
            response.getWriter().write("</table>");
        }

        response.getWriter().write("</body></html>");
    }
}