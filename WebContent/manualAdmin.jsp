<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="loginCheckAdmin.jsp" %>
<%@include file="headSetting.jsp"%>
<%@include file="tabMenuAdmin.jsp" %>
<style>
.accordion {
	background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, rgba(212, 229, 247, 0.4));
    color: #003366;
    cursor: pointer;
    padding: 8px 8px 8px 20px;
    width: 95%;
    text-align: left;
    font-weight: bold;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    margin: auto;
    border-radius: 5px 5px 5px 5px;
    letter-spacing: 5px;
}
.subAccordion {
    background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, rgba(212, 229, 247, 0.4));
    color: #003366;
    cursor: pointer;
    padding: 8px 8px 8px 15px;
    position: inherit;
    width: 95%;
    text-align: left;
    font-weight: bold;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    margin: auto;
    border-radius: 5px 5px 5px 5px;
    letter-spacing: 5px;
}
.active, .subActive {
    background: linear-gradient(#206591, #206591, #206591, #206591, rgba(32, 101, 145, 0.2));
    color: #FFFFFF;
}

.accordion:after, .subAccordion:after {
	font-family: FontAwesome;
    content: '\f0da';
    font-size: 20px;
    color: #003366;
    float: right;
    margin-top: -3px;
    margin-right: 10px;
    vertical-align: middle;
}

.active:after, .subActive:after {
    font-family: FontAwesome;
    content: '\f0d7';
    color: #FFFFFF;
}

.panel{
    width: 95%;
    background: linear-gradient(#FFFFFF, rgba(192, 222, 241, 0.3));
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin: auto;
    border-radius: 0 0 5px 5px;
}
.subPanel {
    width: 95%;
    background: linear-gradient(#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, rgba(192, 222, 241, 0.3));
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin: auto;
    border-radius: 0 0 5px 5px;
}

li {
	list-style: none;
	font-size: 14px;
	margin-left: -27px;
	margin-right: 13px;
}
.mode {
	background-color: #d9d9d9;
	border:none;
	border-radius:10px;
	color: #333333;
	padding: 6px;
	font-size: 10pt;
}
.mode.selected {
	background-color: #206591;
	color: white;
	font-weight: bold;
}
.manualHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
}
.manualHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 1px;
}
</style>
</head>
<body>

<div class="manualHeader">
    <h4>매뉴얼 조회</h4>
</div>
<br>
<div style="padding: 0 10px 10px 10px;">
<button id="spaceMode" class="mode selected">공간별</button>
<button id="taskMode" class="mode">업무별</button>
</div>
<div id="manual">
</div>
<script>
$("#manualTab").addClass("tapped");

var manualSpaceMode = function(){
	 $.ajax({
        url : "controller?cmd=getSpaceTypesAction", 
        success : function(result){
           $("#manual").html(result);
        }
    });
}
manualSpaceMode();

var manualTaskMode = function(){
	 $.ajax({
        url : "controller?cmd=getTaskTypesAction", 
        success : function(result){
        	$("#manual").html(result);
        }
    });
}

$("#spaceMode").click(function(){
	$("#taskMode").removeClass("selected");
	$("#spaceMode").addClass("selected");
	manualSpaceMode();
});

$("#taskMode").click(function(){
	$("#spaceMode").removeClass("selected");
	$("#taskMode").addClass("selected");
	manualTaskMode();
});

var activateAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      if(input.classList.contains("spaceType")){
    		$.ajax({
    	        url : "controller?cmd=getTaskTypesBySpaceTypeAction", 
    	        data: {
    				spaceType : input.id, 
    			},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        	panel.style.maxHeight = panel.scrollHeight + "px";
    	        }
    	    });
    	}

      if(input.classList.contains("taskType")){
    		$.ajax({
    	        url : "controller?cmd=getSpaceTypesByTaskTypeAction", 
    	        data: {
    				taskType : input.id, 
    			},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        	panel.style.maxHeight = panel.scrollHeight + "px";
    	        }
    	    });
    	}
      
    } 
}

var activateSubAcc = function(input){
    input.classList.toggle("subActive");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
    	var space = "";
    	var task = "";
    	if(input.classList.contains('taskType')){
    		task = input.id;
    		space = input.parentNode.previousElementSibling.id;
    	} else if(input.classList.contains('spaceType')){
    		space = input.id;
    		task = input.parentNode.previousElementSibling.id;
    	}
    	$.ajax({
	        url : "controller?cmd=getManualTasksAction", 
	        data: {
				spaceType : space, 
				taskType : task
			},
	        success : function(result){
	        	panel.innerHTML = result;
	        	panel.style.maxHeight = panel.scrollHeight + "px";
	        	var motherPanel = input.parentNode;
	            motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";
	        }
	    });
    } 
    
    
}

</script>

</body>
</html>
