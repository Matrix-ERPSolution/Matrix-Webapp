<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="part" items="${parts}">
 	<div class="accordion assignedPart" id="${part}" onclick="activateAcc(this)">${part} 파트</div>
 	<div class="panel"></div>
</c:forEach>
 	<div class="accordion assignedPart" id="개인" onclick="activateAcc(this)">개인 업무</div>
 	<div class="panel"></div>
