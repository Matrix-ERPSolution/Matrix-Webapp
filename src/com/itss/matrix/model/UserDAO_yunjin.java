package com.itss.matrix.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class UserDAO_yunjin {
/*로그인*/
public boolean login(String userId, String pw) {
	return false;
}
	
/*회원가입*/
public void addUser(String userId, String pw, String phoneNum, String name, Date birth, char gender, String email, String addressCity, String addressGu, String addressDong, String profilePhoto) {

}
	/*public boolean addUser(UserVO vo) {
		return false;
	}*/

/*아이디 중복 검사*/
public boolean getDuplicationId(String userId) {
	return false;
}

/*휴대폰 번호 중복 검사*/
public boolean phoneNumOverlap(String phoneNum){
	return false;
}

/*비밀번호 변경*/
public boolean changePw(String userId, String pw){
	return false;
}
/*아이디에 해당하는 휴대폰 번호 보기*/
public String getPhoneNum(String userId){
	String phoneNum="";
	return phoneNum;
}

/*기본 회원정보 변경*/
public boolean changeUserInfo(String userId, String phoneNum, String name, Date birth, char gender, String email, String addressCity, String addressGu, String addressDong, String profilePhoto) {
	return false;
} //어떤 회원정보?

/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
public Map<String, String> getUserInfo(String userId){
	Map<String, String> list = null;
	return list;
}

/*프로필 사진 첨부*/
public boolean updateProfilePhoto (String userId, String profilePhoto){
	return false;
}
/*회원탈퇴*/
public boolean dropUser(String userId, String pw){
	return false;
}
}
