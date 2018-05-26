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
//		assertNotNull(dao.getWorkParts(1));
		
//		assertNotNull(dao.getWorkingStaffs(1));
		
//		assertNotNull(dao.getPreStaffs(1));
//		assertEquals(dao.getPreStaffs(99).size(), 0);	//있는 지점에 인증요청한 직원이 없는 경우
		
//		int cnt = dao.getWorkingStaffs(2).size();
//		dao.setJoinDate("chanyoung", 2);
//		assertEquals(cnt+1, dao.getWorkingStaffs(2).size());
		
//		removeStaff 미구현
		
//		cnt = dao.getLeftStaffs(2).size();
//		dao.setLeaveDate("chanyoung", 2);
//		assertEquals(cnt+1, dao.getLeftStaffs(2).size());
		
//		assertNotNull(dao.getLeftStaffs(1));
		//퇴사한 직원이 없는 경우 결과값 <[]>
		
//		assertNotNull(dao.getStaffDetail("chanyoung", 1));
		
//		cnt = dao.getPreStaffs(3).size();
//		dao.addStaff("chanyoung", 2, null, null, null, null, null);
//		assertEquals(cnt+1, dao.getPreStaffs(3).size());
		
//		setStaffInfo 미구현
		
//		dao.setWorkPart("오픈", "chanyoung", 2);
//		dao.setWorkPart(null, "chanyoung", 2);	//소속파트를 없음(null)로 변경
		
	}
	/**(공통)지점코드 입력 가능범위 초과 시
	@Test
	public void getWorkPartsWithOutofboundsBranchSeq(){
		assertEquals(dao.getWorkParts(83374949).size(),0);	//결과값: <[]>
	}*/
	
	/**없는 지점의 소속파트 가져오기
	@Test
	public void getWorkPartsWithWrongBranchSeq(){
		assertEquals(dao.getWorkParts(99).size(), 0);
	}*/
	
	/**없는 지점의 직원목록 가져오기
	@Test
	public void getWorkingStaffsWithWrongBranchSeq(){
		assertEquals(dao.getWorkingStaffs(99).size(), 0);
	}*/
	
	/**없는 지점의 직원 인증요청 목록 가져오기
	@Test
	public void getPreStaffsWithNonexistBranch(){
		assertEquals(dao.getPreStaffs(99).size(), 0);
	}*/
	
	/**이미 인증요청 수락한(재직중인) 직원을 재수락하는 경우
	@Test
	public void setJoinDateWithExistPreStaff(){
		dao.setJoinDate("chanyoung", 2);
		assertFalse(dao.isStaffDate("chanyoung", 2, "2018/05/25", null));
	}*/
	
	/**인증요청하지 않은 직원의 입사일을 등록하는 경우(회원이지만 인증요청X|비회원)
	@Test
	public void setJoinDateWithoutAddStaff(){
		dao.setJoinDate("tester01", 1);
		assertFalse(dao.isStaffDate("testser01", 1, "2018/05/25", null));
	}*/
	
	/**이미 퇴사한 직원을 퇴사시키려는 경우-예외처리 필요
	@Test
	public void setLeaveDateWithLeftStaff(){
		dao.setLeaveDate("chanyoung", 1);	//안되야하는데 됨
		assertFalse(dao.isStaffDate("chanyoung", 1, "2018/03/25", "2018/05/26"));
	}*/
	
	/**인증요청만 하고 승인 안 된 직원을 퇴사시키는 경우
	@Test
	public void setLeaveDateWithPreStaff(){
		dao.setLeaveDate("chanyoung", 3);
		assertFalse(dao.isStaffDate("chanyoung", 3, null, "2018/05/26"));
	}*/
	
	/**인증요청하지 않은 직원의 퇴사일을 등록하는 경우//존재하지 않는 회원의 경우
	@Test
	public void setLeaveDateWithWrongStaff(){
		dao.setLeaveDate("tester01", 1);
		assertFalse(dao.isStaffDate("tester01", 1, null	, "2018/05/26"));
	}*/
	
	/**없는 지점의 퇴사직원 목록 조회
	@Test
	public void getLeftStaffsWithWrongBranchSeq(){
		assertEquals(dao.getLeftStaffs(99).size(), 0);
	}*/

	/**없는 지점의 직원 상세 보기
	@Test
	public void getStaffDetailWithWrongBranchSeq(){
		assertNull(dao.getStaffDetail("chanyoung", 99));
	}*/
	
	/**없는 직원 상세 보기
	@Test
	public void getStaffDetailWithWrongStaffId(){
		assertNull(dao.getStaffDetail("tester99", 1));
	}*/
	
	/**재직중인 직원인데 인증요청하는 경우(입사일을 덮어씌우는 경우)-예외처리 필요
	@Test
	public void addStaffWithExistStaff(){
		dao.addStaff("chanyoung", 2, null, null, null, null, null);
		assertFalse(dao.isStaffDate("chanyoung", 2, null, null));
	}*/ //JUnit:failure
	
	/**인증요청한 직원이 계속 인증요청 하는 경우-예외처리 필요
	@Test
	public void addStaffWithPreStaff(){
		int cnt = dao.getPreStaffs(3).size();
		dao.addStaff("chanyoung", 3, null, null, null, null, null);
		assertNotEquals(cnt+1, dao.getPreStaffs(3).size());
	}*/	//JUnit:failure
	
	/**setStaffInfo 비기능테스트
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
	
	/***/
	@Test
	public void sdf(){
	}
	
	/**비기능테스트명
	@Test
	public void 비기능_테스트_메소드명(){
		//assert....
	}*/
}

