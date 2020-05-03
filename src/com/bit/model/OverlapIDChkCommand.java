package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.mybatis.DAO;

public class OverlapIDChkCommand implements AjaxCommand {
	@Override
	public int exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		int member_count = DAO.checkID(id);
		
		return member_count;
	}

}
