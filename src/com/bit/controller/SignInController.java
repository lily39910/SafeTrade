package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.AjaxCommand;
import com.bit.model.Command;
import com.bit.model.ListCommand;
import com.bit.model.MemberJoin;
import com.bit.model.SignInCommand;


//회원가입 페이지
@WebServlet("/signin")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignInController() {
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
		response.setContentType("text/plain; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		AjaxCommand comm = new SignInCommand();
		int result = comm.exec(request, response);
		
		out.println(result);
	}

}
