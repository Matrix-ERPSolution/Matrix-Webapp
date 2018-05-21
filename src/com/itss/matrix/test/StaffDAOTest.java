package com.itss.matrix.test;

import com.itss.matrix.model.StaffDAO;

public class StaffDAOTest {

	public static void main(String[] args) {
		StaffDAO dao = new StaffDAO();
		
		System.out.println(dao.getWorkParts(1));

	}

}
