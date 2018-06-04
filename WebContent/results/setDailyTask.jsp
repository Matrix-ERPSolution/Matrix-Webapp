<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file = "../tabMenuAdmin.jsp" %>
<style>
html, body { height:100%; margin:0; padding:0;}
.accordion, .subAccordion, #manualList {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: none;
    text-align: left;
    font-size: 15px;
    transition: 0.4s; 
    }

.active, .accordion:hover, .subAccordion:hover, #manualList:hover {
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
	margin-left: -20pt;
	list-style: none;
}
li {
	font-size: 10pt;
}
li:hover, .selected {
	background-color: #99ccff;
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
	color: lightgray;
	width: 1em;
}
.important#selectedTask::before, .important#oldTask::before{
	content: "\2605";
	color: orange;
	width: 1em;
}
</style>
</head>
<body>
<h2>업무 수정</h2>
<div id="oldTask">
${param.oldDailyTask}
<span class="assignDetail unfinished " id="${param.assignDetail}" style="float: right; display: inline-block;">${param.assignName}</span>
</div>
<div id="taskFromRecommend">
	<h4>오늘의 추천업무</h4>
	<div id="recommendList">
	</div>
</div>

<div id="taskFromManual">
	<h4 id="">매뉴얼에서 선택하기</h4>
	<div id="manualList">매뉴얼 전체보기</div>
	<div id="manual">
	</div>	
</div>
<div id="taskFromTyping">
	<h4>직접 입력하기/매뉴얼에서 검색하기</h4>
	<div id="addTaskFromTyping" class="w3-dropdown-hover">
		<input id="addTaskFromTypingInput" type="text" placeholder="업무명을 입력해주세요">
		<div id="searchFromManual" class="w3-dropdown-content w3-bar-block w3-border">
  		</div>
		<button id="addTask">추가</button>
	</div>
	
</div>

<!-- 선택된 업무 출력 -->
<span id="selectedTask"></span>
<span id="closeModal" class="w3-button" style="pad; top:0; padding:3px 6px;">&times;</span>
<span id="update" class="w3-button" style="pad; position:absolute; padding:3px 6px;">수정완료</span>
<script>

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
	});
</script>
