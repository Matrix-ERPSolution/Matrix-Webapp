package com.itss.matrix.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import static com.itss.matrix.model.FormatCheckSolution.*;

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

	/**로그인 + 현재 비밀번호 일치여부 검사 + 비밀번호 재확인 검사(같은 쿼리문)*/
	public boolean login(String userId, String pw) {
		boolean result=false;
		Map<String, String> input = new HashMap<>();
		input.put("userId", userId);
		input.put("pw", pw);
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(!isInputLength(userId, 6, 16)||!isInputLength(pw, 6, 16)) {
				throw new RuntimeException("login 실패 inputLength");
			}
			if(session.selectOne("userMapper.login", input) != null){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**회원가입*/
	public void addUser(String userId, String pw, String phoneNum, String name, String birthYear, String birthMonth, String birthDay, String gender, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong, String profilePhoto) {
		addUser(new UserVO(userId, pw, phoneNum, name, birthYear, birthMonth, birthDay, gender, emailAccount, emailDomain, addressCity, addressGu, addressDong, profilePhoto));
	}
	
	/**회원가입(프로필 null)*/
	public void addUser(String userId, String pw, String phoneNum, String name, String birthYear, String birthMonth, String birthDay, String gender, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong) {
		addUser(new UserVO(userId, pw, phoneNum, name, birthYear, birthMonth, birthDay, gender, emailAccount, emailDomain, addressCity, addressGu, addressDong));
	}
	
	public void addUser(UserVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(!isFileFormat(vo.getProfilePhoto())){
				throw new RuntimeException("addUser 실패 profilePhotoFormat 오류");
			}
			if(!isDomainFormat(vo.getEmailDomain())){
				throw new RuntimeException("addUser 실패 emailDomainFormat 오류");
			}
			if(!isNumberFormat(vo.getPhoneNum())||!isNumberFormat(vo.getBirthYear())||!isNumberFormat(vo.getBirthMonth())||!isNumberFormat(vo.getBirthDay())){
				throw new RuntimeException("addUser 실패 휴대폰번호/생년월일 numberFormat 오류");
			}
			if(!isInputLength(vo.getUserId(), 6, 16)||!isInputLength(vo.getPw(), 6, 16)||!isInputLength(vo.getPhoneNum(), 10, 11)||!isInputLength(vo.getEmailAccount()+"@"+vo.getEmailDomain(), 0, 40)||!isInputLength(vo.getName(), 2, 4)||!isInputLength(vo.getBirthYear(), 4, 4)||!isInputLength(vo.getBirthMonth(), 2, 2)||!isInputLength(vo.getBirthDay(), 2, 2)){
				throw new RuntimeException("addUser 실패 inputLength 오류");
			}
			if(isUserId(vo.getUserId())) {
				throw new RuntimeException("addUser 실패 existingUserId");
			}
			if(!vo.getGender().equals("M") && !vo.getGender().equals("F")){
				throw new RuntimeException("addUser 실패 wrongGenderFormat");
			}
			if(vo.getProfilePhoto() != null) {
				session.insert("userMapper.addUser", vo);
			} else {
				session.insert("userMapper.addUserWithoutProfilePhoto", vo);
			}
			session.commit();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/**휴대폰 번호 중복 검사*/
	public boolean isUserPhoneNum(String phoneNum){
		boolean result = false;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(!isNumberFormat(phoneNum)){
				throw new RuntimeException("isUserPhoneNum 실패 휴대폰번호/생년월일 numberFormat 오류");
			}
			if(!isInputLength(phoneNum, 10, 11)) {
				throw new RuntimeException("isUserPhoneNum 실패 휴대폰번호 inputLength");
			}
			if(session.selectOne("userMapper.isUserPhoneNum", phoneNum) != null){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**아이디 중복 검사 + 아이디 유무 검사*/
	public boolean isUserId(String userId) {
		boolean result = false;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(!isInputLength(userId, 6, 16)) {
				throw new RuntimeException("isUserId 실패 userId inputLength 오류");
			}
			if(session.selectOne("userMapper.isUserId", userId) != null){
				result = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**비밀번호 재설정*/
	public void resetPw(String newPw, String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		input.put("newPw", newPw);
		input.put("userId", userId);
		try {
			if(!isInputLength(userId, 6, 16)||!isInputLength(newPw, 6, 16)){
				throw new RuntimeException("resetPw 실패 inputLength 오류");
			}
			if(!isUserId(userId)){
				throw new RuntimeException("resetPw 실패 null Id");
			}
			if (session.update("userMapper.setPw", input) == 1) {
				session.commit();
			} else {
				throw new RuntimeException("resetPw update 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
	}
	
	/**휴대폰 번호에 해당하는 아이디 보기*/
	public String getUserIdByPhoneNum(String phoneNum){
		SqlSession session = sqlSessionFactory.openSession();
		String result=null;
		try {
			if(!isNumberFormat(phoneNum)||!isInputLength(phoneNum, 10, 11)){
				throw new RuntimeException("getUserIdByPhoneNum 실패 phoneNum 형식/길이 오류");
			}
			result=session.selectOne("userMapper.getUserIdByPhoneNum", phoneNum);
			if(result==null) {
				throw new RuntimeException("getUserIdByPhoneNum 실패 null userId");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**아이디에 해당하는 휴대폰 번호 보기*/
	public String getUserPhoneNum(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		String result=null;
		try {
			if(!isInputLength(userId, 6, 16)){
				throw new RuntimeException("getUserPhoneNum 실패 inputLength 오류");
			}
			if(!isUserId(userId)){
				throw new RuntimeException("getUserPhoneNum 실패 null userId");
			}
			result=session.selectOne("userMapper.getUserPhoneNum", userId);
			if(result==null){
				throw new RuntimeException("getUserPhoneNum 실패 null phoneNum");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**기본 회원정보 변경*/
	public void setUserInfo(String userId, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong,  String phoneNum, String profilePhoto){
		setUserInfo(new UserVO(userId, emailAccount, emailDomain, addressCity, addressGu, addressDong, phoneNum, profilePhoto));
	}
	
	public void setUserInfo(UserVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			if(!isFileFormat(vo.getProfilePhoto())){
				throw new RuntimeException("setUserInfo 실패 profilePhotoFormat");
			}
			if(!isDomainFormat(vo.getEmailDomain())){
				throw new RuntimeException("setUserInfo 실패 emailDomainFormat");
			}
			if(!isNumberFormat(vo.getPhoneNum())||!isNumberFormat(vo.getBirthYear())||!isNumberFormat(vo.getBirthMonth())||!isNumberFormat(vo.getBirthDay())){
				throw new RuntimeException("setUserInfo 실패 휴대폰번호/생년월일 numberFormat");
			}
			if(!isInputLength(vo.getUserId(), 6, 16)||!isInputLength(vo.getPhoneNum(), 10, 11)||!isInputLength(vo.getEmailAccount()+"@"+vo.getEmailDomain(), 0, 40)||!isInputLength(vo.getBirthYear(), 4, 4)||!isInputLength(vo.getBirthMonth(), 2, 2)||!isInputLength(vo.getBirthDay(), 2, 2)){
				throw new RuntimeException("setUserInfo 실패 inputLength 오류");
			}
			if(!isUserId(vo.getUserId())) {
				throw new RuntimeException("setUserInfo 실패 null userId");
			}
			if(vo.getProfilePhoto() != null) {
				session.update("userMapper.setUserInfo", vo);				
			} else {
				session.update("userMapper.setUserInfoWithoutProfilePhoto", vo);
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/**현재 이름, 생년월일, 주소, 휴대폰번호, 프로필사진 보기*/
	public Map<String, String> getUserInfo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map = null;
		try {
			if(!isUserId(userId)){
				throw new RuntimeException("getUserInfo 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)){
				throw new RuntimeException("getUserInfo 실패 inputLength 오류");
			}
			map= session.selectOne("userMapper.getUserInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return map;
	}

	/**프로필 사진 첨부*/
	public void setProfilePhoto (String profilePhoto, String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map=new HashMap<>();
		map.put("newProfilePhoto", profilePhoto);
		map.put("userId", userId);
		try {
			if(!isUserId(userId)){
				throw new RuntimeException("setProfilePhoto 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)||!isInputLength(profilePhoto, 0, 40)){
				throw new RuntimeException("setProfilePhoto 실패 inputLength 오류");
			}
			if(!isFileFormat(profilePhoto)){
				throw new RuntimeException("setProfilePhoto 실패 profilePhotoFormat 오류");
			}
			if(session.update("userMapper.setProfilePhoto", map) == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}//차후에 슬라이드메뉴에서 프로필사진 변경 기능 추가할 경우 사용
	
	/**비밀번호 변경*/
	public void setPw(String newPw, String userId, String pw){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> input = new HashMap<>();
		input.put("newPw", newPw);
		input.put("userId", userId);
		input.put("pw", pw);
		try {
			if(!isUserId(userId)){
				throw new RuntimeException("setPw 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)||!isInputLength(newPw, 6, 16)||!isInputLength(pw, 6, 16)){
				throw new RuntimeException("setPw 실패 inputLength 오류");
			}
			if(newPw==pw){
				throw new RuntimeException("setPw 오류 newPw와 pw가 같음");
			}
			if(session.selectOne("userMapper.login", input) != null && session.update("userMapper.setPw", input) == 1){
				session.commit();
			} else {
				throw new RuntimeException("setPw select 실패");
			}         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/**프로필사진, 속한 지점, 회원인증유형, 이름 보기-슬라이드용*/
	//주의) staffs, branches와 겹치는 것 있음
	public Map<String, String> getAdminSlideInfo(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> result = null;
		try {
			if(!isUserId(userId)){
				throw new RuntimeException("getAdminSlideInfo 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)){
				throw new RuntimeException("getAdminSlideInfo 실패 idInputLength 오류");
			}
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
			if(!isUserId(userId)){
				throw new RuntimeException("getStaffSlideInfo 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)){
				throw new RuntimeException("getStaffSlideInfo 실패 idInputLength 오류");
			}
			result = session.selectOne("userMapper.getStaffSlideInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**회원 탈퇴*/
	public void removeUser(String userId, String pw) {
		Map<String, String> input = new HashMap<>();
		input.put("userId", userId);
		input.put("pw", pw);
		SqlSession session = sqlSessionFactory.openSession();
		try{
			if(!isUserId(userId)){
				throw new RuntimeException("removeUser 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)||!isInputLength(pw, 6, 16)){
				throw new RuntimeException("removeUser 실패 inputLength 오류");
			}
			if (session.update("userMapper.removeUser", input) == 1) {
				session.commit();
			} else {
				throw new RuntimeException("removeUser update 실패");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	/**회원 전체 아이디 목록 보기-테스트보조용*/
	public List<String> getUsers(){
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = session.selectList("userMapper.getUsers");
		return list;
	}
	
	/**관리자 or 직원 or 미인증자 여부 확인*/
	public Map getCertifiedInfo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		Map result = new HashMap<>();
		try {
			if(!isUserId(userId)){
				throw new RuntimeException("getCertifiedInfo 실패 nullUserId");
			}
			if(!isInputLength(userId, 6, 16)){
				throw new RuntimeException("getCertifiedInfo 실패 inputLength 오류");
			}
			result = session.selectOne("userMapper.isCertifiedAdmin", userId);
			if(result == null){
				result = session.selectOne("userMapper.isCertifiedStaff", userId);
				if(result != null){
					result.put("type", "staff");
				} else{
					return null;
				}
			} else {
				result.put("type", "admin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

}
