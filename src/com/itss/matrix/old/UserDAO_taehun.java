package com.itss.matrix.old;

import java.util.Collection;
import java.util.Map;

/**
 */
public class UserDAO_taehun {
	/**로그인 select user_id from users where user_id=? And pw=?; */
	public boolean getLoginUser(String userId, String pw){
		return false;
	}
	
	/**회원가입 insert into users (user_id, pw, phone_num, name, birth, gender, email, address_city, address_gu, address_dong, status, profile_photo) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ? );  */
	public boolean addUser(String userId, String pw, String phoneNum, String name, String birth, String gender, String email, String addressCity, String addressGu, String addressDong, int status, String profilePhoto) {
		return false;
	}
	
	/**회원정보 변경 update users set email=?, address_city=?, address_gu=?, address_dong=?, phone_num=? where user_id=?;
 */
	public boolean setUser(String userId, String email, String addressCity, String addressGu, String addressDong, String phoneNum){
		return false;
	}
	
	/**아이디 유무 검사 select count(user_id) from users where user_id = ?; */
	public Map<String, String> finduserId(String name, String phoneNum){
		return null;
	}
	
	/**아이디에 해당하는 휴대폰 번호 보기	select phone_num from users where user_id=?; */
	public Map<String, String> getPhoneNUm(String userId, String phoneNum){
		return null;
	}
	
	
	/**비밀번호 재확인 검사	select count(pw) from users where user_id=? and pw=?; */
	public boolean findPw(String userId, String phoneNum){
		return false;
	}
	
	/**비밀번호 재설정 update users set pw=? where user_id=?; */
	public boolean setNewPw(String userId, String pw){
		return false;
	}
		
	/**아이디 중복 검사 select count(user_id) from users where user_id = ?; */
	public boolean isExistUserId(String userId) {
		return false;
	}
	
	/**휴대폰 번호 중복 검사 select count(phone_num) from users where phone_num=?; */
	public boolean isExistPhoneNum(String phoneNum) {
		return false;
	}
	
	/**직원 회원 인증 요청 insert into staffs(staff_seq, staff_id, branch_seq, bank_name, account_num, resume_file, health_file, bank_file) values(staff_seq.nextval, ?, ?, ?, ?, ?, ?, ?); */
	public boolean getCertificationStaff(String userId, int branchSeq, String joinDate, String leaveDate, String bankName, String accountNum, String resumeFile, String healthFile, String bankFile){
		return false;
	}
	
	/**관리자 회원 인증 요청	 insert into admins(admin_seq, admin_id, branch_seq) values(admin_seq.nextval, ?, (select branch_seq from branches where branch_name=?));  */
	public boolean getCertificationAdmin(String userId, String branchName){
		return false;
	}
	
/*	여기서 처리할 일이 아님. 서블릿 단에서 사용할 예정.
 * *//**휴대폰번호 유효성 검사 *//*
	public boolean getValuserIdationPhone(String phoneNum){
		return false;
	}
	
	*//**이메일주소 유효성 검사 *//*
	public boolean getValuserIdationEmail(String email){
		return false;
	}
*/
}
