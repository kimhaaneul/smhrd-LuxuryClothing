//package com.smhrd.products.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.smhrd.main.controller.Controller;
//import com.smhrd.products.model.ProductsDAO;
//import com.smhrd.products.model.ProductsDTO;
//
////@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
//
//public class ProductsImageUploadCon implements Controller {
//
//	public String execute(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		
//		// 이미지 업로드 시키는 로직
//		// 각각의 사진을 모두 해당 url로 유도 해야 편함.
//		// 파일 경로는 savePath 값 확인.
//		// 현재 상품 id 는 21번으로 고정되있음
//		// ProductsImageMapper.xml 연동
//		//  -> ProductImageUpload 는 이미지 DB에 업로드
//		//  -> selectImage 는 이미지 조회
//
//		System.out.println("luxury ProductsImageUploadCon : 이미지 업로드 요청");
//
//		ArrayList<ProductsDTO> arryDto = new ArrayList<ProductsDTO>();
//		ProductsDTO dto = new ProductsDTO();
//		ProductsDAO dao = new ProductsDAO();
//
//		// 파일 기본설정
//		// 파일을 저장할 경로 설정
//		String savePath = "C:\\Users\\smhrd4\\git\\repository2\\LuxuryClothing\\src\\main\\webapp\\resources\\assets\\images\\products"; 
//		int maxSize = 1024 * 1024 * 10 ; 
//		// 최대 용량 10 MB
//		String encoding = "UTF-8"; // 인코딩 방식
//		DefaultFileRenamePolicy realName = null;
//		
//		// 프로젝트내 파일 등록
//		MultipartRequest multi = new MultipartRequest(
//				request // 요청객체 
//				, savePath
//				, maxSize
//				, encoding
//				, realName = new DefaultFileRenamePolicy() // 파일 이름 재정의
//		);
//		
//		System.out.println("ProductsImageUploadCon multi 사이즈 : " + maxSize);
//		System.out.println("ProductsImageUploadCon multi 경로 : " + savePath);
//		
//		// 파일에서 정보 가져오기
//		File file = (File) multi.getFile("file");
//		String fileData = file.getName();	// 파일 정보 가져오기
//		String fileName = fileData;	// 파일 이름
//		String fileExt = fileData.substring(fileData.lastIndexOf(".") + 1);	// 파일 확장자명
//		String fileSize = Long.toString(file.length());	// 파일 사이즈
//		System.out.println("등록한 파일 : " + fileName);
//		
//		// 상품 id 가져오기
//		int productIdNum = dao.selectProductIdNum();
//		String prod_id = Integer.toString(productIdNum);
//		
//		System.out.println("상품 ID : " + prod_id);
//		
//		// 사용시 setProd_id의 파라메타 값 변경하기!
//		dto.setProd_id(prod_id);
//		dto.setFile_name(fileName);
//		dto.setProdFile_ext(fileExt);
//		dto.setProdFile_size(fileSize);
//		dto.setProdFile_path("/products");
//		arryDto.add(dto);
//		
//		dao.insertProductImageUpload(arryDto);
//
//		// 해당 경로는 사용할 것으로 수정
//		return "test_ImageUpload";
//	}
//}
