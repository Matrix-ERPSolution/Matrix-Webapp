package com.itss.matrix.model;

public class UserVO {
	private String userId;
	private String pw;
	private String phoneNum;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String addressCity;
	private String addressGu;
	private String addressDong;
	private String profilePhoto;
	
	/*회원가입*/
	public UserVO(String userId, String pw, String phoneNum, String name, String birth, String gender, String email, String addressCity, String addressGu, String addressDong, String profilePhoto) {
		setUserId(userId);
		setPw(pw);
		setPhoneNum(phoneNum);
		setName(name);
		setBirth(birth);
		setGender(gender);
		setEmail(email);
		setAddressCity(addressCity);
		setAddressGu(addressGu);
		setAddressDong(addressDong);
		setProfilePhoto(profilePhoto);
	}
	/*profilePhoto가 null일 때 회원가입*/
	public UserVO(String userId, String pw, String phoneNum, String name, String birth, String gender, String email, String addressCity, String addressGu, String addressDong) {
		setUserId(userId);
		setPw(pw);
		setPhoneNum(phoneNum);
		setName(name);
		setBirth(birth);
		setGender(gender);
		setEmail(email);
		setAddressCity(addressCity);
		setAddressGu(addressGu);
		setAddressDong(addressDong);
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

	public String getBirth() {
		return birth;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
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

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", phoneNum=" + phoneNum + ", name=" + name + ", birth="
				+ birth + ", gender=" + gender + ", email=" + email + ", addressCity=" + addressCity + ", addressGu="
				+ addressGu + ", addressDong=" + addressDong + ", profilePhoto=" + profilePhoto
				+ "]";
	}
}
