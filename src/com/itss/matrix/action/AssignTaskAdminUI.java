package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class AssignTaskAdminUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		return "assignTaskAdmin.jsp";
	}

}
