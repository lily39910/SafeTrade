package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MemberVO;

public class SignInCommand implements AjaxCommand {
	@Override
	public int exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPwd(pwd);
		
		MemberVO user = DAO.getUserChk(mvo);
		
		if(user != null) {
			session.setAttribute("login_chk", true);
			session.setAttribute("user", user);
			return 1;
		}
		else {
			session.setAttribute("login_chk", false);
			session.setAttribute("user", null);
			return 2;
		}	
	}
}
