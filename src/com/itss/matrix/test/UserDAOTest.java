package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO;

public class UserDAOTest {

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		/*휴대폰 번호 중복 검사*/
			//System.out.println(dao.isUserPhoneNum("01053710710")); //true, 기능ok
			//System.out.println(dao.isUserPhoneNum("01053710711")); //false, 기능ok
		/*아이디 중복 검사 + 아이디 유무 검사*/
			//System.out.println(dao.isUserId("lala")); //기능ok
		/*비밀번호 재설정*/
			//dao.resetPw("yunjin0000", "yunjin"); //기능 ok
		
		System.out.println("end");
	}

}
