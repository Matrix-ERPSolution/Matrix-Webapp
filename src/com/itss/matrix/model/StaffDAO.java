package com.itss.matrix.model;

import java.util.Collection;
import java.util.Map;

public class StaffDAO {
	/**배정할 파트 목록 보기: 업무배정, 업무재배정*/
	public Collection<String> getWorkParts(int branchSeq) {
		
		return null;
	}
	
	/**배정할 직원 목록 보기: 업무배정, 업무재배정  / 재직 중인 직원 목록 보기*/
	public Collection<Map<String, String>> getWorkingStaffs(int branchSeq) {
		
		return null;
	}

	/**직원 승인요청 목록 보기*/
	public Collection<Map<String, String>> getPreStaffs(int branchSeq){
		
		return null;
	}
	
	
	/**퇴사 직원 등록*/
	public void setLeaveDate(String leaveDate, String staffId){
		
	}
	
	/**퇴사한 직원 목록 보기*/
	public Collection<Map<String, String>> getLeavedStaffs(int branchSeq){
		
		return null;
	}
	
	/**직원 상세 정보 보기*/
	public Collection<Map<String, String>> getStaffDetail(String staffId){
		
		return null;
	}
	
	/**직원 등록*/
	public void addStaff(String staffId, int branchSeq, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		
		
		
		//113
		//insert into staffs(staff_seq, staff_id, branch_seq, join_date, leave_date, work_part, bank_name, account_num, resume_file, health_file, bank_file) 
		//values(staff_seq.nextval, ?, ?, null, null, null, ?, ?, ?, ?, ?);
	}
	
	/**직원 회원정보 변겅 - 모든 정보*/
	public void setStaffInfo(String resumeFile, String healthFile, String bankFile, String bankName, String accountNum, String staffId){
		
	}

	
}
