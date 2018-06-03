<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="staff" items="${workingStaffs}">
	<a class="staffBox" onclick="setWorkStaff(this)">
	<%-- <c:if test="${staff.PROFILE_PHOTO != null}">
		<img src="${staff.PROFILE_PHOTO}" title="${staff.STAFF_ID}" style="width:30pt">
	</c:if>
	<c:if test="${staff.PROFILE_PHOTO == null}">
		<img src="images/defaultProfile.png" title="${staff.STAFF_ID}" style="width:30pt">
	</c:if> --%>
	<img src="images/defaultProfile.png" title="${staff.STAFF_ID}" style="width:30pt">
    <span class="staffName">${staff.NAME}</span>
	</a>
</c:forEach>
