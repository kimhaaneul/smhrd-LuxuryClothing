
package com.smhrd.main.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.setting.SqlSessionManager;

public class UserDAO {

	// 1) SqlSession을 가지고 올 수 있는 SqlSessionFactory 생성
	SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(UserDTO dto) {

		// 1. 연결객체(sqlsession, connection) 빌려오기
		// true 커밋을 해줌
		SqlSession sqlSession = factory.openSession(true);
		// 2. 연결객체를 사용해서 sql구문을 실행
		// sql : MemberMapper.xml 파일 안에 있음
		int row = sqlSession.insert("join", dto);
		// 3. 연결객체 반납
//	 	sqlSession.commit();
		sqlSession.close();

		return row;
	}

	// 로그인 메소드
	public UserDTO login(UserDTO dto) {
		// 1. 연결객체 빌려오기
		SqlSession sqlSession = factory.openSession();
		// 2. 연결객체 사용해서 sql구문 실행
		// sql 구문 --> mapper.xml
		UserDTO result = sqlSession.selectOne("login", dto);
		// 3. 연결객체 반납
		sqlSession.close();

		return result;
	}

//	// 전체회원 조회 메소드
//	public List<UserDTO> selectAll() {
//		// 1. sql 세션 빌려오기
//		SqlSession sqlSession =  factory.openSession();
//		// 2. sqlSssion 사용해서 sql 쿼리문 실행
//		// 	뭐리문 --> mapper.xml
//		List<UserDTO> resultList = sqlSession.selectList("selectAll");
//		// MemberDTO -> 한명에 대한 정보를 표현할 수 있는 type
//		// 여러명의 정보를 하나로 묶어서 표현함.
//		// 1) 객체 배열 2)ArrayList
//		// : 크기가 가변적인 ArrayList 사용했었음
//		// ArrayList의 부모 클래스 격인 List 형태로 리턴을 받아옴 !
//		
//		// 3. 연결객체 반납
//		sqlSession.close();
//		// 4. 조회한 결과 반환
//		
//		return resultList;
//	}

	// 회원정보 변경 메소드
	public int update(UserDTO dto) {
		// 1. 연결객체(sqlsession, connection) 빌려오기
		// true 커밋을 해줌
		SqlSession sqlSession = factory.openSession(true);
		// 2. 연결객체를 사용해서 sql구문을 실행
		// sql : MemberMapper.xml 파일 안에 있음
		int row = sqlSession.update("update", dto);
		System.out.println("update DAO : " + row);
		// 3. 연결객체 반납
		sqlSession.close();

		return row;
	}

	// 회원 탈퇴
	public int JoinOut(UserDTO dto) {
		SqlSession sqlSession = factory.openSession(true);

		int result = sqlSession.delete("JoinOut", dto);
		sqlSession.close();

		return result;
	}

	// 회원정보변경을 위한 pw 체크 메소드
	public UserDTO userModifyEnter(UserDTO dto) {

		SqlSession sqlSession = factory.openSession();

		UserDTO result = sqlSession.selectOne("userModifyEnter", dto);
		sqlSession.close();

		return result;
	}

	// 비밀번호 변경 메서드
	public int changePassword(UserDTO dto) {
		SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.update("changePassword", dto);
        sqlSession.close();
        return result;
    }
}