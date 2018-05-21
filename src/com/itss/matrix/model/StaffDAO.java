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
		list = session.selectList("staffMapper.getWorkParts", branchSeq);
		
		return list;
	}
	
	/**배정할 직원 목록 보기: 업무배정, 업무재배정  / 재직 중인 직원 목록 보기*/
	public Collection<Map<String, String>> getWorkingStaffs(int branchSeq) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		list = session.selectList("staffMapper.getWorkingStaffs", branchSeq);
		
		return list;
	}

	/**직원 인증요청 목록 보기*/
	public Collection<Map<String, String>> getPreStaffs(int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		list = session.selectList("staffMapper.getPreStaffs", branchSeq);
		
		return list;
	}
	
	/**직원 인증요청 수락  - 인증일은 시스템날짜*/
	public void setJoinDate(String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		if(session.update("staffMapper.setJoinDate", staffId) == 1){
			session.commit();
		} else {
			//오류 처리
		}
		
	}
	
	/**직원 인증요청 거부*/
	public void removeStaff(String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		if(session.delete("staffMapper.removeStaff", staffId) == 1){
			session.commit();
		} else {
			//오류 처리
		}
		
	}

	/**퇴사 직원 등록 - 퇴사일은 시스템날짜*/
	public void setLeaveDate(String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		if(session.update("staffMapper.setJoinDate", staffId) == 1){
			session.commit();
		} else {
			//오류 처리
		}
	}
	
	/**퇴사한 직원 목록 보기 - sql 손봐야한다.*/
	public Collection<Map<String, String>> getLeavedStaffs(int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		list = session.selectList("staffMapper.getLeavedStaffs", branchSeq);
		
		return list;
	}
	
	/**직원 상세 정보 보기, 직원정보변경 시 기존정보 출력 - sql 손봐야한다.*/
	public Collection<Map<String, String>> getStaffDetail(String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		list = session.selectList("staffMapper.getStaffDetail", staffId);
		
		return list;
	}
	
	/**직원 등록(승인요청)*/
	public void addStaff(String staffId, int branchSeq, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		SqlSession session = sqlSessionFactory.openSession();
		Map input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		input.put("bankName", bankName);
		input.put("accountNum", accountNum);
		input.put("resumeFile", resumeFile);
		input.put("healthFile", healthFile);
		input.put("bankFile", bankFile);
		
		if(session.insert("staffMapper.setJoinDate", input) == 1){
			session.commit();
		} else {
			//오류 처리
		}
	}
	
	/**직원 회원정보 변겅 - 모든 정보*/
	public void setStaffInfo(String resumeFile, String healthFile, String bankFile, String bankName, String accountNum, String staffId){
		SqlSession session = sqlSessionFactory.openSession();
		Map input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("bankName", bankName);
		input.put("accountNum", accountNum);
		input.put("resumeFile", resumeFile);
		input.put("healthFile", healthFile);
		input.put("bankFile", bankFile);
		
		if(session.update("staffMapper.setJoinDate", input) == 1){
			session.commit();
		} else {
			//오류 처리
		}
	}
	
}
