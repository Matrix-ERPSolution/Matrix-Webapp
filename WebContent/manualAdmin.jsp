<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="headSetting.jsp"%>
<title>Manual</title>
<style>
</style>
</head>
<body>

<div class="w3-center">
    <h2 class="inline">매뉴얼 </h2>
    <!-- <p class="inline"><a href="manualVersionControl.jsp"><img src="images/versionList.png" width="30" height="30"/></a></p> -->
</div> 		
<br>
	    <div class="inline">
	    <a id = "manualPlaceDivision"><button>공간별</button></a>
	    </div>
	    <div class="inline">
	    <a id = "manualTaskDivision"><button>업무별</button></a>
		</div> 
	<div id="result2"><%@include file="manualPlaceTaskModeAdmin.jsp"%></div>

<script>
$(".inline").css({
	"display":"inline"
});
$("#manualPlaceDivision", "#manualTaskDivision").click(
	function(){
		 $.ajax({
		        url : "manualCSSPlaceTaskModeAdmin.jsp", 
		        success : function(result){
		           $("#result2").html(result);
		        }
		    });
	});
</script>
</body>
</html>
