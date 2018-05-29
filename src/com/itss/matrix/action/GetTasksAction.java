package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class GetTasksAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String spaceType = request.getParameter("spaceType");
		String taskType = request.getParameter("taskType");
		List<Map> tasks = null;
		tasks = new ManualDAO().getTasks(spaceType, taskType);
		request.setAttribute("tasks", tasks);
		return "results/getTasks.jsp";
	}

}
