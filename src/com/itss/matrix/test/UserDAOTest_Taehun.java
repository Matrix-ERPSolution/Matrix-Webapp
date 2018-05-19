package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO_partTaehun;

public class UserDAOTest_Taehun {
	public static void main(String[] args) {
		UserDAO_partTaehun dao=new UserDAO_partTaehun();
		//System.out.println(dao.getUserPhoneNum("taehun"));	//getUserPhoneNum(userId) valid case: ok
		//System.out.println(dao.getUserPhoneNum("dead"));	//invalid case
		//System.out.println(dao.isPw("taehun","taehun1234"));//isPw valid case: 기능 ok
		//System.out.println(dao.isPw("taehun", "dead"));		//isPw invalid case
		//System.out.println(dao.getUserInfo("taehun"));	//valid case: ok.
		//dao.setUserInfo("1990/10/30", "otamot1029@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun", "taehun");
		dao.setProfilePhoto("hunt2ae.jpg", "taehun");

	}

}
