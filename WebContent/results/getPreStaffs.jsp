<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>console.log("getPreStaffs.jsp")</script>
<table>
<c:forEach var="preStaff" items="${preStaffs}">
	<tr id="${preStaff.STAFF_ID}">
		<td>${preStaff.PROFILE_PHOTO}</td>	<!-- 현재는 파일경로 그대로 String으로 출력. 추후 업데이트 -->
		<td align="left" class="staffConfirmName">${preStaff.NAME}</td>
		<td style="min-width: 20pt" align="right">${preStaff.GENDER}</td>
		<td style="min-width: 20pt" align="right">${preStaff.BIRTH}</td>
		<td><input type="button" class="staffAcceptButton" value="승인"
			style="float: right"></td>
		<td><input type="button" class="staffRejectButton" value="거부"
			style="float: right"></td>
	</tr>
</c:forEach>
</table>