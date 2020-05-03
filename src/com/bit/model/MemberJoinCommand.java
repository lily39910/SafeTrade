package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MemberVO;

public class MemberJoinCommand implements AjaxCommand {
	@Override
	public int exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		MemberVO mvo = new MemberVO();
		mvo.setId(req.getParameter("id"));
		mvo.setPwd(req.getParameter("pwd"));
		mvo.setName(req.getParameter("name"));
		mvo.setAddress(req.getParameter("address"));
		mvo.setGender(req.getParameter("gender"));
		mvo.setPhone(req.getParameter("phone"));
		
		int result = DAO.insertMemberJoin(mvo);
		
		return result;
	}
}
