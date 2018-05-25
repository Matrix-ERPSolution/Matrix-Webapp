package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.UserDAO;

public class LoginAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String result = "";
		if(new UserDAO().login(id,pw)){
			session.setAttribute("userId", id);
			result = "controller?cmd=headerAdminUI";
		}
		return result;
	}

}