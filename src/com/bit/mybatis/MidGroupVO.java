package com.bit.mybatis;

//제품 중분류 관련 테이블
public class MidGroupVO {
	private String mid_group_num, mid_group_name, big_group_num;

	
	public String getMid_group_num() {
		return mid_group_num;
	}

	public void setMid_group_num(String mid_group_num) {
		this.mid_group_num = mid_group_num;
	}

	public String getMid_group_name() {
		return mid_group_name;
	}

	public void setMid_group_name(String mid_group_name) {
		this.mid_group_name = mid_group_name;
	}

	public String getBig_group_num() {
		return big_group_num;
	}

	public void setBig_group_num(String big_group_num) {
		this.big_group_num = big_group_num;
	}
	
	
}
