package com.itss.matrix.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.UserDAO;

/** getCertifiedInfo==null -> certification
 * !=null && type=admin -> headerAdminUI
 * !=null && type=staff -> headerStaffUI */
public class GetCertifiedInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String userId = (String)request.getSession().getAttribute("userId");
		String result = "controller?cmd=certificationUI";
		
		Map user = new UserDAO().getCertifiedInfo(userId);
		if(user!=null) {
			String type = (String)user.get("type");
			HttpSession session = request.getSession(true);
			if(type.equals("admin")) {
				result="controller?cmd=dailyTaskAdminUI";
				session.setAttribute("branchSeq", user.get("BRANCH_SEQ"));
				session.setAttribute("adminSeq", user.get("ADMIN_SEQ"));
			} else if(type.equals("staff")) {
				result="controller?cmd=dailyTaskStaffUI";
				session.setAttribute("branchSeq", user.get("BRANCH_SEQ"));
				session.setAttribute("staffName", user.get("NAME"));
			}
			session.setAttribute("type", type);
		} 

		request.setAttribute("result", result);
		return "results/getContent.jsp";
	}
}
