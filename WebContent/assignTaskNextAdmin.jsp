<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file = "loginCheckAdmin.jsp" %>
<%@include file = "tabMenuAdmin.jsp" %>
<style>
.accordion, .subAccordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: none;
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
 ul {
  list-style-type: none;
  display: table;
  table-layout: fixed;
}
 li {
  display: table-cell;
}
#assignedTaskBox{
	border: 2px solid black;
}
.staffs{
	border: 2px solid black;
    padding: 0 18px;
    float: center;
}
.selectedAssignDetail{
	font-size: 12pt;
	color: blue;
}
.panel.assignableStaffs {
	margin-top : 10px;
	overflow: auto;
    white-space: nowrap;
}
.staffBox {
	display: inline-block;
}
.staffName {
	display: block;
	font-size: 10pt;
}
.workparts {
	margin-bottom : 10px;
    background-color: #cccccc;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    display: inline-block;
}
.workparts:hover, .staffBox:hover, .selected {
	background-color: #99ccff;
}
#selectedTask::before {
	content: "\2605";
	color: lightgray;
	width: 1em;
}
.important#selectedTask::before {
	content: "\2605";
	color: orange;
	width: 1em;
}
</style>
</head>
<body>
<h2>${param.dateKor}</h2>
<h2>업무 배정</h2>
<hr> <br>

<div id="assignedTaskBox">
	<h4 id="selectedTask">${param.selectedTask}
	<i class="fa fa-chevron-right" aria-hidden="true" style="margin-left:25px"></i>
	</h4>
</div>

<hr><br>
<div id="assignTask">
	<h4>담당자 지정하기</h4>
	<div class="accordion" id="assignableParts">파트별</div>
	<div class="panel">
	</div>
	
	<div class="accordion" id="assignableStaffs">개인별</div>
	<div class="panel assignableStaffs">
	</div>
</div>

<hr> <br>
<h5>해당 업무를 <span class="selectedAssignDetail">&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="selectedAssignType"></span> 배정합니다.</h5>

<hr> <br>
<div style="text-align: center;">
<!-- <input type="button" class="assignButton" value="배정하기">
<input type="button" class="assignCancelButton" value="취소"> -->
<button id="assignButton">배정하기</button>
<button id="assignCancelButton">취소</button>
</div>
<script>
$(document).ready(function() {
	if("${param.importance}"==1){
		$("#selectedTask").addClass("important");
	}
});

$("#assignableParts").on("click", function() {
	this.classList.toggle("active");
	var panel = this.nextElementSibling;
	if (panel.style.maxHeight) {
		panel.style.maxHeight = null;
	} else {
		$.ajax({
			url : "controller?cmd=getWorkPartsAction",
			success : function(result) {
				panel.innerHTML = result;
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
});
var setWorkPart = function(input){
	$(".selected").removeClass("selected");
	$(input).addClass("selected");
	$(".selectedAssignDetail").html($(input).html());
	$(".selectedAssignDetail").attr("id", $(input).html());
	$("#selectedAssignType").html(" 파트에");
}

var setWorkStaff = function(input){
	$(".selected").removeClass("selected");
	$(".selectedAssignDetail").html($(input).clone());
	$(".selectedAssignDetail").attr("id", $(input).children("img").prop("title"));
	$(input).children(".staffName").addClass("selected");
	$("#selectedAssignType").html(" 님에게");
}

$("#assignableStaffs").on("click", function() {
	this.classList.toggle("active");
	var panel = this.nextElementSibling;
	if (panel.style.maxHeight) {
		panel.style.maxHeight = null;
	} else {
		$.ajax({
			url : "controller?cmd=getAssignableStaffsAction",
			success : function(result) {
				panel.innerHTML = result;
				panel.style.maxHeight = panel.scrollHeight + 25 +"px";
			}
		});
	}
});

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
var li = document.querySelectorAll("li");
var i;

for (i = 0; i < li.length; i++) {
	li[i].addEventListener("click", function() {
		 this.classList.toggle("selected");
		 if(this.classList.contains("selected")){
			var addLi = document.createElement("li");
	   		var nodes = this.childNodes;
	   		for(var j = 0; j < nodes.length; j++){
	   			addLi.appendChild(nodes[j].cloneNode(true));
	   		}
			document.querySelector("#selectedTasksList").appendChild(addLi);
		 } else {
			 var list = document.querySelector("#selectedTasksList");
			 var li = list.firstChild;
			 for(var j = 0; j < list.childNodes.length-1; j++){
				 li = li.nextElementSibling;
				 if(li.innerHTML == this.innerHTML) {
					 list.removeChild(li);
					 break;
				 }
			 }
		 }
	})
};

$('#assignButton').on('click',function (){
	var selectedAssignType = "개인";
	if($("#selectedAssignType").html()==" 파트에"){
		selectedAssignType = "파트";
	}
	 $.ajax({
	        url : "controller?cmd=addDailyTaskAction", 
	        data : {  
	        	dailyTask : "${param.selectedTask}", 
	        	assignDate : "${param.date}",
	        	importance : "${param.importance}", 
	        	assignType : selectedAssignType, 
	        	assignDetail : $(".selectedAssignDetail").attr("id")
	        },
	        success : function(result) {
	        	alert("${param.selectedTask}를 " +$(".selectedAssignDetail").attr("id") + "에게 배정했습니다.");
				location.href = "controller?cmd=dailyTaskAdminUI";
	        }
	 });
});

$('#assignCancelButton').on('click',function (){
	        	alert("홈화면으로 돌아갑니다.");
				location.href = "controller?cmd=dailyTaskAdminUI";
});
</script>
</body>
</html>
