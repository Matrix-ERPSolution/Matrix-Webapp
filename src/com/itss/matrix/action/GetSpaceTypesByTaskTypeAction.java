package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class GetSpaceTypesByTaskTypeAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String taskType = request.getParameter("taskType");
		List<String> types = null;
		types = new ManualDAO().getSpaceTypesByTaskType(taskType);
		request.setAttribute("types", types);
		request.setAttribute("mode", "spaceType");
		return "results/getSubAccordion.jsp";
	}

}
