package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class HomeUI implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String type = (String)request.getSession().getAttribute("type");
		
		String page = "results/error.jsp";
		if(type == null){
			page = "login.jsp";
		} else if(type.equals("staff")){
			page = "dailyTaskStaff.jsp";
		} else if(type.equals("admin")) {
			page = "dailyTaskAdmin.jsp";
		}
		return page;
	}

}
