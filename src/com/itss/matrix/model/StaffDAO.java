package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class StaffDAO {
	private SqlSessionFactory sqlSessionFactory;

	public StaffDAO() {
		InputStream inputStream = null;
		try {
			String resource = "com/itss/matrix/model/mapper/mybatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	/**배정할 파트 목록 보기: 업무배정, 업무재배정*/
	public Collection<String> getWorkParts(int branchSeq) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<String> list = new ArrayList<>();
		try {
			list = session.selectList("staffMapper.getWorkParts", branchSeq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	/**배정할 직원 목록 보기: 업무배정, 업무재배정  / 재직 중인 직원 목록 보기*/
	public Collection<Map<String, String>> getWorkingStaffs(int branchSeq) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		try {
			list = session.selectList("staffMapper.getWorkingStaffs", branchSeq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**직원 인증요청 목록 보기*/
	public Collection<Map<String, String>> getPreStaffs(int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		try {
			list = session.selectList("staffMapper.getPreStaffs", branchSeq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	/**직원 인증요청 수락  - 인증일은 시스템날짜*/
	public void setJoinDate(String staffId, int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		try {
			if(session.update("staffMapper.setJoinDate", input) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원 인증요청 거부*/
	public void removeStaff(String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(session.delete("staffMapper.removeStaff", staffId) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/**퇴사 직원 등록 - 퇴사일은 시스템날짜*/
	public void setLeaveDate(String staffId, int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		try {
			if(session.update("staffMapper.setLeaveDate", input) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**퇴사한 직원 목록 보기 - sql 손봐야한다.*/
	public Collection<Map<String, String>> getLeftStaffs(int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		try {
			list = session.selectList("staffMapper.getLeftStaffs", branchSeq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	/**직원 상세 정보 보기, 직원정보변경 시 기존정보 해당 지점의 가장 최근 내역 1건 출력(null있으면 null이 최근) - sql 손봐줌.*/
	public Map<Object, Object> getStaffDetail(String staffId, int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		Map<Object, Object> output = null;
		try {
			output = session.selectOne("staffMapper.getStaffDetail", input);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return output;
	}
	
	/**직원 등록(승인요청)*/
	public void addStaff(String staffId, int branchSeq, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		addStaff(new StaffVO(staffId, branchSeq, bankName, accountNum, resumeFile, healthFile, bankFile));
	}
	public void addStaff(StaffVO vo){
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			if(session.insert("staffMapper.addStaff", vo) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원 회원정보 변겅 - 모든 정보*/
	public void setStaffInfo(String resumeFile, int branchSeq, String healthFile, String bankFile, String bankName, String accountNum, String staffId){
		setStaffInfo(new StaffVO(staffId, branchSeq, bankName, accountNum, resumeFile, healthFile, bankFile));
	}
	public void setStaffInfo(StaffVO vo){
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			if(session.update("staffMapper.setStaffInfo", vo) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원목록 - 직원 소속파트 배정/변경
	 * select staff_seq, branch_seq, work_part, join_date, leave_date from staffs where staff_id='chanyoung';
	 * */
	public void setWorkPart(String workPart, String staffId, int branchSeq){
		setWorkPart(new StaffVO(workPart, staffId, branchSeq));
	}
	public void setWorkPart(StaffVO vo){
		SqlSession session = sqlSessionFactory.openSession();
	
		try {
			if(session.update("staffMapper.setWorkPart", vo) == 1){
				session.commit();
			} else {
				//오류 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**한 지점 내 한 직원의 입사/퇴사 날짜 조회(테스트 보조 메소드)
	 * select staff_seq, branch_seq, join_date, leave_date from staffs where staff_id='chanyoung';
	 * */
	public boolean isStaffDate(String staffId, int branchSeq, String joinDate, String leaveDate) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		input.put("joinDate", joinDate);
		input.put("leaveDate", leaveDate);
		boolean result = false;
		try {
			if(session.selectOne("staffMapper.isStaffDate", input)!=null) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
}
