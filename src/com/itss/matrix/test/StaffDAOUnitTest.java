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
		//Collection<Map> list = dao.getStaffHistory("chanyoung");
		//dao.setJoinDate("chanyoung", 1);
		
		//removeStaff
		
		//setLeaveDate
		
		
		//getLeftStaffs
		
		assertNotNull(dao.getStaffDetail("chanyoung", 1));
		
		//addStaff
		//여기부터
		//현재상황
		//dao.getStaffHistory("chanyoung")
		
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
		assertEquals(dao.getPreStaffs(2).size(), 0);
	}
	
	/**한 지점에 이미 등록된 직원인데 같은 지점에 인증요청하는 경우*/
	@Test
	public void addExistStaff(){
		int cnt = dao.getStaffHistory("chanyoung").size();
		dao.addStaff("chanyoung", 1, null, null, null, null, null);
		assertEquals(cnt, dao.getStaffHistory("chanyoung").size());
		//예외처리 미구현
	}
	
	/**비기능테스트명
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
	
}
