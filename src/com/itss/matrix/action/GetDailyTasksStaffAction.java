package com.itss.matrix.action;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class GetDailyTasksStaffAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String assignDate = request.getParameter("assignDate");
		String assignType = request.getParameter("assignType");
		List<Map<String, String>> tasks = null;
		String page = "results/error.jsp";
		if(assignType.equals("개인")){
			tasks = new DailyDAO().getDailyTasksForPerson(assignDate);
			page = "results/getDailyTasksForPersonStaff.jsp";
		} else {
			tasks = new DailyDAO().getDailyTasksForParts(assignDate, assignType);
			page = "results/getDailyTasksForPartsStaff.jsp";
		}
		request.setAttribute("tasks", tasks);
		return page;
	}

}
