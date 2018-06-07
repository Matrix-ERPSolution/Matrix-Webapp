<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file = "../loginCheckAdmin.jsp" %>
<%@include file = "../tabMenuAdmin.jsp" %>
<style>
#content {
	width: 100%;
}
.accordion {
	background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, rgba(212, 229, 247,
		0.2));
	color: #003366;
	cursor: pointer;
	padding: 7px 7px 7px 20px;
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
	background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, #eaf3fa);
	color: #003366;
	cursor: pointer;
	padding: 5px 5px 5px 15px;
	position: inherit;
	width: 95%;
	text-align: left;
	font-weight: bold;
	outline: none;
	font-size: 13px;
	transition: 0.4s;
	margin: auto;
	border-radius: 5px 5px 5px 5px;
	letter-spacing: 5px;
}

.active, .subActive {
	background: linear-gradient(#206591, #206591, #206591, #206591, rgba(32, 101, 145,
		0.2));
	color: #FFFFFF;
}
.accordion:after, .subAccordion:after {
	font-family: FontAwesome;
	content: '\f0da';
	font-size: 17px;
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

.panel {
	width: 90%;
	background: linear-gradient(#FFFFFF, rgba(192, 222, 241, 0.3));
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	margin: auto;
	border-radius: 0 0 5px 5px;
}

.subPanel {
	width: 95%;
	background: linear-gradient(#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, rgba(192, 222, 241,
		0.3));
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	margin: auto;
	border-radius: 0 0 5px 5px;
}

ul {
	margin-left: -20pt;
	list-style: none;
}

li {
	list-style: none;
	font-size: 15px;
	margin-left: -10px;
	margin-right: 5px;
	margin-bottom: 3px;
}

#manual {
	display: none;
}
.ui-autocomplete-category {
   font-weight: bold;
   padding: .2em .4em;
   margin: .8em 0 .2em;
   line-height: 1.5;
}

.setDailyTaskHeader, #modalHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
	text-align: center;
}
.setDailyTaskHeader h4, #modalHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 2px;
}
.subMenu {
	padding: 10px;
	margin-left: 10px;
}
.subMenu span {
	font-weight: bold;
	font-size: 15px;
}
.subMenu::after {
	content: '\2795';
	color: #003366;
	font-size: 10px;
	padding-left: 6px;
	vertical-align: middle;
}
.subMenu.selected::after {
	content: '\2796';
}

#addTaskFromTyping {
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	text-align: center;
}
.addButton{
	background-color: #e6f2ff;
	border: none;
	border-radius: 10%;
	color: black;
	padding: 3px;
	width: 50px;
}
.confirmButton{
	background-color: white;
	border: rgb(50, 132, 226) 1px solid;
	border-radius: 10px;
	color: black;
	padding: 5px;
	width: 80px;
	float: right;
}

.searchedTasks {
	font-size: 13px;
	width: 100%;
	display: block;
	padding: 1px;
	text-align: left;
	border: none;
	white-space: normal;
	float: none;
	outline: 0
}
.cancelButton {
	width: 200px;
	padding: 5px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
}
.endMenu {
	margin-left:30%;
	margin-right:30%;
	width: 40%;
	padding: 5px;
	text-align: center;
}
.noButton{
	background-color: white;
	border: rgb(255, 128, 128) 1px solid;
	border-radius: 10px;
	color: black;
	padding: 5px;
}
#selectedTaskModal {
	z-index: 3;
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}
#selectedTaskPopup {
	z-index: 5;
	position: absolute;
	outline: 0;
	background-color: white;
	height: 40%;
	width: 300px;
	display: none;
	border-radius: 10px;
	margin-left: 30px;
	margin-top: 70px;
}
#selectedTask {
	margin-left: 35px;
	font-size: 17px;
}
#selectedTask::before, #oldTask::before {
	content: "\2605";
	color: lightgray;
	font-size: 30px;
	padding-right: 15px;
}
.important#selectedTask::before, .important#oldTask::before{
	content: "\2605";
	color: #3284e2;
}
#oldTaskBox {
	box-shadow: 5px 5px 5px lightgray;
	border-radius: 10px;
	width: 90%;
	margin-left: 5%;
}
#oldTask {
	margin-left: 30px;
	font-size: 17px;
	font-weight: bold;
	margin-top: -15px;
}
#oldTask::before {
	content: "\2605";
	color: lightgray;
	font-size: 30px;
	padding-right: 20px;
}
.important#oldTask::before {
	content: "\2605";
	color: #3284e2;
}
</style>
</head>
<body>
<div id="content" style="z-index: 0; position: absolute;">
<div class="setDailyTaskHeader">
	<h4>업무 수정</h4>
