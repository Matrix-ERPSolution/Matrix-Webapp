package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class RemoveDailyTaskAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String dailyTask = request.getParameter("dailyTask");
		String assignDate = request.getParameter("assignDate");
		String assignType = request.getParameter("assignType");
		String assignDetail = request.getParameter("assignDetail");
		
		new DailyDAO().removeDailyTask(dailyTask, assignDate, assignType, assignDetail);
		
		return "results/succeed.jsp";
	}

}
