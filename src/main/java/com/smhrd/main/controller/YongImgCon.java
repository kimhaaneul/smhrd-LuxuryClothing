package com.smhrd.main.controller;

import java.io.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YongImgCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("YongImgCon 방문!");
		
		String line = null;
		
		// "python" : 그대로 둘 것.
		// 본인 환경에 맞춰 pydev 프로젝트 경로/파일명.py 로 변경
		String phdev = "C:/Users/smhrd4/Desktop/ServerStudy/PyOCR/ImagesReder.py";
//		String phdev = "D:/ImagesReder.py";
		System.out.println(phdev);
		
	    // ProcessBuilder를 사용하여 .py 파일 실행
	    ProcessBuilder processBuilder = new ProcessBuilder("python", phdev).inheritIO();
	    Process process = processBuilder.start();

	    // 실행 결과를 읽어옴
	    InputStream inputStream = process.getInputStream();
	    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "EUC-KR"));
	    StringBuilder output = new StringBuilder();
	    
	    while ((line = reader.readLine()) != null) {
	        output.append(line).append("\n");
	    }
		return line;
	}

}
