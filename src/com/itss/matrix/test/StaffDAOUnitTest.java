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
		
		//setJoinDate
		//isStaff 확인 하기 위한 sql문
		//select branch_seq, join_date, leave_date from staffs where staff_id='chanyoung';
		assertTrue(dao.isStaffDate("chanyoung", 1, null, null));
		dao.setJoinDate("chanyoung", 1);
		assertTrue(dao.isStaffDate("chanyoung", 1, "2018/05/25", null));
		
		//removeStaff
		
		//setLeaveDate
		assertFalse(dao.isStaffDate("chanyoung", 1, "2018/01/19", null));
		dao.setLeaveDate("chanyoung", 1);
		
		//getLeftStaffs
		assertNotNull(dao.getStaffDetail("chanyoung", 1));
		
		//addStaff
		//cmd 창에서 확인은 되는데 void 확인 코드를 어떻게 작성할지 미구현
		dao.addStaff("chanyoung", 1, null, null, null, null, null);
		
		//setStaffInfo
		
		//setWorkPart
		
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
	
	/**재직중인 직원인데 인증요청하는 경우(인증요청 안 한 경우는 UI에서 처리)*/
	@Test
	public void addExistStaff(){
		//dao.addStaff("chanyoung", 1, null, null, null, null, null);
	}
	
	/**비기능테스트명
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
	
}
