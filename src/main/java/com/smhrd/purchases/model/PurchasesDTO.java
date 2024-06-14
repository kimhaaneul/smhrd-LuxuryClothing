package com.smhrd.purchases.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//lombok 라이브러리 : Class의 기본 메소드(생성자, getter/setter) 자동완성

@Data	// 기본메소드 자동완성(getter, setter, toString)
@AllArgsConstructor // 모든 필드를 초기화 하는 생성자 자동완성 
@NoArgsConstructor	// 기본생성자 : 기본생성자는 반드시 있어야 한다.

public class PurchasesDTO {

	// 반드시 테이블의 컬럼명과 필드 변수명이 같아야 한다.
	
	private String order_seq;
	private String user_id;
	private String total_amount;
	private String pay_amount;
	private String pay_method;
	private String paid_amount;
	private String ordered_at;
	private String prod_id;
	private String deli_addr;
	private String recipient_name;
	private String recipient_phone;
	private String deli_message;
	private String order_status;
}
