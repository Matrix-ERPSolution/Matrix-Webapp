package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetWorkPartsAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		List<String> result = new StaffDAO().getWorkParts(Integer.parseInt((String)request.getSession().getAttribute("branchSeq")));
		String page = "results/getWorkParts.jsp";
		request.setAttribute("result", result);
		
		return page;
	}

}
