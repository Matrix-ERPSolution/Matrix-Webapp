package com.itss.matrix.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.UserDAO;
import com.itss.matrix.model.UserVO;

public class AddUserAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String page = "results/error.jsp";
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		String phoneNum = request.getParameter("phoneNum");
		String name = request.getParameter("name");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String gender = request.getParameter("gender");
		String emailAccount = request.getParameter("emailId");
		String emailDomain = request.getParameter("emailDomain");
		String addressCity = request.getParameter("addressCity");
		String addressGu = request.getParameter("addressGu");
		String addressDong = request.getParameter("addressDong");
		String profilePhoto = request.getParameter("profilePhoto");
		new UserDAO().addUser(userId, pw, phoneNum, name, birthYear, birthMonth, birthDay, gender, emailAccount, emailDomain, addressCity, addressGu, addressDong, profilePhoto);
		

		return page;
	}

}
