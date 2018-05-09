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
<body>

	
<div class="w3-top">
  <div class="w3-row w3-large w3-light-grey" >
    <div class="w3-col s3">
      <a id="dailyTaskTab" class="w3-button w3-block">일일업무</a>
    </div>
    <div class="w3-col s3">
      <a id="manualTab" class="w3-button w3-block">매뉴얼</a>
    </div>
    <div class="w3-col s3">
      <a id="staffManagementTab" class="w3-button w3-block">직원관리</a>
    </div>
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
			        url : "manualCSS.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#staffManagementTab").click(
		function(){
			 $.ajax({
			        url : "staffManagement.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
</script>
</body>
</html>