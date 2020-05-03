package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Command;
import com.bit.model.MyPageCommand;


@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MyPageController() {
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
		
		Command comm = null;
		String menu = request.getParameter("menu");
		
		if(menu == null){
			comm = new MyPageCommand();
		}
		else {
			switch(menu){
				case "edit_myInfo": //개인정보 수정
					//comm = new ();
				break;
				
				case "purchase_list": //구매내역
					//comm = new ();
				break;
				
				case "selled_list": //판매내역
					//comm = new ();
				break;
				
				case "q_a_list": //Q&A
					//comm = new ();
				break;
			}
		}
		
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
