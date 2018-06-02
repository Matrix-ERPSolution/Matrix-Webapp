<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<c:forEach var="leftStaff" items="${leftStaffs}">
<script>
var birth = ${leftStaff.BIRTH};
var simpleBirth = birth.substring(2, 9);
alert('birth: '+birth);
alert('simpleBirth: '+simpleBirth);
</script> <!-- 적용안됨 -->
	<tr id="${leftStaff.STAFF_ID}">
		<td onclick="getStaffDetail(this)">${leftStaff.PROFILE_PHOTO}</td>
		<td align="left" onclick="getStaffDetail(this)">${leftStaff.NAME}</td>
		<td>${leftStaff.GENDER}</td>
		<td>${leftStaff.BIRTH}</td><!-- 날짜 간단한 형식으로 수정해야 할 수도 -->
		<td>${leftStaff.LEAVE_DATE}</td>
	</tr>
</c:forEach>
</table>