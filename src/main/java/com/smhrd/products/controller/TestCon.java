package com.smhrd.products.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.main.controller.Controller;

public class TestCon implements Controller {

	// execute 메소드를 통해서
	// 실행하고자 하는 기능(로직)을 실행시키고 그 결과로
	// 다음 페이지가 어디인지를 리턴
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("luxury TestCon : 입장");

		return "test";
		
	}
	
	
	
}
