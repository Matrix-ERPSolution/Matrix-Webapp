package com.itss.matrix.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;

public class GetUserIdByPhoneNumAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String phoneNum = request.getParameter("phoneNum");
		String result=new UserDAO().getUserIdByPhoneNum(phoneNum);
		request.setAttribute("result", result);
		
		return "results/getContent.jsp";
	}

}
