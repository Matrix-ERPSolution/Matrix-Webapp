<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${param.staffId!=null}">
	<div class="setWorkPartHeader">소속 파트 수정</div>
	<p class="staffInfoToSetWorkPart" id="${param.staffId}" style="margin-bottom: 5px;"><span>${param.staffName}</span>님의<br>
	소속파트를 수정합니다.</p>
</c:if>
<c:forEach var="part" items="${workParts}">
	<c:choose>
		<c:when test="${part==param.oldWorkPart}">
			<button class="selected workParts" >${part}</button>
		</c:when>
		<c:otherwise>
			<button class="workParts" onclick="setWorkPart(this)">${part}</button>
		</c:otherwise>
	</c:choose>
</c:forEach>
