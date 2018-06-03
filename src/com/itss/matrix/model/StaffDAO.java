package com.itss.matrix.model;

import static com.itss.matrix.model.FormatCheckSolution.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
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
	public List<String> getWorkParts(int branchSeq) {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = new ArrayList<>();
		try {
			list = session.selectList("staffMapper.getWorkParts", branchSeq);
			if(list.isEmpty()) {
				throw new RuntimeException("getWorkParts 결과:empty");
			}
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
			if(list.isEmpty()){
				throw new RuntimeException("getWorkingStaffs 결과:empty");
			}
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
			if(list.isEmpty()){
				throw new RuntimeException("getPreStaffs 결과:empty");
			}
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
				throw new RuntimeException("setJoinDate update 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원 인증요청 거부*/
	public void removeStaff(String staffId, int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		try {
			if(session.delete("staffMapper.removeStaff", input) == 1){
				session.commit();
			} else {
				throw new RuntimeException("removeStaff delete 실패");
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
				throw new RuntimeException("setLeaveDate update 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**퇴사한 직원 목록 보기 - sql 손봄.*/
	public Collection<Map<String, String>> getLeftStaffs(int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> list = new ArrayList<>();
		try {
			if(!isBranchSeq(branchSeq)) {
				throw new RuntimeException("getLeftStaffs 실패 nullBranchSeq");
			}
			list = session.selectList("staffMapper.getLeftStaffs", branchSeq);
			if(list.isEmpty()){
				throw new RuntimeException("getLeftStaffs 결과:empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	/**직원 상세 정보 보기, 직원정보변경 시 기존정보 출력(유지)용. 해당 지점의 가장 최근 내역 1건 출력(null있으면 null이 최근) - sql 손봐줌.*/
	public Map<Object, Object> getStaffDetail(String staffId, int branchSeq){
		SqlSession session = sqlSessionFactory.openSession();
		Map<Object, Object> input = new HashMap<>();
		input.put("staffId", staffId);
		input.put("branchSeq", branchSeq);
		Map<Object, Object> output = null;
		try {
			output = session.selectOne("staffMapper.getStaffDetail", input);
			if(output==null){
				throw new RuntimeException("getStaffDetail 결과:null");
			}
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
		Map staff = getStaffDetail(vo.getStaffId(), vo.getBranchSeq());
		try {
			if(!isInputLength(vo.getAccountNum(), 0, 20)||!isInputLength(vo.getResumeFile(), 0, 40)||!isInputLength(vo.getHealthFile(), 0, 40)||!isInputLength(vo.getBankFile(), 0, 40)){
				throw new RuntimeException("입력값 길이 제한 초과");
			}
			if((staff.get("JOIN_DATE")==null)&&(staff.get("LEAVE_DATE")==null)) {
				throw new RuntimeException("addStaff 실패:이미 승인요청함");
			}
			if(staff.get("JOIN_DATE")!=null){
				throw new RuntimeException("addStaff 실패:이미 재직중인 직원");
			}
			if(!isBranchSeq(vo.getBranchSeq())){
				throw new RuntimeException("addStaff 실패:없는 지점임");
			}
			if(!isFileFormat(vo.getResumeFile())||!isFileFormat(vo.getHealthFile())||!isFileFormat(vo.getBankFile())) {
				throw new RuntimeException("addStaff insert 실패:파일형식 오류");
			}
			if(!isNumberFormat(vo.getAccountNum())) {
				throw new NumberFormatException("addStaff 실패:계좌번호 형식 오류");
			}
			session.insert("staffMapper.addStaff", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원 회원정보 변경 - 모든 정보*/
	public void setStaffInfo(String staffId, int branchSeq, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		setStaffInfo(new StaffVO(staffId, branchSeq, bankName, accountNum, resumeFile, healthFile, bankFile));
	}
	public void setStaffInfo(StaffVO vo){
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			if(!isFileFormat(vo.getResumeFile())||!isFileFormat(vo.getHealthFile())||!isFileFormat(vo.getBankFile())) {
				throw new RuntimeException("setStaffInfo 실패:파일형식 오류");
			}
			if(!isNumberFormat(vo.getAccountNum())) {
				throw new NumberFormatException("setStaffInfo 실패:계좌번호 형식 오류");
			}
			if(session.update("staffMapper.setStaffInfo", vo) == 1){
				session.commit();
			} else {
				throw new RuntimeException("setStaffInfo update 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**직원목록 - 직원 소속파트 배정/변경*/
	public void setWorkPart(String staffId, int branchSeq, String workPart){
		setWorkPart(new StaffVO(staffId, branchSeq, workPart));
	}
	public void setWorkPart(StaffVO vo){
		SqlSession session = sqlSessionFactory.openSession();
	
		try {
			if(session.update("staffMapper.setWorkPart", vo) == 1){
				session.commit();
			} else {
				throw new RuntimeException("setWorkPart update 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**특정 직원의 입사/퇴사 날짜 존재여부 조회*/
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
	
	/**있는 지점인지 검사*/
	public boolean isBranchSeq(int branchSeq) {
		boolean result = false;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(session.selectOne("staffMapper.isBranchSeq", branchSeq)!=null) {
				result=true;
			};
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	

}
