<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty preStaffs}">
	<br>승인 요청한 직원이 없습니다.<br><br>
</c:if>
<table class="resultStaffTable">
<c:forEach var="preStaff" items="${preStaffs}">
	<tr id="${preStaff.STAFF_ID}">
		<c:choose>
			<c:when test="${preStaff.PROFILE_PHOTO != null}">
				<td onclick="getStaffDetail(this)"><img class="profilePhoto" src="images/profile/${preStaff.PROFILE_PHOTO}"></td>
			</c:when>
			<c:otherwise>
				<td onclick="getStaffDetail(this)"><img class="profilePhoto" src="images/profile/defaultProfile.png"></td>
			</c:otherwise>
		</c:choose>
		<td class="preStaffName" onclick="getStaffDetail(this)">${preStaff.NAME}</td>
		<td>${preStaff.GENDER}</td>
		<td>${preStaff.BIRTH}</td>
		<td><input type="button" value="승인" onclick="acceptStaff(this)"
			style="float: right"></td>
		<td><input type="button"  value="거부" onclick="rejectStaff(this)"
			style="float: right"></td>
	</tr>
</c:forEach>
</table>
