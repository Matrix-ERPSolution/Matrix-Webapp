package com.itss.matrix.test;

import static org.junit.Assert.*;

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
		assertNotNull(dao.getAssignedParts("2018/05/10"));
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
	}
	
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
	}
	
	@Test
	public void addDailyTaskWithWrongPart(){
		//없는 파트
	}
	
	@Test
	public void addDailyTaskWithWrongStaff(){
		//없는 개인
	}
	
	@Test
	public void addDailyTaskWithWrongBranchSeq(){
		//없는 지점코드
	}
	
	@Test
	public void addDailyTaskWithDuplicate(){
		//동일한 쿼리문 중복 입력가능
	}

}
