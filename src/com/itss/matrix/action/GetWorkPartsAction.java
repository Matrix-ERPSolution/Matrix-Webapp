package com.itss.matrix.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetWorkPartsAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		List<String> workParts = new StaffDAO().getWorkParts(((BigDecimal)request.getSession().getAttribute("branchSeq")).intValue());
		String page = "results/getWorkParts.jsp";
		request.setAttribute("workParts", workParts);
		
		return page;
	}

}
