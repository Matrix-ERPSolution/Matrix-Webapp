package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;

public class GetUserPhoneAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String result=new UserDAO().getUserPhoneNum(userId);
		request.setAttribute("result", result);
		
		return "results/getContent.jsp";
	}

}
