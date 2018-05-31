package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class SetDailyTaskAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String oldDailyTask = request.getParameter("oldDailyTask");
		String newDailyTask = request.getParameter("newDailyTask");
		String assignDate = request.getParameter("assignDate");
		String assignDetail = request.getParameter("assignDetail");
		
		new DailyDAO().setDailyTask(newDailyTask, oldDailyTask, assignDate, assignDetail);
		
		return "results/succeed.jsp";
	}

}
