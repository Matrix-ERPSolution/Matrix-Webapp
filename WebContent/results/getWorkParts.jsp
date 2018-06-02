<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<c:forEach var="part" items="${result}">
	   <li class="units"><button class="units">${part.WORK_PART}</button></li>
</c:forEach>
