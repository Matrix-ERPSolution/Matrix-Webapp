package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO_partTaehun;

public class UserDAOTest_Taehun {
	public static void main(String[] args) {
		UserDAO_partTaehun dao=new UserDAO_partTaehun();
		//System.out.println(dao.getUserPhoneNum("taehun"));	//기능ok
		//System.out.println(dao.getUserPhoneNum("dead"));		//비기능: cmd-선택된 레코드가 없습니다. / console-null
		//System.out.println(dao.isPw("taehun","taehun1234"));	//기능 ok
		//System.out.println(dao.isPw("taehun", "dead"));			//비기능: cmd-선택된 레코드가 없습니다. / console-false
		//System.out.println(dao.getUserInfo("taehun"));		//기능 ok.
		//dao.setUserInfo("1990/10/30", "otamot1029@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun", "taehun");
		//dao.setProfilePhoto("hunt2ae.jpg", "taehun");

	}

}
