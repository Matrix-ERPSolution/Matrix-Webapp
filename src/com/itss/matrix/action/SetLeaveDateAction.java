package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class SetLeaveDateAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		new StaffDAO().setLeaveDate(request.getParameter("staffId"), Integer.parseInt((String)request.getSession(true).getAttribute("branchSeq")));
		return "results/succeed.jsp";
	}

}
