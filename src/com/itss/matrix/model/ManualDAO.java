package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ManualDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public ManualDAO(){
		InputStream inputStream = null;
		try {
			String resource = "mybatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	/**매뉴얼 업무 전체 출력(자동완성): 업무배정, 업무수정*/
	public Collection<String> getManualTasks(){
		SqlSession session = sqlSessionFactory.openSession();
		//session.selectlist
		return null;
	}
	
	
	/**공간분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	
	/**선택한 공간에 속한 업무분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	
	/**업무분류 보기: 매뉴얼 보기*/
	
	/**선택한 업무에 속한 공간분류 보기: 매뉴얼 보기*/
		
	/**선택한 공간/업무분류에 속한 업무 목록 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	
	/**i: 업무명, o: ManualTaskSeq*/
		
}
