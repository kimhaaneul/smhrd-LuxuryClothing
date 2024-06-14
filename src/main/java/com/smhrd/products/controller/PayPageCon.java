package com.smhrd.products.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class PayPageCon implements Controller {

   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	  System.out.println("PayPageCon 방문"); 
	   
	  HttpSession session = request.getSession();
	  ProductsDTO prod = (ProductsDTO)session.getAttribute("prod_detail");
	  String prod_id = prod.getProd_id();
	  
	  System.out.println("prodid값 : " + prod_id);
	  
	  ProductsDAO dao = new ProductsDAO();
	  ProductsDTO prod_detail = dao.selectProduct(prod_id); 
	  session.setAttribute("prod_detail", prod_detail);
	  
      return "payment";

   }

}