package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class HeaderAdminUI implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		return "headerAdmin.jsp";
	}

}
