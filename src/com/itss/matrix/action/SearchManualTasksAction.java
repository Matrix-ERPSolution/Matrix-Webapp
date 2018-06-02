package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class SearchManualTasksAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String inputText = request.getParameter("inputText");
		List<Map> result = new ManualDAO().searchManualTasks(inputText);
		String page = "results/searchManualTasks.jsp";
		request.setAttribute("result", result);
		
		return page;
	}

}
