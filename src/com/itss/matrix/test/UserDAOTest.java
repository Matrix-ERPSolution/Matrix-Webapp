package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO;
import com.itss.matrix.model.UserVO;

public class UserDAOTest {

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		/*로그인 + 현재 비밀번호 일치여부 검사 + 아이디저장(같은 쿼리문)*/
			//System.out.println(dao.login("chulsoo", "chulsoo1234"));   //기능 ok
		/*회원가입*/
			//dao.addUser(new UserVO("tester01", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1, "profilePhoto.png"));   //기능 ok
	    	//System.out.println(dao.isUserPhoneNum("01099887766"));   //기능 ok
		/*휴대폰 번호 중복 검사*/
			//System.out.println(dao.isUserPhoneNum("01053710710")); //true, 기능ok
			//System.out.println(dao.isUserPhoneNum("01053710711")); //false, 기능ok
		/*아이디 중복 검사 + 아이디 유무 검사*/
			//System.out.println(dao.isUserId("lala")); //기능ok
		/*비밀번호 재설정*/
			//dao.resetPw("yunjin0000", "yunjin"); //기능 ok
		
		
		
		/*탈퇴*/
			//dao.removeUser("yunjin", "yunjin1234"); //기능ok
			//dao.removeUser("chulsoo", "chulsoo1234"); //이미 status=0인 레코드는 아무것도 안바뀜
		//System.out.println("end");
	}

}
