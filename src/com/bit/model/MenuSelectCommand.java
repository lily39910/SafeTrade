package com.bit.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.mybatis.DAO;
import com.bit.mybatis.MenuGroupVO;

public class MenuSelectCommand implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String result = "<?xml version='1.0' encoding='UTF-8'?>";
		result += "<menus>";
		List<MenuGroupVO> menu = DAO.getMenu();
		for(MenuGroupVO k : menu) {
			result += "<menu>";
			result += "<menu_group_num>" + k.getMenu_group_num() + "</menu_group_num>";
			result += "<menu_group_name>" + k.getMenu_group_name() + "</menu_group_name>";
			result += "</menu>";
		}
		result += "</menus>";
		
		return result;
	}
}
