package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Command;
import com.bit.model.ListCommand;

//메인 페이지
@WebServlet("/main")
public class SafeTradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SafeTradeController() {
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
		//String list = request.getParameter("list");
		//Command comm = null;
		
		
		/*
		//뭘하든 메인으로 가게?
		if(list != null) {
			switch (list) {
				
				case "masterpiece": //대분류 메뉴
					//comm = new ;
					comm = new MainCommand();
				break;
				//세분화 메뉴 선택 시..
			}
		}
		else {
			comm = new MainCommand();
		}
		*/
		
		
		Command comm = new ListCommand();		
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request,response);
	}

}
