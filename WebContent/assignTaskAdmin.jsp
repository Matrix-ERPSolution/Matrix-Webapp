<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>업무 배정</title>
<%@include file="headSetting.jsp" %>
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
li:hover, .selected {
	background-color: #99ccff;
}
.manual {
	display: none;
}

.ui-autocomplete-category {
   font-weight: bold;
   padding: .2em .4em;
   margin: .8em 0 .2em;
   line-height: 1.5;
}
</style>
</head>
<body>
<h2>5월 3일(목)</h2>
<h2>업무 배정</h2>
<div id="taskFromRecommend">
	<h4>오늘의 추천업무</h4>
	<div class="accordion" id="cleanControl">카운터</div>
	<div class="panel">
		<ul>
			<li>쇼케이스 얼룩 제거 <span class="deadline" style="float: right;">D-1</span></li>
			<li>아이스크림 기계 청소 <span class="deadline" style="float: right;">D-7</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="stockControl">주방</div>
	<div class="panel">
		<ul>
			<li>원두 재고 점검 <span class="deadline" style="float: right;">D-2</span></li>
			<li>컵 재고 점검 <span class="deadline" style="float: right;">D-3</span></li>
			<li>냉장고 성에 제거 <span class="deadline" style="float: right;">D-9</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="moneyControl">홀</div>
	<div class="panel">
		<ul>
			<li>대걸레 청소 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
</div>

<div id="taskFromManual">
	<h4 id="">매뉴얼에서 선택하기</h4>
	
	<div id="manualList">매뉴얼 전체보기</div>
	<div class="manual">
	<div class="accordion manual" id="counterControl" >카운터</div>
	<div class="panel">
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>카운터 닦기 <span class="interval" style="float: right;">마감 시</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>시재관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>영업 준비금 환전 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
	</div>

	<div class="accordion manual" id="stockControl">주방</div>
	<div class="panel">
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감시</span></li>
				<li>싱크대 닦기 <span class="interval" style="float: right;">마감시</span></li>
				<li>행주 소독 <span class="interval" style="float: right;">마감시</span></li>
				<li>냉장고 성에 제거 <span class="interval" style="float: right;">1개월</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>재고관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>딸기 재고 확인 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
	</div>
	
	<div class="accordion manual" id="moneyControl" >홀</div>
	<div class="panel" >
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>대걸레 청소 <span class="interval" style="float: right;">마감	시</span></li>
				<li>테이블 위 닦기 <span class="interval" style="float: right;">마감시</span></li>
				<li>쓰레기통 비우기 <span class="interval" style="float: right;">마감시</span></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>재고관리</div>
		</div>
		<div class="subPanel" id="hallTask">
			<ul>
				<li>냅킨 재고 채우기 <span class="interval" style="float: right;">3일</span></li>
				<li>빨대 채우기 <span class="interval" style="float: right;">3일</span></li>
			</ul>
		</div>
	</div>
	</div>	
</div>
<div id="taskFromTyping">
	<h4>직접 입력하기/매뉴얼에서 검색하기</h4>
	<div id="addTaskFromTyping" class="w3-dropdown-hover">
		<input id="addTaskFromTypingInput" type="text" placeholder="업무명을 입력해주세요">
		<div id="searchFromManual" class="w3-dropdown-content w3-bar-block w3-border">
     		<a href="#" class="w3-bar-item w3-button">Link 1</a>
    		<a href="#" class="w3-bar-item w3-button">Link 2</a>
    		<a href="#" class="w3-bar-item w3-button">Link 3</a>
  		</div>
		<button id="addTask">추가</button>
	</div>
	
</div>

<!-- 선택된 업무 출력 -->
<div id="selectedTaskModal" style="z-index:3;display:none;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4);bottom: 50px;">
</div>
<div id="selectedTaskPopup" style="z-index:4;position:fixed;outline:0;width:100%; background-color: #99ccff; bottom: 0px; height: 50px; display:none;">
    <span id="selectedTask"></span>
    <span id="closeModal" class="w3-button" style="pad; top:0; padding:3px 6px;">&times;</span>
    <span id="goNext" class="w3-button" style="pad; position:absolute; right:0;top:0; padding:3px 6px;">다음 단계<img alt="next" src="images/rightTriangle.png" width="15pt"></span>

  </div>
<script>
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

//매뉴얼목록 토글; 작성중
$("#manualList").click(function() {
	$(".manual").toggle();
	$("#manualList").toggleClass("selected");
});

//업무 리스트 중 1개를 클릭 -> 업무 배정에 추가
var li = document.querySelectorAll("li");
var i;

for (i = 0; i < li.length; i++) {
	li[i].addEventListener("click", function() {
		$("#selectedTask").html(this.firstChild.cloneNode(true));
		$("#selectedTaskModal").css({display: "block"});
		$("#selectedTaskPopup").css({display: "block"});
	})
}

//직접 입력하여 업무 추가
/* var addTask = document.querySelector("#addTask");
addTask.onclick = function() {
	var task = document.querySelector("#addTaskFromTypingInput");
	if (task.value != "") {
		document.querySelector("#selectedTask").appendChild(this.childNodes.clone());
		task.value = "";
		$("#selectedTaskModal").css({display: "block"});
	}
} */
$("#addTask").click(function(){
	if($("#addTaskFromTypingInput").val() != ""){
		$("#selectedTask").html($("#addTaskFromTypingInput").val());
		$("#selectedTaskModal").css({display: "block"});
		$("#selectedTaskPopup").css({display: "block"});
	}
});

$(".w3-bar-item.w3-button").click(function(){
	$("#selectedTask").html($(this).html());
	$("#selectedTaskModal").css({display: "block"});
	$("#selectedTaskPopup").css({display: "block"});
});
//선택or입력된 업무를 리스트에서 지우기



$("#closeModal").on("click", function(){
	$("#selectedTaskModal").css({display: "none"});
	$("#selectedTaskPopup").css({display: "none"});
});

$("#goNext").on("click", function(){
	location.href = "controller?cmd=assignTaskNextAdminUI";
});

//자동완성
$("#searchFromManual").width($("#addTaskFromTypingInput").width());
$("#addTaskFromTypingInput").on("keyup", function() {
	// $("#searchFromManual").html("");	//ajax에서 실시간으로 select result가져오게 되면 기존값을 계속 리셋해줘야함
	 $("#searchFromManual").css({display: "block"});
	    $.ajax({
	     url: "data.json",
	     dataType: "json",
	     success: function(data){
	      //json의 경우는 data는 파싱된 결과
	      //alert(data[0].num);
	      $.each(data, function(index, item){
	       $("#searchFromManual").append('<a href="#" class="w3-bar-item w3-button">' + item + '</a>'); 
	       //객체를 가져다가 파싱
	       //var ar=data["fields"];
	       //var ar1=data["records"];
	       //alert(ar[0].id+ar1[0].재산구분)
	      })
	      
	     }
	    })
});
$("#addTaskFromTypingInput").focusout(function(){
	$("#searchFromManual").css({display: "none"});
});

</script>

</body>
</html>