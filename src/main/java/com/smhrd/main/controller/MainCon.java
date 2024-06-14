package com.smhrd.main.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.products.model.ProductImageDTO;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class MainCon implements Controller {

	// execute 메소드를 통해서
	// 실행하고자 하는 기능(로직)을 실행시키고 그 결과로
	// 다음 페이지가 어디인지를 리턴
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("luxury MainCon : main.jsp");
		
		ProductsDAO dao = new ProductsDAO();
		ProductsDTO dto = new ProductsDTO();
		
		// 메인 이미지 불러오기
		
		// 메인 상단 위 상품 리스트
		List<ProductImageDTO> result = dao.selectImageMain();
		
		// 오늘 날짜 불러옴
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		String category = null;
		
		if (1 < day && day < 6) {
			System.out.println("오늘 날자"+day+" 추천 : 모자");
			category = "모자";
		} else if (6 < day && day < 12) {
			System.out.println("오늘 날자"+day+" 추천 : 상의");
			category = "상의";
		} else if (12 < day && day < 18) {
			System.out.println("오늘 날자"+day+" 추천 : 하의");
			category = "하의";
		} else if (18 < day && day < 24) {
			System.out.println("오늘 날자"+day+" 추천 : 신발");
			category = "신발";
		} else {
			System.out.println("오늘 날자"+day+" 추천 : 악세서리");
			category = "악세서리";
		}
		dto.setProd_category(category);
		List<ProductImageDTO> pick = dao.selectImageMainPick(dto);
		
		
		if (result != null) {
			System.out.println("메인 상품 전체조회 성공");
			HttpSession session = request.getSession();
			session.setAttribute("product_result", result);
			session.setAttribute("product_pick", pick);
		} else {
			System.out.println("메인 상품 전체조회 실패");
		}
		
		return "main";
		
	}
	
	
	
}
