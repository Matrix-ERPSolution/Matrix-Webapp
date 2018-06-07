<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file = "../loginCheckAdmin.jsp" %>
<%@include file = "../tabMenuAdmin.jsp" %>
<style>
.accordion{
	background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, rgba(212, 229, 247, 0.2));
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
    background: linear-gradient(#d4e5f7, #d4e5f7, #d4e5f7, #d4e5f7, #eaf3fa);
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
    background: linear-gradient(#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, rgba(192, 222, 241, 0.3));
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
	font-size: 14px;
	margin-left: -10px;
	margin-right: 5px;
	border-bottom: 
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
#selectedTask::before, #oldTask::before {
	content: "\2605";
	color: #999999;
	width: 2em;
}
.important#selectedTask::before, .important#oldTask::before{
	content: "\2605";
	color: #3284e2;
	width: 2em;
}
.setDailyTaskHeader {
	margin: auto;
	text-align: center;
	width: 50%;
	border-bottom: #d4e5f7 solid;
	text-align: center;
}
.setDailyTaskHeader h4{
	margin-bottom: 5px;
	color: rgb(0, 51, 102);
	font-weight: bolder;
	letter-spacing: 2px;
}
.subMenu{
	padding: 10px;
	margin-left:10px; 
}
.subMenu span{
	font-size: 12pt;
	font-weight: bolder;
	letter-spacing: 2px;
}
#addTaskFromTyping {	
	margin-left: 5%;
	margin-right: 5%;
	width: 90%;
	text-align: center;
}
.yesButton{
	background-color: white;
	border: rgb(50, 132, 226) 1px solid;
	border-radius: 10px;
	color: black;
	padding: 5px;
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
#oldTask {
	width:80%;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 10px;
}
#selectedTaskResult {
	width: 80%;
	margin-left:10%;
	margin-right:10%;
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: center;
	vertical-align: middle;
	height: 50px;
}
#selectedTask {
	vertical-align: bottom;
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
</style>
</head>
<body>
<div class="setDailyTaskHeader">
	<h4>업무 수정</h4>
</div>
<div id="oldTask">
${param.oldDailyTask}
<span class="assignDetail unfinished " id="${param.assignDetail}" style="float: right; display: inline-block;">${param.assignName}</span>
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
	<div class="subMenu"><span>직접 입력하기/매뉴얼에서 검색하기</span></div>
	<div id="addTaskFromTyping" class="w3-dropdown-hover">
		<input id="addTaskFromTypingInput" type="text" placeholder="업무명을 입력해주세요">
		<div id="searchFromManual" class="w3-dropdown-content w3-bar-block w3-border">
  		</div>
		<button id="addTask" class="yesButton">추가</button>
	</div>
	
</div>

<!-- 선택된 업무 출력 -->
<div id="selectedTaskResult">
	<span id="selectedTask" style="font-size: 11pt;">새로운 업무를 선택하세요</span>
	<span id="closeModal" class="w3-button" style="pad; top:0; padding:4px 8px;">&times;</span>
</div>
<div class="endMenu">
	<button id="update" class="confirmButton" style="float: left">수정완료</button>
	<button id="cancel" class="noButton" style="float: right">취소</button>
</div>
<script>
$("#cancel").click(function(){
	location.href="controller?cmd=dailyTaskAdminUI"
});
$("#recommendToggle").click(function(){
	$("#recommendList").toggle();
});
	//매뉴얼목록 토글
	$("#manualList").click(function() {
		$("#manual").toggle();
		$("#manualList").toggleClass("selected");
		if($(this).hasClass("selected")){
			manualSpaceMode();
		}
	});

	var activateli = function(input) {
		//업무 리스트 중 1개를 클릭 -> 업무 배정에 추가
		$("#selectedTask").html(input.childNodes[0].nodeValue);
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
				date : "${date}"
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
					//#### 페이지가 이벤트 처리이후 데이터를 실시간으로 가져올 때는 이후 관련 이벤트도 같이 연결 = getTasks.jsp로 코드 이동
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
	$("#addTaskFromTypingInput").focusout(function() {
		$("#searchFromManual").css({
			display : "none"
		});
	});
	
	$("#update").on("click", function(){
		if($("#selectedTask").html()=="새로운 업무를 선택하세요") {
			alert("업무를 선택해주세요");
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
							location.href="controller?cmd=dailyTaskAdminUI";
						}
					})
				}
	        }
		});
		}
	});
</script>
