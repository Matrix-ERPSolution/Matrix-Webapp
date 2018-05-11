<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>

</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>	

.tabs {
  padding: 0px;
  width: 360px;
};

</style>
<header>
	<%@include file="slideMenu.jsp" %>
</header>
<body>
<!-- 위치조정 필요 -->

	<div class="tabs w3-bar" style="background-color: #e6f2ff; position:relative;">
	    <div class="w3-col s4">
	      <a id="dailyTaskTab" class="w3-button w3-block" style="background-color: #e6f2ff;">일일업무</a>
	    </div>
	    <div class="w3-col s4">
	      <a id="manualTab" class="w3-button w3-block" style="background-color: #e6f2ff;">매뉴얼</a>
	    </div>
	    <div class="w3-col s4">
	      <a id="staffManagementTab" class="w3-button w3-block" style="background-color: #e6f2ff;">직원관리</a>
	    </div>
	</div> 

<div id="result"><%@include file="dailyTaskAdmin.jsp"%></div>

<script>
$(".inline").css({
	"display":"inline"
});
$("#dailyTaskTab").click(
		function(){
			 $.ajax({
			        url : "dailyTaskAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#manualTab").click(
		function(){
			 $.ajax({
			        url : "manualAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#staffManagementTab").click(
		function(){
			 $.ajax({
			        url : "staffManagementAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});

</script>
</body>
</html>