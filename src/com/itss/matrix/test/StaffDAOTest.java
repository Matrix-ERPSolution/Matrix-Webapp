package com.itss.matrix.test;

import com.itss.matrix.model.StaffDAO;

public class StaffDAOTest {
	public static void main(String[] args) {
		StaffDAO dao = new StaffDAO();
		//System.out.println(dao.getWorkParts(1));
		//System.out.println(dao.isStaffDate("chanyoung", 1, "2018/01/19", "2018/05/25"));
		//System.out.println(dao.getStaffDetail("chanyoung", 3));
		//dao.setStaffInfo("chanyoung", 1, "00000000", "00000000", "00000000", "00000000", "00000000");
		//System.out.println(dao.isFileFormat("resume.doc"));
		dao.addStaff("chanyoung", 3, null, "12$#^", null, null, null);
		//System.out.println(dao.isNumberFormat("./1#$2"));
		
		
		System.out.println("end");
	}

}
