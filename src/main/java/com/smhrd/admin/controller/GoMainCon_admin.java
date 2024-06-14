package com.smhrd.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoMainCon_admin {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// http://localhost:8082/MassageSystem -> webapp 폴더
		// jsp로 이동시에는 jsp 파일의 이름만 지정
		System.out.println("luxury MainCon : test_main.jsp");
		return "test_main";

	}
}
