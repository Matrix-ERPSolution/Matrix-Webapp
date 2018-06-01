<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>console.log("getWorkingStaffs.jsp")</script>
<style>
. workingStaff {
	border-bottom: 1px solid #ddd
}
.workingStaffProfile {
	width: 30px;
}
</style>
<table>
<c:forEach var="workingStaff" items="${workingStaffs}">
	<tr id="${workingStaff.STAFF_ID}">
		<td class="working staffs workingStaffProfile">${workingStaff.PROFILE_PHOTO}</td>
		<td class="workingStaff">${workingStaff.NAME}</td>
		<td class="workingStaff">${workingStaff.GENDER}</td>
		<td class="workingStaff">${workingStaff.BIRTH}</td>
		<td class="workingStaff"><input type="button" class="workPart" value="${workingStaff.WORK_PART}"
			style="float: right"></td>
		<td class="workingStaff"><input type="button" class="leave" value="퇴사"
			style="float: right"></td>
	</tr>
</c:forEach>
</table>