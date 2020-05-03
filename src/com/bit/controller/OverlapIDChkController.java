package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.AjaxCommand;
import com.bit.model.OverlapIDChkCommand;


@WebServlet("/overlap_id_chk")
public class OverlapIDChkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OverlapIDChkController() {
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
		AjaxCommand comm = new OverlapIDChkCommand();
		int result = comm.exec(request, response);
		out.println(result);
	}

}
