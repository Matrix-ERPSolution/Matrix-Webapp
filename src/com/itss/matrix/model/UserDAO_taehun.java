package com.itss.matrix.model;

import java.util.Collection;
import java.util.Map;

/**
 * @author COM
 *
 */
public class UserDAO_taehun {
	/**로그인 처리: 입력받은 id, pw를 users의 값과 조회 */
	public boolean getLoginUser(String id, String pw){
		return false;
	}
	
	/**회원가입 처리:  */
	public boolean addUser(String id, String pw, String phoneNum, String name, String birth, String gender, String email, String addressCity, String addressGu, String addressDong, int status, String profilePhoto) {
		return false;
	}
	
	/**회원정보 변경 */
	public boolean setUser(String id, String email, String addressCity, String addressGu, String addressDong, String phoneNum){
		return false;
	}
	
	/**ID 찾기 */
	public Map<String, String> findId(String name, String phoneNum){
		return null;
	}
	
	/**pw 찾기 */
	public Map<String, String> findPw(String id, String phoneNum){
		return null;
	}
	
	/**pw 재설정 */
	public boolean setNewPw(String id, String pw){
		return false;
	}
		
	/**ID 중복 검사: 입력한 ID가 users에 이미 존재하는지. */
	public boolean getDuplicationId(String id) {
		return false;
	}
	
	/**휴대폰 번호 중복 검사 */
	public boolean getDuplicationPhone(String phoneNum) {
		return false;
	}
	
	/**인증 요청:직원 */
	public boolean getCertificationStaff(String id, int branchSeq, String joinDate, String leaveDate, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		return false;
	}
	
	/**인증 요청:관리자 */
	public boolean getCertificationAdmin(String id, String branchName){
		return false;
	}
	
	/**휴대폰번호 유효성 검사 */
	public boolean getValidationPhone(String phoneNum){
		return false;
	}
	
	/**이메일주소 유효성 검사 */
	public boolean getValidationEmail(String email){
		return false;
	}

}
