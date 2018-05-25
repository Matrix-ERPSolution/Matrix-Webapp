package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.UserDAO;

public class LoginAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean result = false; 
		result = new UserDAO().login(id,pw);
		
		String page = "error.jsp";
		
		if(result) {
			page = "headerAdmin.jsp";
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", id);
		}
		
		return page;
	}

}