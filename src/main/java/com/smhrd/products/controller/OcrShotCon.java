package com.smhrd.products.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.main.controller.Controller;

public class OcrShotCon implements Controller {

	// execute 메소드를 통해서
	// 실행하고자 하는 기능(로직)을 실행시키고 그 결과로
	// 다음 페이지가 어디인지를 리턴
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("luxury OCR Shot Con : 입장");
		String line = null;
		
		// "python" : 그대로 둘 것.
		// "D:/workspace/ErrScreenShot/com/err.py"  : 본인 환경에 맞춰 pydev 프로젝트 경로/파일명.py 로 변경
		ProcessBuilder pd = new ProcessBuilder("python", "C:/Users/smhrd4/Desktop/ServerStudy/PyOCR/OcrShot.py");
		Process process = pd.start();
		
		InputStream inputStream = process.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "euc-kr"));

		// pydev 모든기능 완료 후 콘솔로 결과 출력
		while ((line = reader.readLine()) != null) {
			// 실행 결과 처리
		    System.out.println(line);
		}
		
		return "test_main";
		
	}
	
	
	
}
