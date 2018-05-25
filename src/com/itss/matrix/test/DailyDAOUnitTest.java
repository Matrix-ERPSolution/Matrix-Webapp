package com.itss.matrix.test;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.itss.matrix.model.DailyDAO;

public class DailyDAOUnitTest {
	static DailyDAO dao;
	
	@BeforeClass
	public static void DAO_생성자() throws Exception{
		dao=new DailyDAO();
	}

	@Test
	public void correct() {
		/*assertNotNull(dao.getAssignedParts("2018/05/10"));
		assertNotNull(dao.getDailyTasksForParts("2018/05/20", "마감"));
		assertNotNull(dao.getDailyTasksForPerson("2018/05/18"));
		assertFalse(dao.isDailyTask("바닥 쓸기", "2018/05/25"));
		
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("중요한직접업무", "2018/11/11", 1, "개인", "yunseok", 1); // 직접입력업무, 중요, 개인
		assertEquals(++count, dao.getDailyTasks("2018/11/11").size());
		
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("테라스 외부 청소", "2018/11/11", 0, "파트", "마감", 1); // 매뉴얼업무, 중요x, 파트
		assertEquals(++count, dao.getDailyTasks("2018/11/11").size());
		
		//업무수정 - setDailyTaskByManual
		dao.setDailyTask("바닥 쓸기", "화장실 소독", "2018/01/01", "마감");
		assertFalse(dao.isDailyTask("화장실 소독", "2018/01/01"));
		
		//업무수정 - setDailyTaskByInput
		dao.setDailyTask("행주소독을 직접입력업무로수정", "행주 소독", "2018/01/01", "미들");
		assertTrue(dao.isDailyTask("행주소독을 직접입력업무로수정", "2018/01/01"));
		
		*/
		/*
		//업무 재배정(파트,오픈 -> 파트,마감)   
		Map<String, String> tmp1=dao.getDailyTask("에어컨 필터 교체", "2018/01/01", "오픈");
		dao.setDailyAssign("파트", "마감", "2018/01/01", "파트", "오픈", "에어컨 필터 교체");
		assertNotEquals(tmp1, dao.getDailyTask("에어컨 필터 교체", "2018/01/01", "마감"));
		
		//업무 재배정(파트,오픈 -> 개인,yunseok)
		Map<String, String> tmp2=dao.getDailyTask("은행에서 잔돈 교환", "2018/01/01", "오픈");
		dao.setDailyAssign("개인", "yunseok", "2018/01/01", "파트", "오픈", "은행에서 잔돈 교환");
		assertNotEquals(tmp2, dao.getDailyTask("은행에서 잔돈 교환", "2018/01/01", "yunseok"));
		*/
		//업무 재배정(개인,chanyoung -> 파트,마감)
		Map<String, String> tmp3=dao.getDailyTask("메뉴판 업데이트 및 점검", "2018/01/01", "chanyoung");
		dao.setDailyAssign("파트", "마감", "2018/01/01", "개인", "chanyoung", "메뉴판 업데이트 및 점검");
		assertNotEquals(tmp3, dao.getDailyTask("메뉴판 업데이트 및 점검", "2018/01/01", "마감"));
	}
	/*
	@Test
	public void nonExistAssignedParts(){
		assertEquals(dao.getAssignedParts("2018/12/30").size(), 0);
	}
	
	@Test
	public void nonExistDailyTasksForParts(){
		assertEquals(dao.getDailyTasksForParts("2440/12/31", "홀에 산소 주입").size(), 0);
	}
	
	@Test
	public void nonExistDailyTasksForPerson(){
		assertEquals(dao.getDailyTasksForPerson("2400/10/10").size(), 0);
	}
	
	@Test
	public void ExistDailyTask(){
		assertTrue(dao.isDailyTask("바닥 쓸기", "2018/05/20"));
	}
	
	
	@Test
	public void addDailyTaskWithWrongImportance(){
		//중요도 0, 1 이 아닌경우
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("중요도 0,1이 아닌경우 exception", "2018/11/11", 3, "개인", "yunseok", 1);
		assertEquals(count, dao.getDailyTasks("2018/11/11").size());
	}
	
	@Test
	public void addDailyTaskWithWrongPart(){
		//없는 파트
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("없는 파트에 업무배정 exception", "2018/11/11", 1, "파트", "없는파트", 1);
		assertEquals(count, dao.getDailyTasks("2018/11/11").size());
	}
	
	@Test
	public void addDailyTaskWithWrongStaff(){
		//없는 직원
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("없는 직원에 업무배정 exception", "2018/11/11", 1, "개인", "없는직원", 1);
		assertEquals(count, dao.getDailyTasks("2018/11/11").size());
	}
	
	@Test
	public void addDailyTaskWithWrongAdminSeq(){
		//없는 관리자코드 - ADMIN_SEQ는 FK - SQL exception
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("없는 관리자코드에 업무배정 exception", "2018/11/11", 1, "파트", "마감", 10);
		assertEquals(count, dao.getDailyTasks("2018/11/11").size());
	}
	
	@Test
	public void addDailyTaskWithDuplicate(){
		//동일한 쿼리문 중복 입력가능 - 같은 날, 동일업무
		int count=0;
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("같은날 동일업무 exception", "2018/11/11", 1, "개인", "yunjin", 1);
		assertEquals(++count, dao.getDailyTasks("2018/11/11").size());
		
		count=dao.getDailyTasks("2018/11/11").size();
		dao.addDailyTask("같은날 동일업무 exception", "2018/11/11", 1, "개인", "yunjin", 1);
		assertEquals(count, dao.getDailyTasks("2018/11/11").size());
	}
	
	@Test
	public void setDailyTaskWrongWithNonExistTask(){
		//선택날짜에 없는 업무를 바꾸려는 경우
		dao.setDailyTask("바꾸려는업무", "없는업무", "2018/01/01", "마감");
		assertFalse(dao.isDailyTask("바꾸려는업무", "2018/01/01"));
	}

	@Test
	public void setDailyTaskWrongWithChangeAssignDetail(){
		//매뉴얼 업무에 해당하는 assign_detail을 바꾸려는 경우
		dao.setDailyTask("손 세정제 리필", "현금 시재 확인", "2018/01/01", "오픈");
		assertFalse(dao.isDailyTask("손 세정제 리필", "2018/01/01"));
	}
	
	@Test
	public void setDailyTaskWrongWithOverDataSize(){
		//직접입력업무를 입력할때는 VARCHAR2(60)이 넘으면 안된다
		dao.setDailyTask("직접입력업무를 입력할때는 VARCHAR2(60)이 넘으면 안된다", "환풍기 청소", "2018/01/01", "yunseok");
		assertFalse(dao.isDailyTask("직접입력업무를 입력할때는 VARCHAR2(60)이 넘으면 안된다", "2018/01/01"));
	}

	
	@Test
	public void setDailyAssignWrongWithNonExistPart (){
		//없는 파트에 재배정
		Map<String, String> tmp=dao.getDailyTask("야간개장 준비", "2018/01/01", "마감");
		dao.setDailyAssign("파트", "새벽", "2018/01/01", "파트", "마감", "야간개장 준비");
		assertEquals(tmp, dao.getDailyTask("야간개장 준비", "2018/01/01", "새벽"));
	}
	
	@Test
	public void setDailyAssignWrongWithNonExistStaff (){
		//없는 직원에 재배정
		Map<String, String> tmp=dao.getDailyTask("카운터 선반 닦기", "2018/01/01", "미들");
		dao.setDailyAssign("개인", "pikachu", "2018/01/01", "파트", "미들", "카운터 선반 닦기");
		assertEquals(tmp, dao.getDailyTask("카운터 선반 닦기", "2018/01/01", "pikachu"));
	}
	*/
	
	
	
	
	
	
}
