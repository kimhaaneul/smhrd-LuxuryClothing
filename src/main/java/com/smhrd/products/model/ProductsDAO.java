package com.smhrd.products.model;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.setting.SqlSessionManager;

public class ProductsDAO {

	// 1) SqlSession을 가지고 올 수 있는 SqlSessionFactory 생성
	SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	
	///////////////////////////// 사용자 ////////////////////////////////
	
	// 전체 상품 리스트 메소드
	public List<ProductsDTO> selectProducts() {
		
		System.out.println("ProductsDAO 방문 selectProducts");
		// 1. sql 세션 빌려오기
		SqlSession sqlSession =  factory.openSession();
		// 2. sqlSssion 사용해서 sql 쿼리문 실행
		// 	뭐리문 --> mapper.xml
		List<ProductsDTO> resultList = sqlSession.selectList("selectProducts");
		// MemberDTO -> 한명에 대한 정보를 표현할 수 있는 type
		// 여러명의 정보를 하나로 묶어서 표현함.
		// 1) 객체 배열 2)ArrayList
		// : 크기가 가변적인 ArrayList 사용했었음
		// ArrayList의 부모 클래스 격인 List 형태로 리턴을 받아옴 !
		
		// 3. 연결객체 반납
		sqlSession.close();
		// 4. 조회한 결과 반환
		
		return resultList;
	}
	
	// 마이페이지 위탁상품관리 상품리스트 조회
	public List<ProductsDTO> selectMyProducts(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectMyProducts");
		SqlSession sqlSession =  factory.openSession();
		List<ProductsDTO> resultList = sqlSession.selectList("selectMyProducts", dto);
		sqlSession.close();
		
		return resultList;
	}
	
	// 마이페이지 위탁상품관리 상품리스트 개수 조회
	public int selectMyProductsCount(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectMyProductsCount");
		SqlSession sqlSession =  factory.openSession();
		int result = sqlSession.selectOne("selectMyProductsCount", dto);
		sqlSession.close();
		
		return result;
	}
	
	
	// 검색조건으로 상품 리스트 메소드
	public List<ProductsDTO> selectProductsAll(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectProductsAll");
		SqlSession sqlSession =  factory.openSession();
		List<ProductsDTO> resultList = sqlSession.selectList("selectProductsAll", dto);
		sqlSession.close();
		
		return resultList;
	}
	
	// 검색조건으로 상품 리스트 카운트 메소드
	public int selectProductsAllCount(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectProductsAllCount");
		SqlSession sqlSession =  factory.openSession();
		int result = sqlSession.selectOne("selectProductsAllCount", dto);
		sqlSession.close();
		
		return result;
	}
	
	// 위탁판매 신청 메소드
	public int csgnApply(ProductsDTO dto) {
		System.out.println("ProductsDAO 방문 csgnApply");
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("csgnApply", dto);
		
		sqlSession.close();
		
		return row;
	}
	
	// 이미지 등록시 상품id 를 조회
	public int selectProductIdNum() {
		
		System.out.println("ProductsDAO 방문 selectProductIdNum");
		SqlSession sqlSession =  factory.openSession();
		int result = sqlSession.selectOne("selectProductIdNum");
		sqlSession.close();
		
		return result;
	}
	
	
	//////////////////// 메인 이미지 등록 - STR ///////////////////////////////////////////

	// 상품 메인 이미지 등록
	public void insertProductMainImageUpload(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 insertProductMainImageUpload");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession(true);
		int result = sqlSession.insert("insertProductMainImageUpload", dto);
		sqlSession.close();
		
		if (result > 0) {
			System.out.println("insertProductMainImageUpload 상품 이미지 등록 성공!");
		} else {
			System.out.println("insertProductMainImageUpload 상품 이미지 등록 실패!");
		}
	}
	
	// 상품 메인 외, 이미지 등록
	public void insertProductSubImageUpload(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 insertProductSubImageUpload");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession(true);
		int result = sqlSession.insert("insertProductSubImageUpload", dto);
		sqlSession.close();
		
		if (result > 0) {
			System.out.println("insertProductSubImageUpload 상품 이미지 등록 성공!");
		} else {
			System.out.println("insertProductSubImageUpload 상품 이미지 등록 실패!");
		}
	}
	//////////////////// 메인 이미지 등록 - END ///////////////////////////////////////////
	
	// 상품 검색 결과 조회
	public List<ProductImageDTO> selectProductImages(ProductImageDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectProductImages");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		List<ProductImageDTO> result = sqlSession.selectList("selectImages", dto);
		sqlSession.close();
		
		if (result.equals(null)) {
			System.out.println("selectProductImages 상품 이미지 조회 실패!");
		} else {
			System.out.println("selectProductImages 상품 이미지 조회 성공!");
		}
		return result;
	}
	
	// 상품 상세 조회 정보 가져오는 메소드
	public ProductsDTO selectProduct(String prod_id) {
		System.out.println("ProductsDAO 방문 selectProduct");
		
		SqlSession sqlSession = factory.openSession();
		ProductsDTO result = sqlSession.selectOne("selectProduct", prod_id);
		sqlSession.close();
		System.out.println(result); 
		
		if (result.equals(null)) {
			System.out.println("selectProduct 상품 상세 조회 실패!");
		} else {
			System.out.println("selectProduct 상품 상세 조회 성공!");
		}
		return result;
	}
	
