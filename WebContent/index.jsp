<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
body {
	background-color: #004566;
	margin: auto;
	min-height: 640;
}
</style>
</head>
</head>
<body>
<div style="padding-top:200px; color:white; text-align:center; font-weight: bold;"><img alt="logo" src="images/logo_white.png" width="250px"></div>
<script type="text/javascript">
$(document).ready(function(){
	$("body").fadeOut(2000, toLogin);
});

var toLogin = function(){
	location.href="controller?cmd=loginUI";
}
</script>
</body>
</html>