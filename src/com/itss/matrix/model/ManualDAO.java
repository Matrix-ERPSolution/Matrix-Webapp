package com.itss.matrix.model;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ManualDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public ManualDAO() throws IOException{
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(
				Resources.getResourceAsStream("com/itss/matrix/model/mapper/mybatis-Config.xml"));
	}
	
	/**매뉴얼 업무 전체 출력(자동완성): 업무배정, 업무수정*/
	public Collection<String> getManualTasks(){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = null;
		list = session.selectList("manualMapper.getManualTasks");
		session.close();
		return list;
	}
	
	/**공간분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getSpaceTypes() {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = null;
		list = session.selectList("manualMapper.getSpaceTypes");
		session.close();
		return list;
	}
	
	/**선택한 공간에 속한 업무분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getTaskTypes(String spaceType) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = null;
		list = session.selectList("manualMapper.getTaskTypes", spaceType);
		session.close();
		return list;
	}
	
	/**업무분류 보기: 매뉴얼 보기*//*
	public Collection<String> getTaskTypes() {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = null;
		
		return list;
	}
	
	*//**선택한 업무에 속한 공간분류 보기: 매뉴얼 보기*//*
	public Collection<String> getSpaceTypes(String taskType) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = null;
		
		return list;
	}
	
	*//**선택한 공간/업무분류에 속한 업무 목록 보기: 업무배정, 업무수정, 매뉴얼 보기*//*
	public Collection<Map<String, String>> getTasks(String spaceType, String taskType) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = null;
		
		return list;
	}
	
	*//**i: 업무명, o: ManualTasksSeq*/
	public int getManualTasksSeq(String searchTask){
		SqlSession session = sqlSessionFactory.openSession();
		int manualTasksSeq=0;
		manualTasksSeq = session.selectOne("manualMapper.getManualTasksSeq", searchTask);
		session.close();
		return manualTasksSeq;
	}
	
}
