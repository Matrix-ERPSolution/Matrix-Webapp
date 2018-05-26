package com.itss.matrix.test;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.itss.matrix.model.UserDAO;
import com.itss.matrix.model.UserVO;

public class UserDAOUnitTest {
	static UserDAO dao;
	@BeforeClass
	public static void beforeClass(){
		dao = new UserDAO();
	}
	
	@Test
	public void correctUnitTest(){
		
		assertTrue(dao.login("chulsoo", "chulsoo1234"));
		
		assertNotNull(dao.getUsers());
		int cnt = dao.getUsers().size();
		dao.addUser(new UserVO("tester01", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", "profilePhoto.png"));
		assertEquals(cnt+1, dao.getUsers().size());
		
		cnt = dao.getUsers().size();
		dao.addUser("tester02", "tester", "01044556677", "테스터2", "2018/05/20", "M", "email2@email2.com", "서울시", "송파구", "문정동", "profilePhoto2.png");
		assertEquals(cnt+1, dao.getUsers().size());
		
		cnt = dao.getUsers().size();
		dao.addUser("tester03", "tester", "01099887766", "테스터3", "2018/05/19", "F", "email3@email.com", "서울시", "송파구", "가락동");
		assertEquals(cnt+1, dao.getUsers().size());
		
		cnt = dao.getUsers().size();
		dao.addUser("tester04", "tester", "01077665454", "테스터4", "2018/05/19", "F", "email4@email.com", "서울시", "송파구", "가락동", null);
		assertEquals(cnt+1, dao.getUsers().size());
		
		assertTrue(dao.isUserPhoneNum("01053710710"));
		
		assertFalse(dao.isUserPhoneNum("01000000000"));
		
		assertTrue(dao.isUserId("yunjin"));
		
		assertFalse(dao.isUserId("wrongid"));
		
		dao.resetPw("yunjin1234", "yunjin");
		assertTrue(dao.login("yunjin", "yunjin1234"));
		
		assertNotNull(dao.getUserPhoneNum("taehun"));
		
		Map<String, String> user = dao.getUserInfo("taehun");
		dao.setUserInfo("newnewnew9999@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun.jpg", "taehun");
		assertNotEquals(user, dao.getUserInfo("taehun"));
		
		user = dao.getUserInfo("taehun");
		dao.setProfilePhoto("newnew.jpg", "taehun");
		assertNotEquals(user, dao.getUserInfo("taehun"));
		
		assertNotNull(dao.getUserInfo("taehun"));
		
		user = dao.getUserInfo("taehun");
		dao.setProfilePhoto("newphoto.jpg", "taehun");
		assertNotEquals(user, dao.getUserInfo("taehun"));
		
		dao.setPw("newnew","tester01","heyhey");
		assertTrue(dao.login("tester01", "newnew"));
		
		assertNotNull(dao.getAdminSlideInfo("yunyoung"));
		
		cnt = dao.getUsers().size();
		dao.removeUser("minsu", "minsu1234");
		assertEquals(cnt-1, dao.getUsers().size());
		
		assertNotNull(dao.getCertifiedInfo("yunyoung"));
	}
	
	@Test
	public void loginWithWrongId() {
		assertFalse(dao.login("hi", "hi1234"));
	}
	
	@Test
	public void loginWithWrongPw(){
		assertFalse(dao.login("chulsoo", "wrong1234"));
	}
	
	@Test
	public void addUserWithExistId(){
		int cnt = dao.getUsers().size();
		dao.addUser(new UserVO("yunjin", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", "profilePhoto.png"));
		assertEquals(cnt, dao.getUsers().size());
	}
	
	@Test
	public void isUserPhoneNumWithWrongFormat(){
		assertFalse(dao.isUserPhoneNum("tester"));
	}
	
	@Test
	public void isUserIdWithWrongFormat(){
		assertFalse(dao.isUserId("0000"));
	}

	//@Test	//Exception 아직 적용 안됨. 해야함.
	public void resetPwWithWrongFormat(){
		dao.resetPw("0000", "yunjin");
		assertFalse(dao.login("yunjin", "0000"));
	}
	
	@Test
	public void getUserPhoneNumWithWrongId(){
		assertNull(dao.getUserPhoneNum("wrongid"));
	}
	
	@Test
	public void setUserInfoWithWrongId(){
		Map<String, String> user = dao.getUserInfo("wrongid");
		dao.setUserInfo("newnewnew9999@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun.jpg", "wrongid");
		assertEquals(user, dao.getUserInfo("wrongid"));
	}
	
	//@Test	//첨부파일형식  Exception 아직 구현 안됨. 해야함.
	public void setUserInfoWithWrongPhotoFormat(){
		Map<String, String> user = dao.getUserInfo("taehun");
		dao.setUserInfo("oracle@naver.com", "강원도", "춘천시", "명동", "01043124312", "taehun.txt", "taehun");
		assertEquals(user, dao.getUserInfo("taehun"));
	}
	
	@Test
	public void getUserInfoWithWrongId(){
		assertNull(dao.getUserInfo("dead"));
	}

	@Test
	public void setPwWithWrongOldPw(){
		dao.setPw("newpassword","taehun","wrongpassword");
		assertFalse(dao.login("taehun", "newpassword"));
	}

	@Test
	public void getAdminSlideInfoWithWrongId(){
		assertNull(dao.getAdminSlideInfo("wrongid"));
	}
	
	@Test
	public void removeUserWithWrongId(){
		int cnt = dao.getUsers().size();
		dao.removeUser("wrongid", "password");
		assertEquals(cnt, dao.getUsers().size());
	
	
	@Test
	public void getCertifiedInfo(){
		assertNull(dao.getCertifiedInfo("ssss"));
	}
	
}
