package com.itss.matrix.test;

import org.junit.BeforeClass;
import org.junit.Test;

import com.itss.matrix.model.UserDAO;

public class StaffDAOUnitTest {
	static UserDAO dao;
	@BeforeClass
	public static void beforeClass(){
		dao = new UserDAO();
	}
	
	@Test
	public void correctUnitTest(){
		
	}
}
