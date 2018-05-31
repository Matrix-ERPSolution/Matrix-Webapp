package com.itss.matrix.action;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.StaffDAO;

public class GetPreStaffsAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Collection<Map<String, String>> preStaffs = null;
		preStaffs = new StaffDAO().getPreStaffs(Integer.parseInt((String)session.getAttribute("branchSeq")));
		request.setAttribute("preStaffs", preStaffs);
		return "results/getPreStaffs.jsp";
	}

}
