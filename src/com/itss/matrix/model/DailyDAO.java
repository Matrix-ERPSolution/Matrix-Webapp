package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

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
			if(list.size()==0){
				throw new RuntimeException("날짜를 다시 확인해주세요.");
			}
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
			if(list.size()==0){
				throw new RuntimeException("날짜와 배정대상을 확인해주세요.");
				}
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
			if(list.size()==0){
				throw new RuntimeException("날짜를 확인해주세요.");
			}
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
				throw new RuntimeException("해당날짜에 이미 업무가 있습니다.");
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
			if(vo.getDailyTask() == null){
				throw new RuntimeException("입력된 업무가 없습니다.");
			}
			if(isDailyTask(vo.getDailyTask(), vo.getAssignDate())==true){
				throw new RuntimeException("이미 배정된 업무입니다.");
			}
			if(vo.getAssignType()!="개인" && vo.getAssignType()!="파트"){
				throw new RuntimeException("배정유형이 올바르지 않습니다.");
			}
			if(vo.getImportance()!=0 && vo.getImportance()!=1){
				throw new RuntimeException("중요도 설정이 올바르지 않습니다.");
			}
			
			List adminSeqs = sqlSession.selectList("dailyMapper.getAdminSeqs");
			boolean result=false;
			for(int i=0; i<adminSeqs.size(); i++){
				if(adminSeqs.get(i).equals(vo.getAdminSeq())){
					result=true;
				}
			}
			if(!result){
				throw new RuntimeException("권한이 없는 관리자 코드입니다.");
			}
			
			if(vo.getAssignType()=="파트"){
				int branchSeq = sqlSession.selectOne("dailyMapper.getBranchSeq", vo.getAdminSeq());
				StaffDAO dao = new StaffDAO();
				Collection<String> workParts = dao.getWorkParts(branchSeq); //지점에 해당하는 파트 종류 호출
				result=false;
				for (String tmp : workParts) {
					if(tmp.equals(vo.getAssignDetail())){
						result=true;
					}
				}
				if(!result){
					throw new RuntimeException("없는 파트입니다.");
				}
			}
			
			if(vo.getAssignType()=="개인"){
				int branchSeq = sqlSession.selectOne("dailyMapper.getBranchSeq", vo.getAdminSeq());
				StaffDAO dao = new StaffDAO();
				Collection<Map<String, String>> workingStaffs = dao.getWorkingStaffs(branchSeq); //지점에 해당하는 재직중인 직원 호출
				result=false;
				for (Map<String, String> map : workingStaffs) {					
					if(map.get("STAFF_ID").equals(vo.getAssignDetail())){
						result=true;
					}
				}
				if(!result){
					throw new RuntimeException("없는 직원입니다.");
				}
			}
			
			
			// 현재 날짜 기준으로 과거 날짜에 업무 배정
			//sysdate

			
				
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
	
	/**특정 날짜에 배정된 업무 전체 출력 */
	public List<String> getDailyTasks(String assignDate){
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;
		try {
			list = session.selectList("dailyMapper.getDailyTasks", assignDate);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	

	/** 업무 수정 */
	public void setDailyTask(String newDailyTask, String oldDailyTask, String assignDate, String assignDetail) {
		SqlSession session = sqlSessionFactory.openSession();
		//System.out.println(newDailyTask);
		int result = -1;
		Map input = new HashMap<>();
		List<String> list=getDailyTasks(assignDate);
		try{
			boolean tmp=false;
			for(int i=0; i<list.size(); i++){
				if(list.get(i).equals(oldDailyTask)){
					tmp=true;
				}
			}
			if(!tmp){
				throw new RuntimeException("해당날짜에 없는 업무입니다.");
			}
			
			// 날짜에 해당하는 업무명의 assign_detail 비교
			// SQL 추가 : 업무명, 배정날짜 입력 -> getAssignDetail
			Map<String, String> map = new HashMap<>();
			map.put("oldDailyTask", oldDailyTask);
			map.put("assignDate", assignDate);
			String str = session.selectOne("dailyMapper.getAssignDetail", map);
			System.out.println(str);
			if(!str.equals(assignDetail)){
				throw new RuntimeException("바꾸려는 업무의 배정대상이 일치하지 않습니다.");
			}
			
			input.put("newDailyTask", newDailyTask);
			input.put("assignDetail", assignDetail);
			input.put("assignDate", assignDate);
			input.put("oldDailyTask", oldDailyTask);
			int newManualTaskSeq = new ManualDAO().getManualTaskSeq(newDailyTask);
			if (newManualTaskSeq == -1) {
				result = session.update("dailyMapper.setDailyTaskByInput", input);
			} else {
				input.put("newManualTaskSeq", newManualTaskSeq);
				result = session.update("dailyMapper.setDailyTaskByManual", input);
			}
			if (result == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	
	/** 업무 한가지 검색 */
	public Map<String, String> getDailyTask(String dailyTask, String assignDate, String assignDetail) {
		Map<String, String> result= null;
		Map<String, String> input = new HashMap<>();
		input.put("dailyTask", dailyTask);
		input.put("assignDate", assignDate);
		input.put("assignDetail", assignDetail);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			result = session.selectOne("dailyMapper.getDailyTask", input);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/** 업무 재배정 */
	public void setDailyAssign(String newAssignType, String newAssignDetail, String assignDate, String oldAssignType, String oldAssignDetail,
			String dailyTask) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		try{
			if(newAssignType==null || newAssignDetail==null){
				throw new RuntimeException("배정대상이 없습니다.");
			}
			
			//해당 지점의 assginDetail 찾아서  newAssignDetail 비교
			//해당 지점을 어떻게 찾지??
			
			input.put("newAssignType", newAssignType);
			input.put("newAssignDetail", newAssignDetail);
			input.put("assignDate", assignDate);
			input.put("oldAssignType", oldAssignType);
			input.put("oldAssignDetail", oldAssignDetail);
			input.put("dailyTask", dailyTask);
			if (sqlSession.update("dailyMapper.setDailyAssign", input) == 1) {
				sqlSession.commit();
			} else {
				throw new RuntimeException("setDailyAssign update 실패.");
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			sqlSession.close();
		}
		
	}

	/** 업무 삭제 */
	public void removeDailyTask(DailyVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		if (sqlSession.delete("dailyMapper.removeDailyTask", vo) == 1) {
			sqlSession.commit();
		} else{
			throw new RuntimeException("removeDailyTask delete 실패.");
		}
		sqlSession.close();
	}

	public void removeDailyTask(String dailyTask, String assignDate, String assignType, String assignDetail) {
		removeDailyTask(new DailyVO(dailyTask, assignDate, assignType, assignDetail));
	}

	
}
