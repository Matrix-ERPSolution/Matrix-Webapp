package com.itss.matrix.model;

public class UserVO {
	private String userId;
	private String pw;
	private String phoneNum;
	private String name;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private String gender;
	private String emailAccount;
	private String emailDomain;
	private String addressCity;
	private String addressGu;
	private String addressDong;
	private String profilePhoto;
	
	/**회원가입*/
	public UserVO(String userId, String pw, String phoneNum, String name, String birthYear, String birthMonth, String birthDay, String gender, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong, String profilePhoto) {
		setUserId(userId);
		setPw(pw);
		setPhoneNum(phoneNum);
		setName(name);
		setBirthYear(birthYear);
		setBirthMonth(birthMonth);
		setBirthDay(birthDay);
		setGender(gender);
		setEmailAccount(emailAccount);
		setEmailDomain(emailDomain);
		setAddressCity(addressCity);
		setAddressGu(addressGu);
		setAddressDong(addressDong);
		setProfilePhoto(profilePhoto);
	}
	
	/**profilePhoto가 null일 때 회원가입*/
	public UserVO(String userId, String pw, String phoneNum, String name, String birthYear, String birthMonth, String birthDay, String gender, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong) {
		setUserId(userId);
		setPw(pw);
		setPhoneNum(phoneNum);
		setName(name);
		setBirthYear(birthYear);
		setBirthMonth(birthMonth);
		setBirthDay(birthDay);
		setGender(gender);
		setEmailAccount(emailAccount);
		setEmailDomain(emailDomain);
		setAddressCity(addressCity);
		setAddressGu(addressGu);
		setAddressDong(addressDong);
	}
	
	/**회원정보 변경용*/
	public UserVO(String userId, String emailAccount, String emailDomain, String addressCity, String addressGu, String addressDong,  String phoneNum, String profilePhoto){
		setUserId(userId);
		setEmailAccount(emailAccount);
		setEmailDomain(emailDomain);
		setAddressCity(addressCity);
		setAddressGu(addressGu);
		setAddressDong(addressDong);
		setPhoneNum(phoneNum);
		setProfilePhoto(profilePhoto);
	}
	
	//setPW만 private
	public String getUserId() {
		return userId;
	}

	public String getPw() {
		return pw;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public String getName() {
		return name;
	}

	public String getBirthYear() {
		return birthYear;
	}
	
	public String getBirthMonth() {
		return birthMonth;
	}
	
	public String getBirthDay() {
		return birthDay;
	}

	public String getGender() {
		return gender;
	}

	public String getEmailAccount() {
		return emailAccount;
	}
	
	public String getEmailDomain() {
		return emailDomain;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public String getAddressGu() {
		return addressGu;
	}

	public String getAddressDong() {
		return addressDong;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private void setPw(String pw) {
		this.pw = pw;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setEmailAccount(String emailAccount) {
		this.emailAccount = emailAccount;
	}
	
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public void setAddressGu(String addressGu) {
		this.addressGu = addressGu;
	}

	public void setAddressDong(String addressDong) {
		this.addressDong = addressDong;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserVO other = (UserVO) obj;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}


}
