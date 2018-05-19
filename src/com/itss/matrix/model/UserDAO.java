package com.itss.matrix.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class UserDAO {
	
/*로그인 + 현재 비밀번호 일치여부 검사(같은 쿼리문)*/
public boolean login(String userId, String pw) {
	return false;
}
	
/*회원가입*/
public void addUser(String userId, String pw, String phoneNum, String name, Date birth, char gender, String email, String addressCity, String addressGu, String addressDong, String profilePhoto) {
	
}
/*public void addUser(UserVO vo) {

}*/

/*휴대폰 번호 중복 검사*/
public boolean isUserPhoneNum(String phoneNum){
	return false;
}

/*아이디 중복 검사 + 아이디 유무 검사*/
public boolean isUserId(String userId) {
	return false;
}

/*비밀번호 재설정*/
public void resetPw(String pw, String userId){

}

/*아이디에 해당하는 휴대폰 번호 보기*/
public String getUserPhoneNum(String userId){
	String userPhoneNum="";
	return userPhoneNum;
}
/*비밀번호 재확인 검사*/
public boolean isPw(String userId, String pw){
	return false;
}

/*기본 회원정보 변경*/
public void setUserInfo(String birth, String email, String addressCity, String addressGu, String addressDong,  String phoneNum, String profilePhoto, String userId) {

}

/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
public Map<String, String> getUserInfo(String userId){
	Map<String, String> list = null;
	return list;
}

/*프로필 사진 첨부*/
public void setProfilePhoto (String profilePhoto, String userId){

}//기본 회원정보 변경에 포함되어있으나 일단 엑셀에 있어서 안지웠음

/*비밀번호 변경*/
public void setPw(String userId, String pw){

}

/*프로필사진, 속한 지점, 회원인증유형, 이름 보기--슬라이드용*/
	//주의) staffs, branches와 겹치는 것 있음
public Map<String, String> getAdminSlideInfo(String userId) {
	Map<String, String> list = null;
	return list;
}
public Map<String, String> getStaffSlideInfo(String userId) {
	Map<String, String> list = null;
	return list;
}

/*탈퇴*/
public void removeUser(String userId, String pw) {

}


}
