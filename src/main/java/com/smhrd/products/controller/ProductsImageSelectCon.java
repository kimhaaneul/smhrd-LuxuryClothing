package com.smhrd.products.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductImageDTO;
import com.smhrd.products.model.ProductsDAO;

//@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB

public class ProductsImageSelectCon implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// 이미지 조회하는 로직
		// ProductsImageMapper.xml 연동
		//  -> ProductImageUpload 는 이미지 DB에 업로드
		//  -> selectImage 는 이미지 조회

		System.out.println("luxury ProductsImageSelect : 이미지 불러오기 요청");

		ProductImageDTO dto = new ProductImageDTO();
		ProductsDAO dao = new ProductsDAO();
		
		//	product_id 넣어주기 !
		// 아래 주석풀기..!
//		String id = request.getParameter("id");
		
		// 사용시 setProd_id의 파라메타 값 변경하기!
		dto.setProd_id("21");
		
		List<ProductImageDTO> images = dao.selectProductImages(dto);
		
		// session 공간 불러오기
		HttpSession session = request.getSession();
		// session에 데이터 담기
		session.setAttribute("images", images);

		// 해당 경로는 사용할 것으로 수정
		return "test_ProductImage";
	}
}
