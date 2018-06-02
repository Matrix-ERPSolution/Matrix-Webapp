<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#detailTable {
	width: 300px;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin-top: 15px;
	font-size: 10pt;
}

#detailTable td {
	border: 1px solid #444444;
	padding: 5px;
}

ul {
	list-style-type: none;
	width: 100px;
	display: table;
	table-layout: fixed;
}

li {
	display: table-cell;
	width: 70%;
}
</style>
<div align="center" id="${staffDetail.STAFF_ID}">
	<h2>
		<i onclick="backToStaffManagementAdmin()" class="fa fa-chevron-left" aria-hidden="true" style="margin-right: 25px"></i>직원 상세 정보
	</h2>
	<table>
		<tr>
			<c:choose>
				<c:when test="${staffDetail.PROFILE_PHOTO != null}">
					<td rowspan="3" style="min-width: 100px;">${staffDetail.PROFILE_PHOTO}</td>
				</c:when>
				<c:otherwise>
					<td rowspan="3" style="min-width: 100px;">default profile </td>
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
		<table id="detailTable" style="float: center;">
			<tr>
				<td>파트</td>
				<td>${staffDetail.WORK_PART}</td>
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
