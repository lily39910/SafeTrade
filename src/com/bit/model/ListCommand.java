package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.SellingListVO;

public class ListCommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String list = req. getParameter("list");
		String category = req.getParameter("category");
		List<SellingListVO> products = null;
		
		if(list == null) {
			products = DAO.getProductAllList();
		}
		else {
			if(category == null) {
				
			}
			else {
				
			}
		}
				
		HttpSession session = req.getSession();
		session.setAttribute("products", products);
		
		
		return "product_list.jsp";
	}
}