</div>
<div id="oldTaskBox">
	<span id="oldTask">${param.oldDailyTask}</span>
	<span class="assignDetail unfinished " id="${param.assignDetail}" style="float: right; margin-right: 25px; margin-top: 15px; font-size: 15px; font-weight: bold; vertical-align: middle; color: gray; display: inline;">${param.assignName}</span>
</div>
<div id="taskFromRecommend">
	<div id="recommendToggle" class="subMenu"><span>오늘의 추천업무</span></div>
	<div id="recommendList">
	</div>
</div>

<div id="taskFromManual">
	<div id="manualList" class="subMenu"><span>매뉴얼에서 선택하기</span></div>
	<div id="manual">
	</div>
</div>
<div id="taskFromTyping">
	<div id="inputToggle" class="subMenu selected"><span>직접 입력하기/매뉴얼에서 검색하기</span></div>
	<div>
		<input id="addTaskFromTypingInput" type="text" placeholder="업무명을 입력해주세요" style="margin-left: 10px; width: 78%;">
		<button id="addTask" class="addButton" style="display: inline;">추가</button>
		<div id="addTaskFromTyping" class="w3-dropdown-hover" style="display: inline;">
		<div id="searchFromManual" class="w3-dropdown-content w3-bar-block w3-border" style="margin-left: 10px;">
  		</div>
	</div>
	</div>
</div>
</div>

<!-- 선택된 업무 출력 -->
<div id="selectedTaskModal">
</div>
<div id="selectedTaskPopup">
    <span id="closeModal" class="w3-button" style="pad; float: right; margin-top:5px; margin-right: 15px; padding:3px 3px; font-size: 30px;">&times;</span>
    <div id="modalHeader"><h4>선택된 업무</h4></div>
    <br>
	<div style="color: gray; font-size: 10px; margin-left: 20px; display: block;">중요여부 click!</div>
	<div id="selectedTask"></div>
	<br>
	<div class="endMenu">
		<button id="update" class="confirmButton" style="float: left">수정완료</button>
	</div>
</div>
<br>
<br>
<script>
$("#cancel").click(function(){
	location.href="controller?cmd=dailyTaskAdminUI"
});

$("#recommendToggle").click(function(){
	$("#recommendToggle").toggleClass("selected");
	if($(this).hasClass("selected")){
		$("#recommendList").show();
	} else {
		$("#recommendList").hide();
	}
});
//매뉴얼목록 토글
$("#manualList").click(function() {
	$("#manualList").toggleClass("selected");
	if($(this).hasClass("selected")){
		manualSpaceMode();
		$("#manual").show();
	} else {
		$("#manual").hide();
	}
});
$("#inputToggle").click(function(){
	$("#inputToggle").toggleClass("selected");
	if($(this).hasClass("selected")){
		$(this).next().show();
	} else {
		$(this).next().hide();
	}
});

