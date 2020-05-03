package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Command;
import com.bit.model.SellProductCommand;


@WebServlet("/sell_product")
public class SellProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public SellProductController() {
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
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		/*Command comm = null;
		String state = request.getParameter("state");
		
		switch (state) {
			case "write":
				comm = new SellProductWrite();
			break;
			
			case "modify":
				//comm = new SellProductModify();
			break;
		}*/
		
		Command comm = new SellProductCommand();
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
