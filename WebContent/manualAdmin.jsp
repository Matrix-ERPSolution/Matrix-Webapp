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
	<div class="accordion" id="accordion1">accordion1</div>
	<div class="panel">
		<div class="subAccordion">
			<div>subAccordion1</div>
		</div>
		<div class="subPanel">
			<ul>
				<li>taskContent1 <span class="interval" style="float: right;">taskPeriod1</span></li>
				<li>taskContent2 <span class="interval" style="float: right;">taskPeriod2</span></li>
				<li>taskContent3 <span class="interval" style="float: right;">taskPeriod3</span></li>
				<li>taskContent4 <span class="interval" style="float: right;">taskPeriod4</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>subAccordion2</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>taskContent1 <span class="interval" style="float: right;">taskPeriod1</span></li>
				<li>taskContent2 <span class="interval" style="float: right;">taskPeriod2</span></li>
			</ul>
		</div>
	</div>
	
	<div class="accordion" id="accordion2">accordion2</div>
	<div class="panel">
		<div class="subAccordion">
			<div>subAccordion1</div>
		</div>
		<div class="subPanel">
			<ul>
				<li>taskContent1 <span class="interval" style="float: right;">taskPeriod1</span></li>
				<li>taskContent2 <span class="interval" style="float: right;">taskPeriod2</span></li>
				<li>taskContent3 <span class="interval" style="float: right;">taskPeriod3</span></li>
				<li>taskContent4 <span class="interval" style="float: right;">taskPeriod4</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>subAccordion2</div>
		</div>
		<div class="subPanel">
			<ul>
				<li>taskContent1 <span class="interval" style="float: right;">taskPeriod1</span></li>
				<li>taskContent2 <span class="interval" style="float: right;">taskPeriod2</span></li>	
				<li>taskContent3 <span class="interval" style="float: right;">taskPeriod3</span></li>				
			</ul>
		</div>
	</div>
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


/* 
var acc = document.querySelectorAll(".accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}

var subAcc = document.querySelectorAll(".subAccordion");

for (i = 0; i < subAcc.length; i++) {
	subAcc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
    
    var motherPanel = this.parentNode;
    motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";

  });
}



$(".spaceType").click(function(){
	console.log("spacetype")
	$.ajax({
        url : "controller?cmd=getTaskTypesBySpaceTypeAction", 
        data: {
			spaceType : $(this).html(), 
		},
        success : function(result){
           $(this).children(".panel").html(result);
        }
    });
});


$(".taskType").click(function(){
	console.log("tasktype")
	$.ajax({
        url : "controller?cmd=getSpaceTypesByTaskTypeAction", 
        data: {
			taskType : $(this).html(), 
		},
        success : function(result){
        	$(this).children(".panel").html(result);
        }
    });
}); */
</script>
</body>
</html>
