<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
<c:forEach var="task" items="${tasks}">
	<li class="important changeable">보건증 갱신<div id="test1" class="finisher changeable">김태훈</div></li>
	<li class="important">통장사본 제출 <div class="finisher">홍윤영</div></li>
	<li>연진이 생일 케이크 사오기 (2호) <div class="finisher">김수한무</div></li>
		
	<li onclick="activateli(this)">${task.MANUAL_TASK} <span class="interval" style="float: right;">
	
	<c:if test="${task.REPEAT_TYPE == '파트'}">매일 ${task.REPEAT_DETAIL}조</c:if>
	<c:if test="${task.REPEAT_TYPE == '기간'}">${task.REPEAT_DETAIL}일 마다</c:if>
	</span></li>
</c:forEach>
</ul>