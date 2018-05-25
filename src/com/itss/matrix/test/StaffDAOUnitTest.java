package com.itss.matrix.test;

import static org.junit.Assert.*;

import java.util.Collection;
import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.itss.matrix.model.StaffDAO;
import com.itss.matrix.model.StaffVO;

public class StaffDAOUnitTest {
	static StaffDAO dao;
	static StaffVO vo;
	@BeforeClass
	public static void beforeClass(){
		dao = new StaffDAO();
	}
	
	/**기능 테스트*/
	@Test
	public void correctUnitTest(){
		assertNotNull(dao.getWorkParts(1));
		
		assertNotNull(dao.getWorkingStaffs(1));
		
		assertNotNull(dao.getPreStaffs(1));
		
		//dao.setJoinDate("chanyoung", 2);	//ok
		//assertFalse(dao.isStaffDate("chanyoung", 2, "2018/05/25", null));
		
		//removeStaff 미구현
		
		//dao.setLeaveDate("chanyoung", 1);
		//assertFalse(dao.isStaffDate("chanyoung", 1, "2018/05/25", "2018/05/25"));
		//테스트과정getLeftStaffs로 수정해야함
		
		assertNotNull(dao.getLeftStaffs(1));
		
		//addStaff
		//cmd 창에서 확인은 되는데 void 확인 코드를 어떻게 작성할지 미구현
		//dao.addStaff("chanyoung", 3, null, null, null, null, null);
		
		//setStaffInfo 미구현
		
		//setWorkPart 미구현
		
	}
	
	/**없는 지점의 소속파트 가져오기*/
	@Test
	public void getWorkPartsWithNonexistBranch(){
		assertEquals(dao.getWorkParts(99).size(), 0);
	}
	
	/**없는 지점의 직원목록 가져오기*/
	@Test
	public void getWorkingStaffsWithNonexistBranch(){
		assertEquals(dao.getWorkingStaffs(99).size(), 0);
	}
	
	/**없는 지점의 직원 인증요청 목록 가져오기*/
	@Test
	public void getPreStaffsWithNonexistBranch(){
		assertEquals(dao.getPreStaffs(99).size(), 0);
	}
	
	/**있는 지점에 인증요청한 직원이 없는 경우*/
	@Test
	public void getNonexistPreStaffs(){
		assertEquals(dao.getPreStaffs(99).size(), 0);
	}
	
	/**이미 인증요청 수락한(재직중인) 직원을 재수락하는 경우*/
	@Test
	public void setJoinDateWithExistStaff(){
		//dao.setJoinDate("chanyoung", 2);
		assertFalse(dao.isStaffDate("chanyoung", 2, "2018/05/25", null));
	}
	
	/**인증요청하지 않은 직원의 입사일을 등록하는 경우(users에는 있지만 staffs에는 없는 경우)*/
	@Test
	public void setJoinDateWithoutAddStaff(){
		//dao.setJoinDate("tester01", 1);
		assertFalse(dao.isStaffDate("testser01", 1, "2018/05/25", null));
	}
	
	/**재직중인 직원인데 인증요청하는 경우(입사일을 덮어씌우는 경우)-예외처리 필요*/
	@Test
	public void addExistStaff(){
		//dao.addStaff("chanyoung", 2, null, null, null, null, null);
		assertFalse(dao.isStaffDate("chanyoung", 2, null, null));
	} //JUnit:failure
	
	/**인증요청한 직원이 계속 인증요청 하는 경우-예외처리 필요*/
	@Test
	public void addStaffAgain(){
		Collection<Map<String,String>> list = dao.getPreStaffs(3);
		//dao.addStaff("chanyoung", 3, null, null, null, null, null);
		assertEquals(list, dao.getPreStaffs(3));
	}	//JUnit:failure
	
	/**
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
	
	/**비기능테스트명
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
}
