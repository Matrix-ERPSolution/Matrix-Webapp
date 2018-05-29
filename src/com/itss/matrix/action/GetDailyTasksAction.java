package com.itss.matrix.action;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;
import com.itss.matrix.model.ManualDAO;

public class GetDailyTasksAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String assignDate = request.getParameter("assignDate");
		String assignDetail = request.getParameter("assignDetail");
		Collection<Map<String, String>> tasks = null;
		tasks = new DailyDAO().getDailyTasksForParts(assignDate, assignDetail);
		request.setAttribute("tasks", tasks);
		return "results/getDailyTasks.jsp";
	}

}
