package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;

public class IsUserPhoneAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String phoneNum = request.getParameter("phoneNum");
		boolean result =false;
		result=new UserDAO().isUserPhoneNum(phoneNum);
		request.setAttribute("result", result);
		
		return "results/isExist.jsp";
		
	}

}
