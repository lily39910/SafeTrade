package com.bit.model;

public class Paging {
	//전체 게시물의 수 구하기
	//각 페이지의 시작번호와 끝번호 구하기
	//페이지의 묶음인 블록 시작
	
	private int nowPage = 1; //현재페이지
	private int nowBlock = 1; //현재 블록
	private int totalRecord = 0; //전체 게시물의 수(원 글 수)
	private int numPerPage = 9; //한 페이지에 존재하는 원글의 수
	private int pagePerBlock = 3; //블록당 페이지의 수
	private int totalPage = 0; //전체 페이지 수
	private int totalBlock = 0; //전체 블록의 수
	
	
	//결국 구하고자 하는 값은 아래의 값들
	private int begin = 0; //시작 페이지
	private int end = 0; //끝 페이지
	private int beginPage = 0; //블록의 시작 번호
	private int endPage = 0; //블록의 끝 번호
	
	//전체 게시물의 수를 가지고 전체 페이지의 수를 구하자
	//totalPage = 전체 게시물의 수(레코드 수) / numPerPage
	//주의사항 : 나머지가 존재하면 totalPage + 1 
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if(totalRecord % numPerPage != 0) {
			totalPage ++;
		}
	}
	
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
