<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="headSetting.jsp"%>
<title>Manual</title>
<style>

.accordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: 2px solid #d4e5f7;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
.subAccordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: 2px solid #e6f2ff;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
.active, .accordion:hover, .subAccordion:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel, .subPanel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

li:hover, .selected {
	background-color: #99ccff;
}

li {
	list-style: none;
	font-size: 12pt;
	margin-left: -40pt;
}
</style>
</head>
<body>

<div class="w3-center">
    <h2>매뉴얼 </h2>
</div> 		
<br>
<button id="spaceMode">공간별</button>
<button id="taskMode">업무별</button>
<br><br>
<div id="manual">
</div>
<script>
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
	manualSpaceMode();
});

$("#taskMode").click(function(){
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
    input.classList.toggle("active");
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
	        url : "controller?cmd=getTasksAction", 
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
