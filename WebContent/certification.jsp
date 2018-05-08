<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원가입</title>
</head>
<body>
<div>
	<img class="inline" src="images/back.png" width="30pt" align="left"/>
</div>
<h3>Store Manager</h3>
<h1>회원가입을 환영합니다!</h1>

<i class="fa fa-user" aria-hidden="true"></i><!-- 직원용 그림-->
<button href="" class="ui-button ui-widget ui-corner-all">직원 인증</button>

<i class="fa fa-user-circle-o" aria-hidden="true"></i><!-- 관리자용 그림 -->
<button href="" class="ui-button ui-widget ui-corner-all">관리자 인증</button>

<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").css({
			"display" : "inline"
		})
	});
</script>
</body>
</html>