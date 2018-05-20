package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO;

public class UserDAOTestTaehun {
	public static void main(String[] args) {
		UserDAO dao=new UserDAO();
		/*아이디에 해당하는 휴대폰 번호 보기*/
		//System.out.println(dao.getUserPhoneNum("taehun"));	//기능 ok
		//System.out.println(dao.getUserPhoneNum("dead"));		//비기능: cmd-선택된 레코드가 없습니다. / console-null
		//System.out.println(dao.getUserPhoneNum(null));		//비기능: cmd=SqlException, TypeException
		/*비밀번호 재확인 검사*/
		//System.out.println(dao.isPw("taehun","taehun1234"));	//기능 ok
		//System.out.println(dao.isPw("taehun", "dead"));		//비기능: cmd-선택된 레코드가 없습니다. / console-false
		//System.out.println(dao.isPw("dead", "pool"));			//비기능: console-false
		//System.out.println(dao.isPw("taehun", "pool"));		//비기능: console-false
		//System.out.println(dao.isPw("dead", "taehun1234"));	//비기능: console-false
		//System.out.println(dao.isPw(null, null));
		//System.out.println(dao.isPw("taehun", null));
		//System.out.println(dao.isPw(null, "taehun1234"));
		/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
		//System.out.println(dao.getUserInfo("taehun"));		//기능 ok (날짜 출력 양식 YYYY/MM/DD)
		//System.out.println(dao.getUserInfo("dead")); //비기능: null 
		//System.out.println(dao.getUserInfo(null)); //비기능: null
		/*프로필사진, 속한 지점, 회원인증유형, 이름 보기--슬라이드용*/		
		//System.out.println(dao.getStaffSlideInfo("yunjin")); //기능 ok
		//System.out.println(dao.getStaffSlideInfo("dead"));	//비기능: null
		//System.out.println(dao.getStaffSlideInfo(null));	//비기능: null
		
		/*기본 회원정보 변경*/
		//dao.setUserInfo("1990/11/09", "dametime@naver.com", "서울시", "용산구", "서계동", "01022223333", null, "yunseok");
		//dao.setUserInfo(null, "dametime@naver.com", "서울시", "용산구", "서계동", "01022223333", null, "yunseok");
		/*프로필 사진 첨부*/
		//dao.setProfilePhoto(null, "yunseok");	//
		
		
		System.out.println("end");

	}

}
