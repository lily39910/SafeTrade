package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MemberVO;
import com.bit.mybatis.QnAVO;

public class QACommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String board = req.getParameter("board");
		String qa_num = req.getParameter("qa_num");
		String path = "";
		QnAVO qa = null;
				
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
				
		int result = 0;
		
		if(board == null) {
			List<QnAVO> list = DAO.getQAList(user.getId());
			req.setAttribute("list", list);
			path = "qa.jsp";
		}
		else {
			switch (board) {
				case "write":
					path="qa_write.jsp";
				break;
				
				case "modify":
					qa = DAO.getDetailQA(qa_num);
					req.setAttribute("qa", qa);
					path="qa_update.jsp";
				break;
				
				case "detail":
					qa = DAO.getDetailQA(qa_num);
					req.setAttribute("qa_vo", qa);
					path = "qa_detail.jsp";
				break;
				
				case "write_ok":
					qa = new QnAVO();
					qa.setQa_content(req.getParameter("qa_content"));
					qa.setQa_writer_id(user.getId());
					qa.setQa_pwd(req.getParameter("qa_pwd"));
					qa.setQa_group(req.getParameter("qa_group"));
										
					result = DAO.insertQA(qa);
					path = "mypage";
				break;
				
				case "modify_ok":
					qa = new QnAVO();					
					qa.setQa_num(req.getParameter("qa_num"));				
					qa.setQa_content(req.getParameter("qa_content"));
					qa.setQa_group(req.getParameter("qa_group"));
				
					result = DAO.updateQA(qa);
					path = "q_a?board=detail&qa_num="+ qa.getQa_num();
				break;
				
				case "delete_ok":
					result = DAO.deleteQA(qa_num);
					path = "main";
				break;
			}
		}
		return path;
	}
}
