package com.smhrd.users.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.setting.SqlSessionManager;

public class CartDAO {

	// 1) SqlSession을 가지고 올 수 있는 SqlSessionFactory 생성
	SqlSessionFactory factory = SqlSessionManager.getFactory();

	// 장바구니에 담기
	public int CartListInsert(CartDTO dto) {
		System.out.println("CartListInsert 방문");
		SqlSession sqlSession = factory.openSession(true);
		int cartItems = sqlSession.insert("CartListInsert", dto);
		sqlSession.close();
		
		return cartItems;
	}
	
	// 장바구니에 담긴 상품 정보 가져오기
	public int selectCartCount(String userId) {
		System.out.println("getCartItems 방문");
		SqlSession sqlSession = SqlSessionManager.getFactory().openSession();
		int cartItems = sqlSession.selectOne("selectCartCount", userId);
		sqlSession.close();
		
		return cartItems;
	}
	
	// 장바구니에 담긴 상품 정보 가져오기
	public List<CartDTO> getCartItems(String userId) {
		System.out.println("getCartItems 리스트 방문");
		SqlSession sqlSession = SqlSessionManager.getFactory().openSession();
		List<CartDTO> cartItems = sqlSession.selectList("getCartItems", userId);
		sqlSession.close();
		
		return cartItems;
	}

	// 현재 장바구니에 담겨있는 전체 상품의 가격의 합 가져오기
	public int getTotalPrice(String userId) {
		System.out.println("getTotalPrice 방문");
		SqlSession sqlSession = SqlSessionManager.getFactory().openSession();
		int totalPrice = sqlSession.selectOne("getTotalPrice", userId);
		sqlSession.close();
		return totalPrice;
	}

	public int removeFromCart(CartDTO dto) {
		System.out.println("removeFromCart 방문");
		SqlSession sqlSession = factory.openSession(true);
		int removeItem = sqlSession.delete("removeFromCart", dto);
		sqlSession.close();
		return removeItem;
	}

}
