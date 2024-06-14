package com.smhrd.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.admin.model.AdminDAO;
import com.smhrd.admin.model.AdminDTO;
import com.smhrd.main.controller.Controller;

public class selectAllCon implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // DAO를 사용하여 회원 목록 가져오기
        AdminDAO adminDAO = new AdminDAO();
        List<AdminDTO> userList = adminDAO.selectAll();
        
        // JSP에서 사용할 데이터를 request에 저장
        request.setAttribute("userList", userList);
        
        // user_list.jsp로 forward
        return "user_list";
    }

}