	// 상품 상세정보의 메인 이미지만 가져오기
	public ProductsDTO selectProductMainImage(String productId) {
		System.out.println("ProductsDAO 방문 selectProductMainImage");
		
		SqlSession sqlSession = factory.openSession();
		ProductsDTO result = sqlSession.selectOne("selectProductMainImage", productId);
		sqlSession.close();
		System.out.println(result); 
		
		if (result.equals(null)) {
			System.out.println("selectProductMainImage 상품 상세 조회 실패!");
		} else {
			System.out.println("selectProductMainImage 상품 상세 조회 성공!");
		}
		return result;
	}
	
	// 상품 상세정보의 서브 이미지들 가져오기
	public List<ProductsDTO> selectProductSubImages(String productId) {
		System.out.println("ProductsDAO 방문 selectProduct");
		
		SqlSession sqlSession = factory.openSession();
		List<ProductsDTO> result = sqlSession.selectList("selectProductSubImages", productId);
		sqlSession.close();
		System.out.println(result); 
		
		if (result.equals(null)) {
			System.out.println("selectProductSubImages 상품 상세 조회 실패!");
		} else {
			System.out.println("selectProductSubImages 상품 상세 조회 성공!");
		}
		return result;
	}
	
	// 상품에서 대표 이미지와 상품 정보를 가져오는 로직
	public List<ProductImageDTO> selectImageMain() {
		
		System.out.println("ProductsDAO 방문 selectImageMain");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		List<ProductImageDTO> result = sqlSession.selectList("selectImageMain");
		sqlSession.close();
		
		if (result.equals(null)) {
			System.out.println("selectImageMain 상품 이미지 조회 실패!");
		} else {
			System.out.println("selectImageMain 상품 이미지 조회 성공!");
		}
		return result;
	}
	
	// 상품 총 개수를 카운트 해줌
	public int selectImageMainCount() {
		
		System.out.println("ProductsDAO 방문 selectImageMainCount");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		int result = sqlSession.selectOne("selectImageMainCount");
		sqlSession.close();
		
		return result;
	}
	
	// 메인 추천 상품에서 이미지와 상품 정보를 가져오는 로직
	public List<ProductImageDTO> selectImageMainPick(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectImageMainPick");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		List<ProductImageDTO> result = sqlSession.selectList("selectImageMainPick", dto);
		sqlSession.close();
		
		if (result.equals(null)) {
			System.out.println("selectImageMainPick 상품 이미지 조회 실패!");
		} else {
			System.out.println("selectImageMainPick 상품 이미지 조회 성공!");
		}
		return result;
	}
	
	
	
	///////////////////////////// 관리자 ////////////////////////////////

	// 관리자 상품 검색 결과 조회
	public List<ProductsDTO> selectSearchProducts(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectSearchProducts");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		List<ProductsDTO> result = sqlSession.selectList("selectSearchProducts", dto);
		sqlSession.close();
		
		if (result.equals(null)) {
			System.out.println("selectSearchProducts 관리자 상품 검색조회 실패!");
		} else {
			System.out.println("selectSearchProducts 관리자 상품 검색조회 성공!");
		}
		return result;
	}
	
	// 관리자 상품 검색 결과 카운트 해줌
	public int selectSearchProductsCount(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 selectSearchProductsCount");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession();
		int result = sqlSession.selectOne("selectSearchProductsCount", dto);
		sqlSession.close();
		
		return result;
	}

	// 관리자 상품 수정
	public int adminProductUpdate(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 adminProductUpdate");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession(true);
		int result = sqlSession.update("adminProductUpdate", dto);
		sqlSession.close();
		
		if (result > 0) {
			System.out.println("adminProductUpdate 관리자 상품 업데이트 성공!");
		} else {
			System.out.println("adminProductUpdate 관리자 상품 업데이트 실패!");
		}
		return result;
	}
	
	// 유저 상품판매요청 시 판매가능 기능
	public int userMyProductSellUpdate(ProductsDTO dto) {
		
		System.out.println("ProductsDAO 방문 userMyProductSellUpdate");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession(true);
		int result = sqlSession.update("userMyProductSellUpdate", dto);
		sqlSession.close();
		
		if (result > 0) {
			System.out.println("userMyProductSellUpdate 관리자 상품 업데이트 성공!");
		} else {
			System.out.println("userMyProductSellUpdate 관리자 상품 업데이트 실패!");
		}
		return result;
	}
	
	public int adminProductDeleteCon(ProductsDTO dto ) {
		
		System.out.println("ProductsDAO 방문 adminProductDeleteCon");
		// factory.openSession(true) 에서 true 가 커밋여부 !
		SqlSession sqlSession =  factory.openSession(true);
		int result = sqlSession.update("adminProductDelete", dto);
		sqlSession.close();
		
		if (result > 0) {
			System.out.println("adminProductDeleteCon 관리자/유저 상품판매중단 성공!");
		} else {
			System.out.println("adminProductDeleteCon 관리자/유저 상품판매중단 실패!");
		}
		return result;
	}
	
	
	
	
	
}

