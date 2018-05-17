package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ManualDAO {
	private SqlSessionFactory sqlSessionFactory;

	public ManualDAO() {
		InputStream inputStream = null;
		try {
			String resource = "com/itss/matrix/model/mapper/mybatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	/** 매뉴얼 업무 전체 출력(자동완성): 업무배정, 업무수정 */
	public List<Map> getManualTasks() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Map> list = null;

		try {
			list = session.selectList("manualMapper.getManualTasks");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** (대분류)공간분류 보기: 업무배정, 업무수정, 매뉴얼 보기 */
	public List<String> getSpaceTypes() {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;

		try {
			list = session.selectList("manualMapper.getSpaceTypes");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** (중분류)선택한 공간에 속한 업무분류 보기: 업무배정, 업무수정, 매뉴얼 보기 */
	public List<String> getTaskTypesBySpaceType(String spaceType) {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;

		try {
			list = session.selectList("manualMapper.getTaskTypesBySpaceType", spaceType);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** (대분류)업무분류 보기: 매뉴얼 보기 */
	public List<String> getTaskTypes() {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;

		try {
			list = session.selectList("manualMapper.getTaskTypes");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** (중분류)선택한 업무에 속한 공간분류 보기: 매뉴얼 보기 */
	public List<String> getSpaceTypesByTaskType(String taskType) {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;

		try {
			list = session.selectList("manualMapper.getSpaceTypesByTaskType", taskType);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** (공통 소분류)선택한 공간/업무분류에 속한 업무 목록 보기: 업무배정, 업무수정, 매뉴얼 보기 */
	public List<Map> getTasks(String spaceType, String taskType) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Map> list = null;
		Map<String, String> input = new HashMap();
		input.put("spaceType", spaceType);
		input.put("taskType", taskType);

		try {
			list = session.selectList("manualMapper.getTasks", input);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** i: 업무명, o: ManualTaskSeq 단 값이 -1인경우는 해당 없다.*/
	public int getManualTaskSeq(String searchTask) {
		SqlSession session = sqlSessionFactory.openSession();
		int manualTaskSeq = -1;
		try {
			manualTaskSeq = session.selectOne("manualMapper.getManualTaskSeq", searchTask);
		} catch (NullPointerException e){
			//매뉴얼에 없는 업무일 경우 아무일도 안할거야. 디폴트값인 -1이 리턴될거야.
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		return manualTaskSeq;
	}

}
