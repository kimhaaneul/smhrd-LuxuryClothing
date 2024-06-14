
package com.smhrd.purchases.model;

import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.setting.SqlSessionManager;
import com.smhrd.main.model.UserDTO;
import com.smhrd.products.model.ProductsDTO;

public class PurchasesDAO {

	// 1) SqlSession을 가지고 올 수 있는 SqlSessionFactory 생성
	SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	public int purchaseRecord(PurchasesDTO dto) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		int result = sqlSession.insert("purchaseRecord", dto);
		
		sqlSession.close();
		
		return result;

	}
	
	public List<PurchasesRecordDTO> getRecord(String user_id) {
		
		SqlSession sqlSession = factory.openSession();
		
		List<PurchasesRecordDTO> result = sqlSession.selectList("getRecord", user_id);
		
		sqlSession.close();
		
		return result;
	}
	
	public int setNo(String prod_id) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		int result = sqlSession.update("setNo", prod_id);
		
		sqlSession.close();
		
		return result;
	}
	
	public PurchasesRecordDTO payEndDto(String prod_id) {
		SqlSession sqlSession = factory.openSession();
		
		PurchasesRecordDTO dto = sqlSession.selectOne("payEndDto", prod_id);
		
		sqlSession.close();
		
		return dto;
	}
	
}
