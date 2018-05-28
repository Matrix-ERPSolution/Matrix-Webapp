package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		String page = "results/loginError.jsp";	
		if(new UserDAO().login(userId, pw)) {
			request.getSession().setAttribute("userId", userId);
			page= "results/loginOK.jsp";
		}
				
		return page;
	}
}
