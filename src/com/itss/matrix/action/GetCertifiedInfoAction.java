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
				result="controller?cmd=headerAdminUI";
			} else if(type.equals("staff")) {
				result="controller?cmd=headerStaffUI";
			}
			session.setAttribute("type", type);
			session.setAttribute("branchSeq", user.get("branchSeq"));
		} 

		request.setAttribute("result", result);
		return "results/getContent.jsp";
	}
}
