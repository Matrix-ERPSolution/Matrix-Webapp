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
		
		int cnt = dao.getWorkingStaffs(2).size();
//		dao.setJoinDate("chanyoung", 2);
//		assertEquals(cnt+1, dao.getWorkingStaffs(2).size());
		
		Map staff = dao.getStaffDetail("chanyoung", 1);
//		dao.removeStaff("chanyoung", 1);
//		assertNotEquals(staff, dao.getStaffDetail("chanyoung", 1));
		//실행은 되는데 테스트과정 어떻게 확인해야할지 모르겠음
		
//		cnt = dao.getLeftStaffs(2).size();
//		dao.setLeaveDate("chanyoung", 2);
//		assertEquals(cnt+1, dao.getLeftStaffs(2).size());
		
//		assertNotNull(dao.getLeftStaffs(1));
		//퇴사한 직원이 없는 경우 결과값 <[]>
		
//		assertNotNull(dao.getStaffDetail("chanyoung", 1));
		
//		cnt = dao.getPreStaffs(3).size();
//		dao.addStaff("chanyoung", 1, null, null, null, null, null);
//		assertEquals(cnt+1, dao.getPreStaffs(3).size());
		
//		staff = dao.getStaffDetail("chanyoung", 2);
//		dao.setStaffInfo("chanyoung", 2, "하나은행", "11122222233333", "chanyoung_resume2.doc", "chanyoung_health2.png", "chanyoung_bank2.jpg");
//		assertNotEquals(staff, dao.getStaffDetail("chanyoung", 2));
		
