package com.itss.matrix.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetStaffDetailAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String staffId = request.getParameter("staffId");
		Map<Object, Object> staffDetail = null;
		staffDetail = new StaffDAO().getStaffDetail(staffId, Integer.parseInt((String)request.getSession(true).getAttribute("branchSeq")));
		request.setAttribute("staffDetail", staffDetail);
		return "results/getStaffDetail.jsp";
	}

}