var activateli = function(input) {
	//업무 리스트 중 1개를 클릭 -> 업무 배정에 추가
	$("#selectedTask").html(input.childNodes[0].nodeValue);
	$("#selectedTaskModal").css({
		display : "block"
	});
	$("#selectedTaskPopup").css({
		display : "block"
	});
}
	//매뉴얼 db연결
	var manualSpaceMode = function() {
		$.ajax({
			url : "controller?cmd=getSpaceTypesAction",
			success : function(result) {
				$("#manual").html(result);
			}
		});
	}
	//추천업무 가져오기 
	var getRecommendedTasks = function(){
		$.ajax({
			url : "controller?cmd=getRecommendedTasksAction",
			data : {
				date : "${param.date}"
			},
			success : function(result) {
				$("#recommendList").html(result);
			}
		});
	}
	getRecommendedTasks();

	var activateAcc = function(input) {
		input.classList.toggle("active");
		var panel = input.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		} else {
			$.ajax({
				url : "controller?cmd=getTaskTypesBySpaceTypeAction",
				data : {
					spaceType : input.id,
				},
				success : function(result) {
					panel.innerHTML = result;
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
	};

	var activateSubAcc = function(input) {
		input.classList.toggle("active");
		var panel = input.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		} else {
			$.ajax({
				url : "controller?cmd=getManualTasksAction",
				data : {
					spaceType : input.parentNode.previousElementSibling.id,
					taskType : input.id
				},
				success : function(result) {
					panel.innerHTML = result;
					panel.style.maxHeight = panel.scrollHeight + "px";
					var motherPanel = input.parentNode;
					motherPanel.style.maxHeight = motherPanel.scrollHeight
							+ panel.scrollHeight + "px";
				}
			});
		}
	}
	
	var activateAccBasic = function(input) {
		input.classList.toggle("active");
		var panel = input.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		} else {
			panel.style.maxHeight = panel.scrollHeight + "px";
		}
	};

	//직접 입력하여 업무 추가
	$("#addTask").click(function() {
		if ($("#addTaskFromTypingInput").val() != "") {
			$("#selectedTask").html($("#addTaskFromTypingInput").val());
			$("#selectedTaskModal").css({
				display : "block"
			});
			$("#selectedTaskPopup").css({
				display : "block"
			});
		}
	});
	
	$(".w3-bar-item.w3-button").click(function() {
		$("#selectedTask").html($(this).html());
		$("#selectedTaskModal").css({
			display : "block"
		});
		$("#selectedTaskPopup").css({
			display : "block"
		});
	});
	//선택or입력된 업무를 리스트에서 지우기

	$("#closeModal").on("click", function() {
		$("#selectedTaskModal").css({
			display : "none"
		});
		$("#selectedTaskPopup").css({
			display : "none"
		});
		$("#selectedTask").removeClass("important");
	});

	$("#selectedTask").on("click", function() {
		this.classList.toggle("important");
	});

	//자동완성
	$("#searchFromManual").width($("#addTaskFromTypingInput").width());
	$("#addTaskFromTypingInput").on("keyup", function() {
		if ($(this).val() == "") {
			$("#searchFromManual").html("");
			return;
		}
		$("#searchFromManual").css({
			display : "block"
		});
		$.ajax({
			url : "controller?cmd=searchManualTasksAction",
			data : {
				inputText : $("#addTaskFromTypingInput").val()
			},
			success : function(result) {
				$("#searchFromManual").html(result);
			}
		})
	});
	var goInputText = function(input) {
		$("#addTaskFromTypingInput").val($(input).html());
		$("#searchFromManual").html("");
	}
	
	$("#update").on("click", function(){
		if($("#selectedTask").html().trim()=="새로운 업무를 선택하세요") {
			alert("업무를 선택해주세요");
		} else if($("#selectedTask").html().trim()=="${param.oldDailyTask}"){
			alert("수정 전과 같은 업무입니다.")
			$("#closeModal").click();
		} else {
		$.ajax({
	        url : "controller?cmd=isDailyTaskAction", 
	        data : {  
	        	dailyTask : $("#selectedTask").html().trim(), 
	        	assignDate : "${param.date}",
	        },
	        success : function(result) {
	        	result = JSON.parse(result);
				if(result["result"] == "true") {
					alert('해당 날짜에 이미 배정된 업무입니다.');
					$("#closeModal").click();
				} else {
					var imp = 0;
					if ($("#selectedTask").hasClass("important")) {
						imp = 1;
					}
					$.ajax({
						url : "controller?cmd=setDailyTaskAction",
						data : {
							oldDailyTask : "${param.oldDailyTask}",
							newDailyTask : $("#selectedTask").html().trim(),
							assignDate : "${param.assignDate}",
							assignDetail : "${param.assignDetail}",
							newImportance : imp
						},
						success : function(result) {
							alert("${param.oldDailyTask} 업무를 " + $("#selectedTask").html().trim() + "업무로 변경하였습니다.")
							location.href="../controller?cmd=dailyTaskAdminUI&date=${param.assignDate}";
						}
					})
				}
	        }
		});
		}
	});
</script>
