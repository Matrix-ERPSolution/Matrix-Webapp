package com.itss.matrix.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.DailyDAO;

public class GetAssignedPartsAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String assignDate = request.getParameter("date");
		List<String> parts = null;
		DailyDAO dao = new DailyDAO();
		parts = dao.getAssignedParts(assignDate);
		boolean personal = true;
		List list = dao.getDailyTasksForPerson(assignDate);
		if(list == null){
			personal = false;
		} else if(list.isEmpty()){
			personal = false;
		}
		request.setAttribute("parts", parts);
		request.setAttribute("personal", personal);
		return "results/getAssignedParts.jsp";
	}

}
