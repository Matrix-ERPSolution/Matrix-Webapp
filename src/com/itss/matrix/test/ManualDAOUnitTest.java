package com.itss.matrix.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import com.itss.matrix.model.ManualDAO;

public class ManualDAOUnitTest {
	static ManualDAO dao;
	
	@BeforeClass
	public static void DAO_생성자() throws Exception{
		dao=new ManualDAO();
	}
	
	@Test
	public void correct(){
		assertNotNull(dao.getManualTasks());
		assertNotNull(dao.getSpaceTypes());
		assertNotNull(dao.getTaskTypesBySpaceType("카운터"));
		assertNotNull(dao.getTaskTypes());
		assertNotNull(dao.getSpaceTypesByTaskType("설비관리"));
		assertNotNull(dao.getTasks("카운터", "설비관리"));
		assertNotEquals(dao.getManualTaskSeq("바닥 쓸기"), -1);
	}
	
	@Test
	public void nonExistTaskTypesBySpaceType(){
		assertEquals(dao.getTaskTypesBySpaceType("지하 300층").size(), 0);
	}
	
	@Test
	public void nonExistSpaceTypesByTaskType(){
		assertEquals(dao.getSpaceTypesByTaskType("멘탈관리").size(), 0);
	}
	
	@Test
	public void nonExistTasksBySpaceTypeByTaskType(){
		assertEquals(dao.getTasks("테라스", "고객관리").size(), 0);
	}
	
	@Test
	public void nonExistManualTaskSeq(){
		assertEquals(dao.getManualTaskSeq("마지막 나가는 손님 엉덩이 주 차버리기"), -1);
	}
	
	
	
	
	
	
}