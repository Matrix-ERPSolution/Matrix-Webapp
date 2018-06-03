<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.workingStaff {
	border-bottom: 
}	/* 적용안됨 */
.workingStaffProfile {
	width: 30px;
}	/* 적용안됨 */
</style>
<table>
<c:forEach var="workingStaff" items="${workingStaffs}">
	<tr id="${workingStaff.STAFF_ID}">
		<c:choose>
			<c:when test="${workingStaff.PROFILE_PHOTO != null}">
				<td onclick="getStaffDetail(this)">${workingStaff.PROFILE_PHOTO}</td>
			</c:when>
			<c:otherwise>
				<td onclick="getStaffDetail(this)">default profile</td>
			</c:otherwise>
		</c:choose>
		<td class="workingStaffName" onclick="getStaffDetail(this)">${workingStaff.NAME}</td>
		<td>${workingStaff.GENDER}</td>
		<td>${workingStaff.BIRTH}</td>
		<c:choose>
			<c:when test="${workingStaff.WORK_PART != null}">
				<td><input type="button" onclick="getWorkPart(this)" value="${workingStaff.WORK_PART}" style="float: right"></td>
			</c:when>
			<c:otherwise>
				<td><input type="button" onclick="getWorkPart(this)" value="미배정" style="float: right"></td>
			</c:otherwise>
		</c:choose>
		<td><input type="button" onclick="setLeaveDate(this)" value="퇴사" style="float: right"></td>
	</tr>
</c:forEach>
</table>
