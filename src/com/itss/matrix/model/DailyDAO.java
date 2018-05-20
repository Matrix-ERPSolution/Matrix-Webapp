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
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;
		try {
			list = session.selectList("dailyMapper.getAssignedParts", assignDate);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/** 파트별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	public Collection<Map<String, String>> getDailyTasksForParts(String assignDate, String assignDetail) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		input.put("assignDate", assignDate);
		input.put("assignDetail", assignDetail);
		List<Map<String, String>> list = null;
		try {
			list = sqlSession.selectList("dailyMapper.getDailyTasksForParts", input);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}

	/** 개인별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	public Collection<Map<String, String>> getDailyTasksForPerson(String assignDate) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		try {
			list = sqlSession.selectList("dailyMapper.getDailyTasksForPerson", assignDate);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	/** 업무 중복확인 */
	public boolean isDailyTask(String dailyTask, String assignDate) {
		boolean result=false;
		Map<String, String> input = new HashMap<>();
		input.put("dailyTask", dailyTask);
		input.put("assignDate", assignDate);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(session.selectOne("dailyMapper.isDailyTask", input) != null){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/** 업무 배정 */
	public void addDailyTask(DailyVO vo) {
		vo.setManualTaskSeq(new ManualDAO().getManualTaskSeq(vo.getDailyTask()));
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			if (vo.getManualTaskSeq() == -1) {
				sqlSession.insert("dailyMapper.addDailyTaskByInput", vo);
			} else {
				sqlSession.insert("dailyMapper.addDailyTaskByManual", vo);
			}
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public void addDailyTask(String dailyTask, String assignDate, int importance, String assignType,
			String assignDetail, int adminSeq) {
		addDailyTask(new DailyVO(dailyTask, assignDate, importance, assignType, assignDetail, adminSeq));
	}

	/** 업무 수정 */
	public void setDailyTask(String newDailyTask, String oldDailyTask, String assignDate, String assignDetail) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = -1;
		Map input = new HashMap<>();
		input.put("newDailyTask", newDailyTask);
		input.put("assignDetail", assignDetail);
		input.put("assignDate", assignDate);
		input.put("oldDailyTask", oldDailyTask);
		int newManualTaskSeq = new ManualDAO().getManualTaskSeq(newDailyTask);
		if (newManualTaskSeq == -1) {
			result = sqlSession.update("dailyMapper.setDailyTaskByInput", input);
		} else {
			input.put("newManualTaskSeq", newManualTaskSeq);
			result = sqlSession.update("dailyMapper.setDailyTaskByManual", input);
		}
		if (result == 1) {
			sqlSession.commit();
		}
		sqlSession.close();
	}

	/** 업무 재배정 */
	public void setDailyAssign(String newAssignType, String newAssignDetail, String assignDate, String oldAssignType, String oldAssignDetail,
			String dailyTask) {
		Map<String, String> input = new HashMap<>();
		input.put("newAssignType", newAssignType);
		input.put("newAssignDetail", newAssignDetail);
		input.put("assignDate", assignDate);
		input.put("oldAssignType", oldAssignType);
		input.put("oldAssignDetail", oldAssignDetail);
		input.put("dailyTask", dailyTask);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		if (sqlSession.delete("dailyMapper.setDailyAssign", input) == 1) {
			sqlSession.commit();
		}
		sqlSession.close();
	}

	/** 업무 삭제 */
	public void removeDailyTask(DailyVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		if (sqlSession.delete("dailyMapper.removeDailyTask", vo) == 1) {
			sqlSession.commit();
		}
		sqlSession.close();
	}

	public void removeDailyTask(String dailyTask, String assignDate, String assignType, String assignDetail) {
		removeDailyTask(new DailyVO(dailyTask, assignDate, assignType, assignDetail));
	}
}
