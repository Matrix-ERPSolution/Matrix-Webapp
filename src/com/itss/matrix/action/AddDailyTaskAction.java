package com.itss.matrix.action;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.DailyDAO;

public class AddDailyTaskAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String dailyTask = request.getParameter("dailyTask");
		String assignDate = request.getParameter("assignDate");
		int importance = Integer.parseInt(request.getParameter("importance"));
		String assignType = request.getParameter("assignType");
		String assignDetail = request.getParameter("assignDetail");
		int adminSeq = Integer.parseInt((String)session.getAttribute("adminSeq"));
		
		new DailyDAO().addDailyTask(dailyTask, assignDate, importance, assignType, assignDetail, adminSeq);
		return "results/succeed.jsp";
	}

}
