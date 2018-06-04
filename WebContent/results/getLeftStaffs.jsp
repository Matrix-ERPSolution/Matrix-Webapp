<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty leftStaffs}">
	<br>퇴직한 직원이 없습니다.<br><br>
</c:if>
<table>
<c:forEach var="leftStaff" items="${leftStaffs}">
	<tr id="${leftStaff.STAFF_ID}">
		<c:choose>
			<c:when test="${leftStaff.PROFILE_PHOTO != null}">
				<td onclick="getStaffDetail(this)">${leftStaff.PROFILE_PHOTO}</td>
			</c:when>
			<c:otherwise>
				<td onclick="getStaffDetail(this)">default profile</td>
			</c:otherwise>
		</c:choose>
		<td align="left" onclick="getStaffDetail(this)">${leftStaff.NAME}</td>
		<td>${leftStaff.GENDER}</td>
		<td>${leftStaff.BIRTH}</td><!-- 날짜 간단한 형식으로 수정해야 할 수도 -->
		<td>${leftStaff.LEAVE_DATE}</td>
	</tr>
</c:forEach>
</table>