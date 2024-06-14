package com.smhrd.users.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data	// 기본메소드 자동완성(getter, setter, toString)
@AllArgsConstructor // 모든 필드를 초기화 하는 생성자 자동완성 
@NoArgsConstructor	// 기본생성자 : 기본생성자는 반드시 있어야 한다.

public class CartDTO {
	
	private String user_id;
	private String user_pw;
	private String user_phone;
	private String user_name;
	private String user_email;
	private String user_grade;
	private String joined_at;
	
	private String prod_id;
	private String prod_name;
	private String prod_price;
	private String prod_desc;
	private String prod_category;
	private String prod_option;
	private String prod_grade;
	private String prod_yn;
	
	private String file_name;
	private String prodUploaded_seq;	// 업로드 순번 (DB에서 시퀀스로 자동 번호 지정해줌)
	private String prodFile_realname;	// 파일 실제이름
	private String prodFile_size;		// 파일 사이즈
	private String prodFile_ext;		// 파일 확장자
	private String prodFile_path;		// 파일 경로

}
