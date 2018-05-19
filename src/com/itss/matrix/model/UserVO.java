package com.itss.matrix.model;

import java.sql.Date;

public class UserVO {
	private String userId;
	private String pw;
	private String phoneNum;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String addressCity;
	private String addressGu;
	private String addressDong;
	private int status;
	private String profilePhoto;
	
	/*회원가입*/
	public UserVO(String userId, String pw, String phoneNum, String name, Date birth, char gender, String email, String addressCity, String addressGu, String addressDong, String profilePhoto) {
		
	}
	/*탈퇴*/

	public String getUserId() {
		return userId;
	}
	
	/*구현중*/
}
