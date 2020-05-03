package com.bit.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AjaxCommand {
	public int exec(HttpServletRequest req, HttpServletResponse res);
}
