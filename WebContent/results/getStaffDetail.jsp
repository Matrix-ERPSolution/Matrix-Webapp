<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#staffSimpleTable td:nth-last-child(1), #staffSimpleTable td:nth-last-child(2) {
	border-bottom: 1px solid;
	border-color: rgb(50, 132, 226);
}

#staffDetailTable {
	width: 300px;
	border: 2px solid #FFFFFF;
	border-collapse: collapse;
	margin: 15px;
	font-size: 10pt;
	vertical-align: middle;
}

#staffDetailTable td {
	border: 2px solid #FFFFFF;
	padding: 5px 3px;
}

#staffDetailTable td:nth-child(1) {
	background: rgb(212, 229, 247);
}
#staffDetailTable td:nth-child(2), #staffDetailTable td:nth-child(3){
	background: rgb(230, 242, 255);
}

.detailProfilePhoto {
	border-radius: 50%;
	height: 100px;
	weight: 100px;
	float: left;
}
</style>
<div align="center" id="${staffDetail.STAFF_ID}">
	<table id="staffSimpleTable">
		<tr>
			<c:choose>
				<c:when test="${staffDetail.PROFILE_PHOTO != null}">
					<td rowspan="3" style="min-width: 120px;"><img class="detailProfilePhoto" src="images/profile/${staffDetail.PROFILE_PHOTO}"></td>
				</c:when>
				<c:otherwise>
					<td rowspan="4" style="min-width: 120px;"><img class="detailProfilePhoto" src="images/profile/defaultProfile.png"></td>
				</c:otherwise>
			</c:choose>
			<td>이름</td>
			<td>${staffDetail.NAME}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${staffDetail.GENDER}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${staffDetail.BIRTH}</td>
		</tr>	
	</table>
	
	<div style="float: center;">
		<table id="staffDetailTable" style="float: center;">
			<tr>
				<td>파트</td>
				<c:choose>
					<c:when test="${staffDetail.WORK_PART!=null}">
						<td>${staffDetail.WORK_PART}</td>
					</c:when>
					<c:otherwise>
						<td>미배정</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><span>${staffDetail.PHONE_NUM}</span>
					<img src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					onclick="detailStaffCall(this)" width="30" height="30" style="float: right;">
				</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td><span>${staffDetail.ACCOUNT_NUM}</span><span style="float: right;">${staffDetail.BANK_NAME}</span></td>
			</tr>
			
			<c:if test="${staffDetail.JOIN_DATE != null}">
				<tr>
					<td>입사날짜</td>
					<td>${staffDetail.JOIN_DATE}</td>
				</tr>
			</c:if>
			<c:if test="${staffDetail.LEAVE_DATE != null}">
				<tr>
					<td>퇴사날짜</td>
					<td>${staffDetail.LEAVE_DATE}</td>
				</tr>
			</c:if>
			
			<tr>
				<td>통장사본</td>
				<td>${staffDetail.BANK_FILE}</td>
			</tr>
			<tr>
				<td>이력서</td>
				<td>${staffDetail.RESUME_FILE}</td>
			</tr>
			<tr>
				<td>보건증</td>
				<td>${staffDetail.HEALTH_FILE}</td>
			</tr>
		</table>
	</div>
</div>
