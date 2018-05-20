package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;

	public UserDAO() {
		InputStream inputStream = null;
		try {
			String resource = "com/itss/matrix/model/mapper/mybatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	/*로그인 + 현재 비밀번호 일치여부 검사 + 아이디저장(같은 쿼리문)*/
	public boolean login(String userId, String pw) {
		boolean result=false;
		Map<String, String> input = new HashMap<>();
		input.put("userId", userId);
		input.put("pw", pw);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			result = session.selectOne("userMapper.login", input).equals(userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}


	/*회원가입*/
	public void addUser(String userId, String pw, String phoneNum, String name, String birth, String gender, String email, String addressCity, String addressGu, String addressDong, int status, String profilePhoto) {
		addUser(new UserVO(userId, pw, phoneNum, name, birth, gender, email, addressCity, addressGu, addressDong, status, profilePhoto));
	}
	public void addUser(UserVO vo) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			session.insert("userMapper.addUser", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/*휴대폰 번호 중복 검사*/
	public boolean isUserPhoneNum(String phoneNum){
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;

		try {
			result = session.selectOne("userMapper.isUserPhoneNum", phoneNum).equals(phoneNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/*아이디 중복 검사 + 아이디 유무 검사*/
	public boolean isUserId(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		try {
			result = session.selectOne("userMapper.isUserId", userId).equals(userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/*비밀번호 재설정*/
	public void resetPw(String pw, String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		input.put("newPw", pw);
		input.put("userId", userId);
		try {
			if (session.selectOne("userMapper.isUserId", userId).equals(userId)) {
				session.update("userMapper.resetPw", input);
				session.commit();
			} else {
				//userId가 일치하지 않을 때
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
	}

	/*아이디에 해당하는 휴대폰 번호 보기*/
	public String getUserPhoneNum(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		String userPhoneNum=null;
		try {
			userPhoneNum=session.selectOne("userMapper.getUserPhoneNum", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return userPhoneNum;
	}
	/*비밀번호 재확인 검사*/
	public boolean isPw(String userId, String pw){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> input=new HashMap();
		boolean result=false;
		try {
			input.put("userId", userId);
			input.put("pw", pw);
			if(session.selectOne("userMapper.isPw", input) != null) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/*기본 회원정보 변경*/
	public void setUserInfo(String birth, String email, String addressCity, String addressGu, String addressDong,  String phoneNum, String profilePhoto, String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map=new HashMap();
		map.put("newBirth", birth);
		map.put("newEmail", email);
		map.put("newAddressCity", addressCity);
		map.put("newAddressGu", addressGu);
		map.put("newAddressDong", addressDong);
		map.put("newPhoneNum", phoneNum);
		map.put("newProfilePhoto", profilePhoto);
		map.put("userId", userId);
		try {
			if(session.selectOne("userMapper.isUserId", userId).equals(userId)) {
				session.update("userMapper.setUserInfo", map);
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/*현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
	public Collection<Map<String, String>> getUserInfo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> map = null;
		try {
			map= session.selectList("userMapper.getUserInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return map;
	}

	/*프로필 사진 첨부*/
	public void setProfilePhoto (String profilePhoto, String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map=new HashMap();
		map.put("newProfilePhoto", profilePhoto);
		map.put("userId", userId);
		try {
			if(session.update("userMapper.setProfilePhoto", map) == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}//기본 회원정보 변경에 포함되어있으나 일단 엑셀에 있어서 안지웠음

	/*비밀번호 변경*/
	public void setPw(String newPw, String userId, String pw){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		input.put("newPw", newPw);
		input.put("userId", userId);
		input.put("pw", pw);
		try {
			if (session.update("userMapper.setPw", input) == 1){
				System.out.println();
				session.commit();
			} else {
				//input오류
			}         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	/*프로필사진, 속한 지점, 회원인증유형, 이름 보기--슬라이드용*/
	//주의) staffs, branches와 겹치는 것 있음
	public Map<String, String> getAdminSlideInfo(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> result = null;
		try {
			result = session.selectOne("userMapper.getAdminSlideInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	public Map<String, String> getStaffSlideInfo(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> result = null;

		try {
			result = session.selectOne("userMapper.getStaffSlideInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/*탈퇴 - 연진*/
	public void removeUser(String userId, String pw) {
		Map<String, String> input = new HashMap<>();
		input.put("userId", userId);
		input.put("pw", pw);
		SqlSession session = sqlSessionFactory.openSession();
		if (session.update("userMapper.removeUser" , input) == 1) {
			session.commit();
		} else {
			//removeUser에서 user-status가 0으로 업데이트 안됐을 때
		}
		session.close();
	}


}
