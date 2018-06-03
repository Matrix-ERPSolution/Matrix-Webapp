package com.itss.matrix.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.ManualDAO;

public class GetRecommendedTasksAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String date = request.getParameter("date");
		List<Map> list = new ManualDAO().getRecommendedTasks(date);
		List spaces = new ArrayList<>();
		for(Map map : list){
			Object space = map.get("SPACE_TYPE");
			if(!spaces.contains(space)){
				spaces.add(space);
			}
		}
		request.setAttribute("spaces", spaces);
		request.setAttribute("tasks", list);
		return "results/getRecommendedTasks.jsp";
	}

}
