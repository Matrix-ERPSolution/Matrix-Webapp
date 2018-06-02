<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>console.log("getWorkingStaffs.jsp")</script>
<style>
. workingStaff {
	border-bottom: 
}	/* 적용안됨 */
.workingStaffProfile {
	width: 30px;
}	/* 적용안됨 */
</style>
<table>
<c:forEach var="workingStaff" items="${workingStaffs}">
	<tr id="${workingStaff.STAFF_ID}">
		<td class="workingStaff" onclick="getStaffDetail(this)">${workingStaff.PROFILE_PHOTO}</td>
		<td class="workingStaff" onclick="getStaffDetail(this)">${workingStaff.NAME}</td>
		<td>${workingStaff.GENDER}</td>
		<td class="workingStaff">${workingStaff.BIRTH}</td>
		<td class="workingStaff"><input type="button" class="setWorkPart" value="${workingStaff.WORK_PART}"
			style="float: right"></td>
		<td class="workingStaff"><input type="button" class="retire" value="퇴사"
			style="float: right"></td>
	</tr>
</c:forEach>
</table>
<script>

$(".setWorkPart").click(function(){
	alert("파트 수정");
});	//적용안됨
$(".retire").click(function(){
	confirm('"${workingStaff.NAME}" 님을 퇴사 처리하시겠습니까?');
});	//적용안됨
</script>