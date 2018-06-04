package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;
import com.itss.matrix.model.UserDAO;

public class IsDailyTaskAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String dailyTask = request.getParameter("dailyTask");
		String assignDate = request.getParameter("assignDate");
		boolean result =false;
		result=new DailyDAO().isDailyTask(dailyTask, assignDate);
		request.setAttribute("result", result);
		
		return "results/isExist.jsp";
	}

}
