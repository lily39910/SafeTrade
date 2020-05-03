package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Command;
import com.bit.model.ProductCommentCommand;


@WebServlet("/ProductCommentController")
public class ProductCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ProductCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		PrintWriter out = response.getWriter();
		
		Command comm = new ProductCommentCommand();
		String result = comm.exec(request, response);
		
		out.println(result);
	}

}
