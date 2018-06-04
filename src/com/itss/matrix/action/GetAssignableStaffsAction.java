package com.itss.matrix.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetAssignableStaffsAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> workingStaffs = null;
		workingStaffs = new StaffDAO().getWorkingStaffs(Integer.parseInt((String)request.getSession(true).getAttribute("branchSeq")));
		request.setAttribute("workingStaffs", workingStaffs);
		return "results/getAssignableStaffs.jsp";
	}

}
