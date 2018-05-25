package com.itss.matrix.test;

import com.itss.matrix.model.StaffDAO;

public class StaffDAOTest {
	public static void main(String[] args) {
		StaffDAO dao = new StaffDAO();
		//System.out.println(dao.getWorkParts(1));
		//System.out.println(dao.isStaffDate("chanyoung", 1, "2018/01/19", "2018/05/25"));
		System.out.println(dao.isStaffDate("chanyoung", 1, null, null));
		System.out.println("end");
	}

}
