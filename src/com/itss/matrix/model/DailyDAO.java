package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DailyDAO {
	private SqlSessionFactory sqlSessionFactory;

	public DailyDAO() {
		  InputStream inputStream = null;
	      try {
	         String resource = "com/itss/matrix/model/mapper/mybatis-Config.xml";
	         inputStream = Resources.getResourceAsStream(resource); 
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	/** 선택한 날짜에 해당하는 배정대상 목록 보기 */
	public List<String> getAssignedParts(String assignDate) {
		SqlSession sqlSession=sqlSessionFactory.openSession();
		List<String> list = sqlSession.selectList("dailyMapper.getAssignedParts", assignDate);
		sqlSession.close();
		return list;
	}


	/** 파트별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	public Collection<Map<String, String>> getDailyTasksForParts(String assignDate, String assignDetail) {
		SqlSession sqlSession=sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<>();
		map.put("assignDate", assignDate);
		map.put("assignDetail", assignDetail);
		List<Map<String, String>> list = sqlSession.selectList("dailyMapper.getDailyTasksForParts", map);
		sqlSession.close();
		return list;
	}
	
	/** 개인별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	public Collection<Map<String, String>> getDailyTasksForPerson(String assignDate) {
		SqlSession sqlSession=sqlSessionFactory.openSession();
		List<Map<String, String>> list = sqlSession.selectList("dailyMapper.getDailyTasksForPerson", assignDate);
		sqlSession.close();
		return list;
	}

	/** 업무 배정 */
	public void addDailyTask(DailyVO vo) {
		vo.setManualTaskSeq(new ManualDAO().getManualTaskSeq(vo.getDailyTask()));
		SqlSession sqlSession=sqlSessionFactory.openSession();
		if(vo.getManualTaskSeq() == -1){
			sqlSession.insert("dailyMapper.addDailyTaskByInput", vo);
		} else {
			sqlSession.insert("dailyMapper.addDailyTaskByManual", vo);
		}
		sqlSession.commit();
		sqlSession.close();
	}
	public void addDailyTask(String dailyTask, String assignDate, int importance, String assignType,
			String assignDetail, String adminSeq) throws IOException{
		addDailyTask(new DailyVO(dailyTask, assignDate, importance, assignType, assignDetail, adminSeq));
	}

	/** 업무 수정 */
	public void setDailyTask(String newDailyTask, String oldDailyTask, String assignDate, String assignDetail) {
		SqlSession sqlSession=sqlSessionFactory.openSession();
		int result = -1;
		Map map = new HashMap<>();
		map.put("newDailyTask", newDailyTask);
		map.put("assignDetail", assignDetail);
		map.put("assignDate", assignDate);
		map.put("oldDailyTask", oldDailyTask);
		int newManualTaskSeq = new ManualDAO().getManualTaskSeq(newDailyTask);
		if(newManualTaskSeq == -1){
			result = sqlSession.update("dailyMapper.setDailyTaskByInput", map);
		} else {
			map.put("newManualTaskSeq", newManualTaskSeq);
			result = sqlSession.update("dailyMapper.setDailyTaskByManual", map);
		}
		if(result == 1){
			sqlSession.commit();
		}
		sqlSession.close();
	}

	/** 업무 재배정 */
	public void setDailyAssign(String newAssignType,
			String newAssignDetail, String assignDate, String oldAssignDetail, String dailyTask) {
		Map<String, String> map = new HashMap<>();
		map.put("newAssignType", newAssignType);
		map.put("newAssignDetail", newAssignDetail);
		map.put("assignDate", assignDate);
		map.put("oldAssignDetail", oldAssignDetail);
		map.put("dailyTask", dailyTask);
		SqlSession sqlSession=sqlSessionFactory.openSession();
		if(sqlSession.delete("dailyMapper.setDailyAssign", map) == 1){
			sqlSession.commit();
		}
		sqlSession.close();
	}

	/** 업무 삭제 */
	public void removeDailyTask(DailyVO vo){
		SqlSession sqlSession=sqlSessionFactory.openSession();
		if(sqlSession.delete("dailyMapper.removeDailyTask", vo) == 1){
			sqlSession.commit();
		}
		sqlSession.close();
	}
	public void removeDailyTask(String dailyTask, String assignDate, String assignType, String assignDetail) {
		removeDailyTask(new DailyVO(dailyTask, assignDate, assignType, assignDetail));
	}
}
