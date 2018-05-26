package com.itss.matrix.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;

public class GetSlideInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("userId");

		Map<String, String> result = new HashMap();
		result = new UserDAO().getAdminSlideInfo(id);
		System.out.println(result);
		request.setAttribute("info", result);
		
		String page = "results/getSlideInfo.jsp";
		return page;
	}

}
