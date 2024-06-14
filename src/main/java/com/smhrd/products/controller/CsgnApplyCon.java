package com.smhrd.products.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class CsgnApplyCon implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("luxury CsgnApplyCon : csgnApply.jsp");
		
		////////////////////////////////// 이미지 등록 ///////////////////////////////////////////
		// 파일을 저장할 경로 설정
		String savePath = "C:\\Users\\SMHRD\\git\\repository2\\LuxuryClothing\\src\\main\\webapp\\resources\\assets\\images\\products"; 
		int maxSize = 1024 * 1024 * 10 ; 
		
		// 최대 용량 10 MB
		String encoding = "UTF-8"; // 인코딩 방식
		DefaultFileRenamePolicy realName = null;
		
		// 프로젝트내 파일 등록
		MultipartRequest multi = new MultipartRequest(
				request // 요청객체 
				, savePath
				, maxSize
				, encoding
				, realName = new DefaultFileRenamePolicy() // 파일 이름 재정의
		);
		
		////////////////////////////////// 이미지 데이터 ///////////////////////////////////////////
		System.out.println("메인 등록한 파일 저장 경로 : " + savePath);
		
		// 파일에서 메인 사진정보 가져오기
		File file = (File) multi.getFile("mainImg");
		String fileData = file.getName();	// 파일 정보 가져오기
		String fileName = fileData;	// 파일 이름
		String fileExt = fileData.substring(fileData.lastIndexOf(".") + 1);	// 파일 확장자명
		String fileSize = Long.toString(file.length());	// 파일 사이즈
		
		System.out.println("메인 등록한 mainImg파일 fileName : " + fileName);
		System.out.println("메인 등록한 mainImg파일 fileExt : " + fileExt);
		System.out.println("메인 등록한 mainImg파일 fileSize : " + fileSize);
		
		
		// 파일에서 서브 사진정보 가져오기
		File fileSub = (File) multi.getFile("subImg");
		String fileDataSub = fileSub.getName();	// 파일 정보 가져오기
		String fileNameSub = fileDataSub;	// 파일 이름
		String fileExtSub = fileDataSub.substring(fileDataSub.lastIndexOf(".") + 1);	// 파일 확장자명
		String fileSizeSub = Long.toString(fileSub.length());	// 파일 사이즈
	
		System.out.println("메인 등록한 mainImg파일 fileDataSub : " + fileNameSub);
		System.out.println("메인 등록한 mainImg파일 fileExtSub : " + fileExtSub);
		System.out.println("메인 등록한 mainImg파일 fileSizeSub : " + fileSizeSub);
		
		
		// 파일에서 정보 가져오기
		File fileYong = (File) multi.getFile("yongImg");
		String fileDataYong = fileYong.getName();	// 파일 정보 가져오기
		String fileNameYong = fileDataYong;	// 파일 이름
		String fileExtYong = fileDataYong.substring(fileDataYong.lastIndexOf(".") + 1);	// 파일 확장자명
		String fileSizeYong = Long.toString(fileYong.length());	// 파일 사이즈
	
		System.out.println("메인 등록한 mainImg파일 fileNameYong : " + fileNameYong);
		System.out.println("메인 등록한 mainImg파일 fileExtYong : " + fileExtYong);
		System.out.println("메인 등록한 mainImg파일 fileSizeYong : " + fileSizeYong);
		
		
		////////////////////////////////// 상품 등록 ///////////////////////////////////////////	
		// 객체 호출
		ProductsDTO dto = new ProductsDTO(); 	// 상품 내용, 메인사진
		ProductsDTO dtoSub = new ProductsDTO();	// 서브1 사진
		ProductsDTO dtoYong = new ProductsDTO();	// 영수증 사진
		ProductsDAO dao = new ProductsDAO();
		
		String name = multi.getParameter("goods_name");
		String price = multi.getParameter("wish_price");
		String kind = multi.getParameter("goods_kind");
		String option = multi.getParameter("goods_option");
		String detail = multi.getParameter("goods_detail");
		String user_id = multi.getParameter("user_id");
		
		dto.setProd_name(name);
		dto.setProd_price(price);
		dto.setProd_category(kind);
		dto.setProd_option(option);
		dto.setProd_desc(detail);
		dto.setUser_id(user_id);
		
		System.out.println("CsgnApplyCon name : "+ name);
		System.out.println("CsgnApplyCon price : "+ price);
		System.out.println("CsgnApplyCon user_id : "+ user_id);
		
		// 상품 id 가져오기
		int productIdNum = dao.selectProductIdNum();
		String prod_id = Integer.toString(productIdNum);
		System.out.println("CsgnApplyCon prod_id : "+ prod_id);
		
		
		////////////////////////////////// dto에 데이터 대입 ///////////////////////////////////////////
		
		// 사용시 setProd_id의 파라메타 값 변경하기!
		dto.setProd_id(prod_id);
		dto.setFile_name(fileName);
		dto.setProdFile_ext(fileExt);
		dto.setProdFile_size(fileSize);
		
		// 사용시 setProd_id의 파라메타 값 변경하기!
		dtoSub.setProd_id(prod_id);
		dtoSub.setFile_name(fileNameSub);
		dtoSub.setProdFile_ext(fileExtSub);
		dtoSub.setProdFile_size(fileSizeSub);
		
		// 사용시 setProd_id의 파라메타 값 변경하기!
		dtoYong.setProd_id(prod_id);
		dtoYong.setFile_name(fileNameYong);
		dtoYong.setProdFile_ext(fileExtYong);
		dtoYong.setProdFile_size(fileSizeYong);
		
		
		///// 이미지 성공시 위치 앞으로 배치
		int res = dao.csgnApply(dto);			// 상품 데이터 등록
		dao.insertProductMainImageUpload(dto);		// 상품 메인 이미지 등록
		
		if (fileNameSub != null) {
			dao.insertProductSubImageUpload(dtoSub);		// 상품 서브 이미지 등록
		}
		if (fileNameYong != null) {
			dao.insertProductSubImageUpload(dtoYong);		// 상품 영수증 이미지 등록
		}
		
		if(res > 0) {
			System.out.println("신청 성공");
			
		}else {
			System.out.println("신청 실패");
		}
		
		
		// main으로 이동
		return "main";

	}

}
