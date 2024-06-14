package com.smhrd.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	// 인터페이스 : 추상메소드와 상수만 정의 할 수 있는 파일
	//			강제성을 부여하거나, 코딩 규칙을 정의할 때 많이 사용
	
	
	// 추상 메소드 : 중괄호가 없는 메소드 / 정의 되어 있음나 구현되자 않은 메소드
	// 자식 클래스가 반드시 해당 매소를 구현하도록 강제
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
		
}
