package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MemberVO;
import com.bit.mybatis.SellingListVO;
import com.bit.mybatis.TradeVO;

public class TradeCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		TradeVO trade_info = null;
		String trade = req.getParameter("trade");
		String path = null;
		
		switch(trade) {
			case "list":
				List<TradeVO> list = DAO.getTradeList(user.getId());
				session.setAttribute("mytrade", list);
				path = "myTrade.jsp";
			break;
		
			case "new":
				trade_info = new TradeVO();
				trade_info.setSelling_list_num(req.getParameter("selling_list_num"));
				trade_info.setTrade_price(req.getParameter("trade_price"));
				trade_info.setPurchaser_id(user.getId());
				trade_info.setSeller_id(req.getParameter("seller_id"));
				trade_info.setPurchase_count(req.getParameter("purchase_count"));
				trade_info.setDelivery_price(req.getParameter("delivery_price"));
				int result = DAO.tradeStart(trade_info);
				
				path = "main";
			break;
			
			case "progress":
				String trade_num = req.getParameter("trade_num");
				String process = req.getParameter("process");
				
				trade_info = new TradeVO();
				trade_info.setTrade_num(trade_num);
				trade_info.setTrade_state(process);
				
				DAO.tradeProgress(trade_info);
				path = "trade?trade=list";	
			break;
			
			
		}
		
		return path;
	}
	
}
