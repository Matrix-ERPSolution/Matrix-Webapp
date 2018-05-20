package com.itss.matrix.test;

import com.itss.matrix.model.UserDAO;
import com.itss.matrix.model.UserVO;

public class UserDAOTest {
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		/*로그인 + 현재 비밀번호 일치여부 검사 + 아이디저장(같은 쿼리문)*/
			//System.out.println(dao.login("chulsoo", "chulsoo1234"));   //기능 ok true
			//System.out.println(dao.login("hi", "hi1234")); //비기능-없는 사용자: NullPointerException, false
			//System.out.println(dao.login("hi")); //비기능- 매개인자 부족: Exception
			//System.out.println(dao.login("hi", "hi1234", "moreParameter")); //비기능- 매개인자 초과: Exception
			//System.out.println(dao.login("2018/05/23", "")); //비기능 - 잘못된 매개인자타입: NullPointerException, false
		/*회원가입*/
			//dao.addUser(new UserVO("tester01", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1, "profilePhoto.png"));   //기능 ok
			//dao.addUser("tester02", "tester", "01044556677", "테스터2", "2018/05/20", "M", "email2@email2.com", "서울시", "송파구", "문정동", 1, "profilePhoto2.png");	//기능 ok
			//ao.addUser("tester03", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1); 	//null항목을 안써도 ok
			//dao.addUser("tester02", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1, null); //기능ok, null 명시필요
			//dao.addUser("tester01", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", null, null, null, 1, "profilePhoto2.png");
				//비기능-not null에 null값 입력시: cmd-선택된 레코드가 없습니다, console-org.apache.ibatis.exceptions.PersistenceException
			//dao.addUser(new UserVO("yunjin", "tester", "01099887766", "테스터", "2018/05/19", "F", "email@email.com", "서울시", "송파구", "가락동", 1, "profilePhoto.png"));
				//비기능-중복pk값 입력: cmd-선택된 레코드가 없습니다, console-java.sql.SQLException: ORA-00001: 무결성 제약 조건(HR.PK_USERS)에 위배됩니다
		/*휴대폰 번호 중복 검사*/
			//System.out.println(dao.isUserPhoneNum("01053710710")); //true, 기능 ok
			//System.out.println(dao.isUserPhoneNum("01053710711")); //비기능-없는 번호: NullPointerException, false
			//System.out.println(dao.isUserPhoneNum("tester")); //비기능 - 잘못된 매개인자타입: NullPointerException, false
			//System.out.println(dao.isUserPhoneNum()); //비기능- 매개인자 없음: Exception
			//System.out.println(dao.isUserPhoneNum("tester", "tester2")); //비기능- 매개인자 초과: Exception
		/*아이디 중복 검사 + 아이디 유무 검사*/
			//System.out.println(dao.isUserId("yunjin")); //기능 ok true
			//System.out.println(dao.isUserId("hi")); //비기능-없는 id: NullPointerException, false
			//System.out.println(dao.isUserId("0000")); //비기능 - 잘못된 매개인자타입: NullPointerException, false
			//System.out.println(dao.isUserId()); //비기능- 매개인자 없음: Exception
			//System.out.println(dao.isUserId("tester", "tester2")); //비기능- 매개인자 초과: Exception
		/*비밀번호 재설정*/
			//dao.resetPw("yunjin1234", "yunjin"); //기능 ok
			//dao.resetPw("yunjin0000", "tester"); //비기능-없는 id: NullPointerException
			//dao.resetPw(null, "yunjin"); //비기능-하나 이상 null값 입력: org.apache.ibatis.type.TypeException
		/*아이디에 해당하는 휴대폰 번호 보기*/
			//System.out.println(dao.getUserPhoneNum("taehun"));   //기능 ok
			//System.out.println(dao.getUserPhoneNum("dead"));      //비기능: cmd-선택된 레코드가 없습니다. / console-null
			//System.out.println(dao.getUserPhoneNum(null));      //비기능: cmd=SqlException, TypeException
		/*비밀번호 재확인 검사*/
			//System.out.println(dao.isPw("taehun","taehun1234"));   //기능 ok
			//System.out.println(dao.isPw("taehun", "dead"));      //비기능: cmd-선택된 레코드가 없습니다. / console-false
			//System.out.println(dao.isPw("dead", "pool"));         //비기능: console-false
			//System.out.println(dao.isPw("taehun", "pool"));      //비기능: console-false
			//System.out.println(dao.isPw("dead", "taehun1234"));   //비기능: console-false
			//System.out.println(dao.isPw(null, null));			//비기능: org.apache.ibatis.exceptions.PersistenceException, .TypeException 
			//System.out.println(dao.isPw("taehun", null));	//비기능: org.apache.ibatis.exceptions.PersistenceException, .TypeException 
			//System.out.println(dao.isPw(null, "taehun1234"));	//비기능: org.apache.ibatis.exceptions.PersistenceException, .TypeException 
		/*기본 회원정보 변경*/
			//dao.setUserInfo("1990/10/30", "newnewnew9999@naver.com", "경기도", "광명시", "철산동", "01032828508", "taehun", "taehun");	//기능 ok
			//dao.setUserInfo("1999/12/31", "oracle@naver.com", "강원도", "춘천시", "명동", "01043124312", "taehun.txt", "taehun");//기능 ok: profile_photo != null
			//dao.setUserInfo("1999/12/31", "oracle@naver.com", "강원도", "춘천시", "명동", "01043124312", null, "taehun");//기능 ok: profile_photo == null
		/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
			//System.out.println(dao.getUserInfo("taehun"));      //기능 ok (날짜 출력 양식 YYYY/MM/DD)
			//System.out.println(dao.getUserInfo("dead")); //비기능: null 
			//ystem.out.println(dao.getUserInfo(null)); //비기능: null
		/*프로필 사진 첨부*/
			//dao.setProfilePhoto("newnewnew.jpg", "taehun");	//기능 ok
			//dao.setProfilePhoto(null, "yunseok");   
				//비기능: 예외 발생-org.apache.ibatis.exceptions.PersistenceEception, org.apache.ibatis.type.TypeException, java.sql.SQLException: 부적합한 열 유형
				//'newProfilePhoto'에 null값을 매핑할 수 없어서 오류 발생:   profile_photo 컬럼: null 허용; sql 구문에는 문제 없음.   
		/*비밀번호 변경*/
			//dao.setPw("heyhey","tester01","newnew"); //기능 ok
			//dao.setPw("yunjin0000","yunjin","yunjin1234","moreParameter"); //비기능-매개인자 없음,부족, 초과: Exception
		/*프로필사진, 속한 지점, 회원인증유형, 이름 보기--슬라이드용*/		
			//System.out.println(dao.getAdminSlideInfo("yunyoung")); //기능 ok
			//System.out.println(dao.getAdminSlideInfo("tester")); //비기능-없는 사용자: console-null
			//System.out.println(dao.getAdminSlideInfo()); //비기능- 매개인자 없음: Exception
			//System.out.println(dao.getAdminSlideInfo("yunyoung", "tester")); //비기능- 매개인자 초과: Exception
			//System.out.println(dao.getStaffSlideInfo("taehun")); //기능 ok
			//System.out.println(dao.getStaffSlideInfo("dead"));   //비기능: null
			//System.out.println(dao.getStaffSlideInfo(null));   //비기능: null
		/*탈퇴*/
			//dao.removeUser("yunjin", "yunjin1234"); //기능ok
			//dao.removeUser("chulsoo", "chulsoo1234"); //기능ok, 이미 status=0인 레코드는 아무것도 안바뀜
			//dao.removeUser("tester", "tester2"); //비기능-없는 사용자: 아무것도 안바뀜
			//dao.removeUser("yunjin", "yunjin88"); //비기능-잘못된 비밀번호: 아무것도 안바뀜
			//dao.removeUser(null, null); //비기능-하나 이상 null값 입력: org.apache.ibatis.type.TypeException
		System.out.println("end");
	}

}
