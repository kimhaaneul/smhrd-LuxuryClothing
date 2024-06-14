package com.smhrd.products.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.main.controller.Controller;
import com.smhrd.products.model.ProductsDAO;
import com.smhrd.products.model.ProductsDTO;

public class ProductDetailCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProductDetailCon 방문");
		
		String productId = request.getParameter("product_id");
		// url에서 ?뒤에 변수 가져오기(식별자)
		System.out.println("product_id값(식별자) : " + productId);
		
		ProductsDAO dao = new ProductsDAO();
		ArrayList<ProductsDAO> arrDao = new ArrayList<ProductsDAO>();
		
		ProductsDTO prod_detail = dao.selectProduct(productId);
		ProductsDTO prod_mainImage = dao.selectProductMainImage(productId);
		List<ProductsDTO> prod_subImages = dao.selectProductSubImages(productId);
		HttpSession session = request.getSession();
		session.setAttribute("prod_detail", prod_detail);
		/*
		String prod_name = result.getProd_name();
		 * String prod_price = result.getProd_price(); String prod_desc =
		 * result.getProd_desc(); String prod_category = result.getProd_category();
		 * String prod_option = result.getProd_option(); String prod_grade =
		 * result.getProd_grade(); String prod_status = result.getProd_status();
		 */
		
		request.setAttribute("prod_detail", prod_detail);
		request.setAttribute("prod_mainImage", prod_mainImage);
		request.setAttribute("prod_subImages", prod_subImages);
		/*
		 * request.setAttribute("prod_price", prod_price);
		 * request.setAttribute("prod_desc", prod_desc);
		 * request.setAttribute("prod_category", prod_category);
		 * request.setAttribute("prod_option", prod_option);
		 * request.setAttribute("prod_grade", prod_grade);
		 * request.setAttribute("prod_status", prod_status);
		 */
		
		return "product_detail";
	}

}
