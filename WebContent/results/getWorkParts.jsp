<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.workparts {
    background-color: #cccccc;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    display: inline-block;
}
.workparts:hover, .selected.workparts {
	background-color: #99ccff;
}
</style>
<c:if test="${param.staffId!=null}">
	<h4 class="staffInfoToSetWorkPart" id="${param.staffId}"><span>${param.staffName}</span>님의 소속파트를 수정합니다.</h4>
</c:if>
<c:forEach var="part" items="${workParts}">
	<c:choose>
		<c:when test="${part==param.oldWorkPart}">
			<button class="selected workparts" >${part}</button>
		</c:when>
		<c:otherwise>
			<button class="workparts" onclick="setWorkPart(this)">${part}</button>
		</c:otherwise>
	</c:choose>
</c:forEach>
