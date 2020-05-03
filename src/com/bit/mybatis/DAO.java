package com.bit.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSession() {
		if(ss == null) {
			ss = DBService.getFactory().openSession();
		}
		return ss;
	}
	
	/*메뉴바 메뉴*/
	public static List<MenuGroupVO> getMenu() {
		return getSession().selectList("menu");
	}
	
	
	/*로그인*/
	public static MemberVO getUserChk(MemberVO mvo) {
		MemberVO user = getSession().selectOne("user", mvo);
		return user;
	}
	
	
	/*아이디 중복 체크*/
	public static int checkID(String id) {
		MemberVO member = getSession().selectOne("checkID",id);
		int member_count = 0;
		if(member != null) {
			member_count = 1;
		}
		return member_count;
	}
	
	/*회원가입*/
	public static int insertMemberJoin(MemberVO mvo) {
		int result = 1;
		try {
			getSession().insert("memberjoinInsert", mvo);
			getSession().commit();
		} catch (Exception e) {
			// TODO: handle exception
			result = 0;
		}
		return result;
	}
	
	/*제품 리스트(전체)*/
	public static List<SellingListVO> getProductAllList(){
		return getSession().selectList("productAllList");
	}
	
	/*제품 상세정보*/
	public static SellingListVO getProductDetail(String selling_list_num){
		return getSession().selectOne("productDetail", selling_list_num);
	}
	
	/*제품 등록*/
	public static int insertProduct(SellingListVO product) {
		int result = 0;
		try {
			getSession().insert("insertProduct", product);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return result;
	}
	
	/*제품 수정*/
	public static int updateProduct(SellingListVO product) {
		int result = 0;
		try {
			getSession().update("updateProduct", product);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return result;
	}
	
	/*제품 삭제*/
	public static int deleteProduct(String selling_list_num) {
		int result = 0;
		try {
			getSession().update("deleteProduct", selling_list_num);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/*제품 신고*/
	public static int troubleProduct(String selling_list_num) {
		int result = 0;
		try {
			getSession().update("troubleProduct", selling_list_num);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/*제품 신고 확인 처리(삭제 처리)*/
	public static int troubleProductDecide(String selling_list_num) {
		int result = 0;
		try {
			getSession().update("troubleProductDecide", selling_list_num);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/*내가 등록한 제품 리스트*/
	public static List<SellingListVO> getMyProducts(String seller_id){
		return getSession().selectList("myProduct", seller_id);
	}
	
	/*제품 판매 중지*/
	public static int stop_sell(String selling_list_num) {
		int result = 0;
		try {
			getSession().update("stopSell", selling_list_num);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/*구매 내역 조회*/
	public static List<TradeVO> getTradeList(String purchaser_id) {		
		return getSession().selectList("tradeAllList", purchaser_id);
	}
	
	
	/*구매 신청*/
	public static int tradeStart(TradeVO trade) {
		int result = 0;
		try {
			getSession().insert("tradeStart", trade);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return result;
	}
	
	/*구매 과정 변경*/
	public static int tradeProgress(TradeVO trade) {
		int result = 0;
		try {
			getSession().update("tradeProgress", trade);
			getSession().commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return result;
	}
	
	
	/*Q&A 등록*/
	public static int insertQA(QnAVO qa) {
		int result = 0;
		try {
			getSession().insert("insertQA", qa);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return result;
	}
	
	/*Q&A 수정*/
	public static int updateQA(QnAVO qa) {
		int result = 0;
		try {
			getSession().update("updateQA", qa);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return result;
	}
	
	/*Q&A 삭제*/
	public static int deleteQA(String qa_num) {
		int result = 0;
		try {
			getSession().update("deleteQA", qa_num);
			getSession().commit();
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	/*Q&A 상세 정보*/
	public static QnAVO getDetailQA(String qa_num){
		return getSession().selectOne("detailQA", qa_num);
	}
	
	/*Q&A 리스트*/
	public static List<QnAVO> getQAList(String qa_writer_id){
		return getSession().selectList("QAList", qa_writer_id);
	}
	
	/*제품 댓글*/
	public static List<SellingCMTVO> getProductDetailComment(String selling_list_num){
		return getSession().selectList("detailComment", selling_list_num);
	}

}
