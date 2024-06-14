package com.smhrd.admin.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.setting.SqlSessionManager;


public class AdminDAO {
	// 1) SqlSession을 가지고 올 수 있는 SqlSessionFactory 생성
		SqlSessionFactory factory =  SqlSessionManager.getFactory();
		 private static volatile AdminDAO instance; // 클래스 레벨에서 선언
		 
		public AdminDTO ad_login(AdminDTO dto) {
			SqlSession sqlSession = factory.openSession(true);
			AdminDTO result = sqlSession.selectOne("ad_login",dto);
			sqlSession.close();
			
			return result;
		}
		
		public List<AdminDTO> selectAll(){
		    // 1. sqlsession 빌려오기
		    SqlSession sqlsession = factory.openSession();
		    try {
		        // 2. sqlsession 사용해서 sql 쿼리문 실행
		        // 쿼리문 -> mapper.xml
		        List<AdminDTO> resultList = sqlsession.selectList("selectAll");
		        // 3. 조회한 결과값 반환
		        return resultList;
		    } finally {
		        // 4. 연결 객체 반환
		        sqlsession.close();
		    }
		}
		
		public List<AdminDTO> searchUserById(String userId) {
		    SqlSession sqlSession = factory.openSession();
		    try {
		        // SQL 쿼리를 실행하여 검색 결과 반환
		        List<AdminDTO> userList = sqlSession.selectList("com.smhrd.admin.model.AdminDAO.searchUserById", userId);
		        return userList;
		    } finally {
		        sqlSession.close();
		    }
		}

		public static AdminDAO getInstance() {
	        if (instance == null) {
	            synchronized (AdminDAO.class) {
	                if (instance == null) {
	                    instance = new AdminDAO();
	                }
	            }
	        }
	        return instance;
	    }
}
