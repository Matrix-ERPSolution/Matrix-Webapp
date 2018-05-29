package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class GetAssignedPartsAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String assignDate = request.getParameter("date");
		List<String> parts = null;
		parts = new DailyDAO().getAssignedParts(assignDate);
		request.setAttribute("parts", parts);
		return "results/getAssignedParts.jsp";
	}

}
