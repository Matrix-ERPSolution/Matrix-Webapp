package com.itss.matrix.action;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.itss.matrix.model.StaffDAO;

public class GetLeftStaffsAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		Collection<Map<String, String>> leftStaffs = null;
		leftStaffs = new StaffDAO().getLeftStaffs(Integer.parseInt((String)request.getSession(true).getAttribute("branchSeq")));
		request.setAttribute("leftStaffs", leftStaffs);
		return "results/getLeftStaffs.jsp";
	}

}
