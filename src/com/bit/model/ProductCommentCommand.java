package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.mybatis.DAO;
import com.bit.mybatis.SellingCMTVO;

public class ProductCommentCommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String selling_list_num = req.getParameter("product_num");
		
		String result = "<?xml version='1.0' encoding='UTF-8'?>";
		result += "<comments>";

		List<SellingCMTVO> comment = DAO.getProductDetailComment(selling_list_num);

		for(SellingCMTVO k : comment) {
			result += "<comment>";
			result += "<selling_cmt_num>" + k.getSelling_list_cmt_num() + "</selling_cmt_num>";
			result += "<selling_cmt_writer>" + k.getSelling_list_cmt_writer() + "</selling_cmt_writer>";
			result += "<selling_cmt_content>" + k.getSelling_list_cmt_content() + "</selling_cmt_content>";
			result += "<selling_cmt_date>" + k.getSelling_list_cmt_date() + "</selling_cmt_date>";
			result += "<trouble_state>" + k.getTrouble_state() + "</trouble_state>";
			result += "<selling_list_num>" + k.getSelling_list_num() + "</selling_list_num>";
			result += "<comment_step>" + k.getComment_step() + "</comment_step>";
			result += "<comment_level>" + k.getComment_level() + "</comment_level>";
			result += "</comment>";
		}
		result += "</comments>";
		
		return result;
	}
}
