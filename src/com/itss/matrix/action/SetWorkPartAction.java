package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class SetWorkPartAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		new StaffDAO().setWorkPart(request.getParameter("staffId"), Integer.parseInt((String)request.getSession().getAttribute("branchSeq")), request.getParameter("workPart"));
		return "results/succeed.jsp";
	}

}
