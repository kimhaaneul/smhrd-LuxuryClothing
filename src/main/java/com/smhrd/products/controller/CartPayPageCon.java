package com.smhrd.products.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class CartPayPageCon implements Controller {

   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	  System.out.println("CartPayPageCon 방문"); 
	   
	  String  arr = request.getParameter("cartPayProd_id");
	  
	  ProductsDTO dto = new ProductsDTO();
	  ProductsDAO dao = new ProductsDAO();
	  HttpSession session = request.getSession();
	  // 장바구니에서 구매하려는 물품들 prod_id로 검색해서 ArrayList에 담아 결제 페이지에 전달
	  ArrayList<ProductsDTO> prodList = new ArrayList<ProductsDTO>();
	  System.out.println("받아온 데이터 : " + arr);
	  String[] productId = arr.split(",");
	  
	  for (int i = 0; i < productId.length; i++) {
			dto.setProd_id(productId[i]);	// 상품 id
			System.out.println("CartPayPageCon Prod_id : " + dto.getProd_id());
			
			ProductsDTO prod_detail = dao.selectProduct(productId[i]);
			prodList.add(prod_detail);
		}
	  session.setAttribute("prodList", prodList);
	  session.setAttribute("arr", arr);
	  
      return "cartPayPage";
      
   }

}