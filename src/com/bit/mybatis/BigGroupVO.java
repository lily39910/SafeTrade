package com.bit.mybatis;

//제품 대분류 관련 테이블
public class BigGroupVO {
	private String big_group_num, big_group_name, menu_group_num;

	
	public String getBig_group_num() {
		return big_group_num;
	}

	public void setBig_group_num(String big_group_num) {
		this.big_group_num = big_group_num;
	}

	public String getBig_group_name() {
		return big_group_name;
	}

	public void setBig_group_name(String big_group_name) {
		this.big_group_name = big_group_name;
	}

	public String getMenu_group_num() {
		return menu_group_num;
	}

	public void setMenu_group_num(String menu_group_num) {
		this.menu_group_num = menu_group_num;
	}
}