//		dao.setWorkPart("오픈", "chanyoung", 2);
//		dao.setWorkPart(null, "chanyoung", 2);	//소속파트를 없음(null)로 변경
		
	}
	
	/**(공통)지점코드 입력 가능범위 초과 시-DAO 예외처리*/
	@Test
	public void getWorkPartsWithOutofboundsBranchSeq(){
		assertEquals(dao.getWorkParts(83374949).size(),0);	
	}
	
	/**없는 지점의 소속파트 가져오기-현재UI에서 불가능한 기능-DAO 예외처리	
	@Test
	public void getWorkPartsWithWrongBranchSeq(){
		assertEquals(dao.getWorkParts(99).size(), 0);
	}*/
	
	/**없는 지점의 직원목록 가져오기-DAO 예외처리
	@Test
	public void getWorkingStaffsWithWrongBranchSeq(){
		assertEquals(dao.getWorkingStaffs(99).size(), 0);
	}*/
	
	/**없는 지점의 직원 인증요청 목록 가져오기-DAO 예외처리
	@Test
	public void getPreStaffsWithNonexistBranchSeq(){
		assertEquals(dao.getPreStaffs(99).size(), 0);
	}*/
	
	/**이미 인증요청 수락한(재직중인) 직원을 재수락하는 경우-DAO 예외처리
	@Test
	public void setJoinDateWithExistStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 2);
		dao.setJoinDate("chanyoung", 2);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 2));
	}*/
	
	/**인증요청하지 않은 직원의 입사일을 등록하는 경우(회원이지만 인증요청X|비회원)-DAO 예외처리
	@Test
	public void setJoinDateWithoutAddStaff(){
		Map staff = dao.getStaffDetail("tester01", 1);
		dao.setJoinDate("tester01", 1);
		assertEquals(staff, dao.getStaffDetail("tester01", 1));
	}*/
	
	/**이미 퇴사한 직원을 퇴사시키려는 경우-DAO 예외처리
	@Test
	public void setLeaveDateWithLeftStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 3);
		dao.setLeaveDate("chanyoung", 3);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 3));
	}*/
	
	/**인증요청만 하고 승인 안 된 직원을 퇴사시키는 경우-DAO 예외처리
	@Test
	public void setLeaveDateWithPreStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 1);
		dao.setLeaveDate("chanyoung", 1);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 1));
	}*/
	
	/**인증요청하지 않은 직원의 퇴사일을 등록하는 경우/존재하지 않는 회원의 경우-DAO 예외처리
	@Test
	public void setLeaveDateWithWrongStaff(){
		Map staff = dao.getStaffDetail("tester01", 1);
		dao.setLeaveDate("tester01", 1);
		assertEquals(staff, dao.getStaffDetail("tester01", 1));
	}*/
	
	/**없는 지점의 퇴사직원 목록 조회-DAO 예외처리
	@Test
	public void getLeftStaffsWithWrongBranchSeq(){
		assertEquals(dao.getLeftStaffs(99).size(), 0);
	}*/

	/**없는 지점의 직원 상세 보기-DAO 예외처리 
	@Test
	public void getStaffDetailWithWrongBranchSeq(){
		assertNull(dao.getStaffDetail("chanyoung", 99));
	}*/
	
	/**없는 직원 상세 보기-DAO 예외처리 
	@Test
	public void getStaffDetailWithWrongStaffId(){
		assertNull(dao.getStaffDetail("tester99", 1));
	}*/
	
	/**없는 지점에 인증요청하는 경우-DB 무결성제약조건, DAO 예외처리 
	@Test
	public void addStaffWithWrongBranchSeq(){
		Map staff = dao.getStaffDetail("chanyoung", 99);
		dao.addStaff("chanyoung", 99, null, null, null, null, null);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 99));
	}*/
	
	/**재직중인 직원인데 인증요청하는 경우(입사일을 덮어씌우는 경우)-DAO 예외처리
	@Test
	public void addStaffWithJoinedStaff(){
		dao.addStaff("chanyoung", 2, null, null, null, null, null);
		assertFalse(dao.isStaffDate("chanyoung", 2, null, null));
	}*/
	
	/**인증요청하고 승인대기중인 직원이 계속 인증요청 하는 경우-DAO 예외처리-확인은 어떻게???
	@Test
	public void addStaffWithPreStaff(){
		int cnt = dao.getPreStaffs(1).size();
		dao.addStaff("chanyoung", 1, null, null, null, null, null);
		assertNotEquals(cnt+1, dao.getPreStaffs(1).size());
	}*/
	
	/**인증 승인 대기중인 직원의 직원정보 변경-현재 UI에서 할 수가 없음-exception 필요없음
	@Test
	public void setStaffInfoWithPreStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 1);
		dao.setStaffInfo("chanyoung", 1, null, null, null, "1111111111.png", null);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 1));
	}*/
	
	/**퇴직 직원의 직원정보 변경-현재 UI에서 할 수가 없음-exception 필요없음
	@Test
	public void setStaffInfoWithLeftStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 3);
		dao.setStaffInfo("chanyoung", 3, null, null, null, "333333333.png", "333333333.png");
		assertEquals(staff, dao.getStaffDetail("chanyoung", 3));
	}*/
	
	/**없는 직원의 직원정보 변경-DAO 예외처리
	@Test
	public void setStaffInfoWithWrongStaff(){
		Map staff = dao.getStaffDetail("tester99", 1);
		dao.setStaffInfo("tester99", 1, "testbank.doc", "00000000000", null, null, null);
		assertEquals(staff, dao.getStaffDetail("tester99", 1));		
	}*/
	
	/**부적절한 파일형식으로 변경하는 경우-DAO 예외처리
	@Test
	public void setStaffInfoWithWrongFileFormat(){
		Map staff = dao.getStaffDetail("chanyoung", 1);
		dao.setStaffInfo("chanyoung", 1, "국민은행", "1231234512345", "chanyoung_resume.txt", "chanyoung_health.exe", "chanyoung_bank.html");
		assertEquals(staff, dao.getStaffDetail("chanyoung", 1));
	}*/
	
	/**부적절한 계좌번호 형식으로 변경하는 경우-DAO 예외처리
	@Test
	public void setStaffInfoWithWrongAccountNumFormat(){
		Map staff = dao.getStaffDetail("chanyoung", 3);
		dao.setStaffInfo("chanyoung", 3, "국민은행", "ㅇㅁ^251as1", null, null, null);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 3));
	}*/
	
	/**이미 승인 처리받은 직원(재직) 의 요청을 거부하려고 하는 경우-DAO 예외처리
	@Test
	public void removeStaffWithJoinedStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 2);
		dao.removeStaff("chanyoung", 2);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 2));
	}*/
	
	/**인증요청하지 않은 경우(or 없는 직원의 경우)-DAO 예외처리
	@Test
	public void removeStaffWithWrongStaffId(){
		Map staff = dao.getStaffDetail("tester99", 1);
		dao.removeStaff("tester99", 1);
		assertEquals(staff, dao.getStaffDetail("tester99", 1));
	}*/

	/**퇴사한 직원의 인증을 거부하는 경우-DAO 예외처리
	@Test
	public void removeStaffWithLeftStaff(){
		Map staff = dao.getStaffDetail("chanyoung", 3);
		dao.removeStaff("chanyoung", 3);
		assertEquals(staff, dao.getStaffDetail("chanyoung", 3));
	}*/
	
}

