package com.itss.matrix.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetWorkingStaffsAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> workingStaffs = null;
		workingStaffs = new StaffDAO().getWorkingStaffs(((BigDecimal)request.getSession(true).getAttribute("branchSeq")).intValue());
		request.setAttribute("workingStaffs", workingStaffs);
		return "results/getWorkingStaffs.jsp";
	}

}
