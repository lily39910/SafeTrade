package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyPageCommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		if(session.getAttribute("login_chk") == null) {
			return "index.jsp";
		}
		else {
			return "myPage.jsp";			
		}
	}
}
