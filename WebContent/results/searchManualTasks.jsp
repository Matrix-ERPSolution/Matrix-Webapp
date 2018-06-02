<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<c:forEach var="task" items="${result}">
	   <a href="#" class="w3-bar-item w3-button">${task.MANUAL_TASK}</a>
</c:forEach>
