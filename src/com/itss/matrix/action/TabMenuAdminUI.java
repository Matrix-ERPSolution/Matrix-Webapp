package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class TabMenuAdminUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		return "tabMenuAdmin.jsp";
	}

}
