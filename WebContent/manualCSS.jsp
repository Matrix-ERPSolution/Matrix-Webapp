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
    <h2 class="inline">여름 시즌 </h2>
    <p class="inline"><a href="manualVersionControl.jsp"><img src="images/versionList.png" width="30" height="30"/></a></p>
</div> 		
<br>
	    <div class="inline"  style="text-align: right;">
	    <a id = "manualPlaceDivision"><button>공간별</button></a>
	    </div>
	    <div class="inline" style="text-align: right;">
	    <a id = "manualTaskDivision"><button>업무별</button></a>
		</div> 
	<div id="result2"><br><%@include file="manualCSSPlaceMode.jsp"%></div>

<script>
$(".inline").css({
	"display":"inline"
});
$("#manualPlaceDivision").click(
	function(){
		 $.ajax({
		        url : "manualCSSPlaceMode.jsp", 
		        success : function(result){
		           $("#result2").html(result);
		        }
		    });
	});
$("#manualTaskDivision").click(
		function(){
			 $.ajax({
			        url : "manualCSSTaskMode.jsp", 
			        success : function(result){
			           $("#result2").html(result);
			        }
			    });
		});
</script>
</body>
</html>
