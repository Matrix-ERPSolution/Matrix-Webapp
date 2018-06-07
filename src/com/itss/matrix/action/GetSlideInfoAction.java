package com.itss.matrix.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.UserDAO;

public class GetSlideInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		String type = (String)session.getAttribute("type");

		Map<String, String> result = new HashMap();
		
		if(type.equals("admin")){
			result = new UserDAO().getAdminSlideInfo(id);
		} else if(type.equals("staff")){
			result = new UserDAO().getStaffSlideInfo(id);
		}
		
		request.setAttribute("info", result);
		
		String page = "results/getSlideInfo.jsp";
		return page;
	}

}
