<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2>업무 수정</h2>
<div>
<ul>
	<c:if test="${param.importance == true}">
		<li class="part important">
	</c:if>
	<c:if test="${param.importance == false}">
		<li class="part">
	</c:if>
	${param.oldDailyTask}
	<span class="assignDetail unfinished " id="${param.assignDetail}" style="float: right; display: none;">${param.assignName}</span>
	</li>
</ul>
</div>

<div>
업무배정 페이지 중 <br>
오늘의추천업무,  <br>
매뉴얼에서 선택하기, <br>
직접 입력하기  <br>
복붙해서 들어갈 부분 <br>

중요도 토글기능
</div>

