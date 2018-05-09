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
	<p>
		<h2>여름 시즌</h2><a href="manualVersionControl.jsp">
		<img src="images/versionList.png" width="30" height="30"/></a>
	</p>
	
    <input type = "button" 
          value = "공간별" 
           id = "manualPlaceDivision" >
    <input type = "button" 
          value = "업무별" 
           id = "manualTaskDivision" >  
           
	<div id="result"><%@include file="manualCSSTaskMode.jsp"%></div>
	
<script>
$("#manualPlaceDivision").click(
	function(){
		 $.ajax({
		        url : "manualCSSPlaceMode.jsp", 
		        success : function(result){
		           $("#result").html(result);
		        }
		    });
	});
$("#manualTaskDivision").click(
		function(){
			 $.ajax({
			        url : "manualCSSTaskMode.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
</script>
</body>
</html>
