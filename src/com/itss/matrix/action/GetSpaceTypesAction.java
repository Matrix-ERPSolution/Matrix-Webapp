package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class GetSpaceTypesAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		List<String> types = null;
		types = new ManualDAO().getSpaceTypes();
		request.setAttribute("types", types);
		request.setAttribute("mode", "spaceType");
		return "results/getAccordion.jsp";
	}

}
