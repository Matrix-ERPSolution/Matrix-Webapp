package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class SetDailyAssignAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String oldAssignType = request.getParameter("oldAssignType");
		String oldAssignDetail = request.getParameter("oldAssignDetail");
		String dailyTask = request.getParameter("dailyTask");
		String assignDate = request.getParameter("assignDate");
		String newAssignType = request.getParameter("newAssignType");
		String newAssignDetail = request.getParameter("newAssignDetail");
		
		new DailyDAO().setDailyAssign(newAssignType, newAssignDetail, assignDate, oldAssignType, oldAssignDetail, dailyTask);

		return "results/succeed.jsp";
	}

}
