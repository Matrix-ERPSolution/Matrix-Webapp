package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO;
import com.itss.matrix.model.UserVO;

public class UserDAOTest {

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		/*로그인 + 현재 비밀번호 일치여부 검사 + 아이디저장(같은 쿼리문)*/
			//System.out.println(dao.login("chulsoo", "chulsoo1234"));   //기능 ok true
		/*회원가입*/
			//dao.addUser(new UserVO("tester01", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1, "profilePhoto.png"));   //기능 ok
		/*휴대폰 번호 중복 검사*/
			//System.out.println(dao.isUserPhoneNum("01053710710")); //true, 기능 ok
			//System.out.println(dao.isUserPhoneNum("01053710711")); //false, 기능 ok
		/*아이디 중복 검사 + 아이디 유무 검사*/
			//System.out.println(dao.isUserId("lala")); //기능 ok false
			//System.out.println(dao.isUserId("yunjin")); //기능 ok true
		/*비밀번호 재설정*/
			//dao.resetPw("yunjin0000", "yunjin"); //기능 ok
		/*아이디에 해당하는 휴대폰 번호 보기*/
			//System.out.println(dao.getUserPhoneNum("taehun"));	//기능 ok
			//System.out.println(dao.getUserPhoneNum("dead"));		//비기능: cmd-선택된 레코드가 없습니다. / console-null
		/*비밀번호 재확인 검사*/
			//System.out.println(dao.isPw("taehun","taehun1234"));	//기능 ok
			//System.out.println(dao.isPw("taehun", "dead"));		//비기능: cmd-선택된 레코드가 없습니다. / console-false
		/*기본 회원정보 변경*/
			//dao.setUserInfo("1990/10/30", "otamot1029@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun", "taehun");	//기능 ok
		/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
			//System.out.println(dao.getUserInfo("taehun"));		//기능 ok (날짜 출력 양식 YYYY/MM/DD)
		/*프로필 사진 첨부*/
			//dao.setProfilePhoto("hunt2ae.jpg", "taehun");	//기능 ok
		/*비밀번호 변경*/
			//dao.setPw("newnew","tester01","tester"); //기능 ok
		/*프로필사진, 속한 지점, 회원인증유형, 이름 보기--슬라이드용*/		
			
		/*탈퇴*/
			//dao.removeUser("yunjin", "yunjin1234"); //기능 ok
			//dao.removeUser("chulsoo", "chulsoo1234"); //이미 status=0인 레코드는 아무것도 안바뀜
		System.out.println("\nend");
	}

}
