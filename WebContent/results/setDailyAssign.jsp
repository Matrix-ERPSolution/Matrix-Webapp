<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>업무 재배정</h2>
<div>
<ul>
	<c:if test="${param.importance == true}">
		<li class="part important">
	</c:if>
	<c:if test="${param.importance == false}">
		<li class="part">
	</c:if>
	${param.dailyTask}
	<span class="assignDetail unfinished " id="${param.oldAssignDetail}" style="float: right; display: none;">${param.oldAssignName}</span>
	</li>
</ul>
</div>
