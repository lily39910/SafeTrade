package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.SellingListVO;

public class ProductDetailCommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String selling_list_num = req.getParameter("product_num");
		
		SellingListVO product = DAO.getProductDetail(selling_list_num);
		
		HttpSession session = req.getSession();
		session.setAttribute("product", product);
		
		return "product_detail.jsp";
	}
}
