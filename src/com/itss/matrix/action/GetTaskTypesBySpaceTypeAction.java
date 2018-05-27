package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class GetTaskTypesBySpaceTypeAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String spaceType = request.getParameter("spaceType");
		List<String> types = null;
		types = new ManualDAO().getTaskTypesBySpaceType(spaceType);
		request.setAttribute("types", types);
		request.setAttribute("mode", "taskType");
		return "results/getSubAccordion.jsp";
	}

}
