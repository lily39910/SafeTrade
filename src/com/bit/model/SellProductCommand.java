package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MemberVO;
import com.bit.mybatis.SellingListVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SellProductCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String state = req.getParameter("state");
		String selling_list_num = req.getParameter("product");
		String path = null;
		
		HttpSession session = req.getSession();
		MemberVO user =  (MemberVO) session.getAttribute("user"); //update일 경우 id값 필요
		String seller_id = user.getId();
		
		
		if(state.equals("write") || state.equals("modify")) {
			if(state.equals("modify")) {				
				path = "sell_product_modify.jsp";				
				
			}else {
				path = "sell_product_write.jsp";				
			}
		}
		else if(state.equals("write_ok") || state.equals("modify_ok")) {
			String imagePath = req.getServletContext().getRealPath("/products");
			try {
				MultipartRequest mr = new MultipartRequest(
						req, imagePath, 500*1024*1024, "utf-8", new DefaultFileRenamePolicy());
				
				SellingListVO product = new SellingListVO();
				product.setSelling_list_title(mr.getParameter("selling_list_title"));
				product.setMid_group_num(mr.getParameter("mid_group_num"));
				product.setSelling_product(mr.getParameter("selling_product"));
				product.setSelling_price(mr.getParameter("selling_price"));
				product.setSelling_count(mr.getParameter("selling_count"));
				product.setSelling_product_quality(mr.getParameter("selling_product_quality"));
				product.setDelivery_price(mr.getParameter("delivery_price"));
				product.setTrade_phone_num(mr.getParameter("trade_phone_num"));
				product.setSelling_list_content(mr.getParameter("selling_list_content"));
				//첨부파일 여부
				if(mr.getFile("selling_item_image") == null) {
					product.setSelling_item_image("");
				}
				else {
					product.setSelling_item_image(mr.getFilesystemName("selling_item_image"));
				}
				
				//DB처리
				//판매글 등록
				if(state.equals("write_ok")) {
					product.setSeller_id(seller_id);
					int result = DAO.insertProduct(product);
					path = "main";
				}
				//판매글 수정
				else if(state.equals("modify_ok")) {
					product.setSelling_list_num(mr.getParameter("selling_list_num"));
					int result = DAO.updateProduct(product);
					path = "mypage";
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error");
			}
		}
		else if(state.equals("delete_ok")) {
			DAO.deleteProduct(selling_list_num);
			path="";			
		}
		else if(state.equals("trouble")) {
			DAO.troubleProduct(selling_list_num);
			path="";
		}
		else if(state.equals("myproducts")) {
			List<SellingListVO> myproducts = DAO.getMyProducts(seller_id);
			req.setAttribute("myproducts", myproducts);
			path = "myProducts.jsp";
		}
		else if(state.equals("stop_sell")) {
			DAO.stop_sell(selling_list_num);
			path = "mypage";
		}
		return path;
	}	
}
