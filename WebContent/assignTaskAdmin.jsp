<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업무 배정</title>
<%@include file="headSetting.jsp" %>
<style>
.accordion, .subAccordion, #manualList {
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

.active, .accordion:hover, .subAccordion:hover, #manualList:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before, #manualList:before {
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
<h2>5월 3일(목)</h2>
<h2>업무 배정</h2>
<div id="taskFromRecommend">
	<h4>오늘의 추천업무</h4>
	<div class="accordion" id="">바</div>
	<div class="panel">
		<ul>
			<li>비품재고현황표 작성 <span class="deadline" style="float: right;">D-2</span></li>
			<li>시럽류 유통기한 확인 <span class="deadline" style="float: right;">D-3</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="">카운터</div>
	<div class="panel">
		<ul>
			<li>은행에서 잔돈 교환 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="">홀</div>
	<div class="panel">
		<ul>
			<li>셀프 바 시럽 채우기 <span class="deadline" style="float: right;">D-1</span></li>
			<li>에어컨 필터 교체 <span class="deadline" style="float: right;">D-7</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="">테라스</div>
	<div class="panel">
		<ul>
			<li>테라스 외부 청소 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="">화장실</div>
	<div class="panel">
		<ul>
			<li>손 세정제 리필 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
</div>

<div id="taskFromManual">
	<h4>매뉴얼에서 선택하기</h4>
	<div id="searchTaskFromManual">
		<input id="search" type="text" placeholder="업무 목록 검색">
		<button>검색</button>
	</div>
	<div id="manualList">매뉴얼 목록
		<div class="accordion" id="">바</div>
		<div class="panel">
			<ul>
				<li>아이스 컵 재고량 점검 <span class="deadline" style="float: right;">2일</span></li>
				<li>원두 재고량 점검 <span class="deadline" style="float: right;">2일</span></li>
			</ul>
		</div>
		
		<div class="accordion" id="">카운터</div>
		<div class="panel">
			<ul>
				<li>영수증 용지 재고 확인 <span class="deadline" style="float: right;">2일</span></li>
				<li>현금 시재 확인 <span class="deadline" style="float: right;">미들조</span></li>
			</ul>			
		</div>
		
		<div class="accordion" id="">홀</div>
		<div class="panel">
			<ul>
				<li>셀프 바 빨대 재고량 확인<span class="deadline" style="float: right;">오픈</span></li>
				<li>바닥 쓸기 <span class="deadline" style="float: right;">마감</span></li>
			</ul>			
		</div>
		
		<div class="accordion" id="">테라스</div>
		<div class="panel">
			<ul>
				<li>테라스 테이블 및 바닥 청소<span class="deadline" style="float: right;">마감</span></li>
				<li>테라스 테이블, 의자 수거 <span class="deadline" style="float: right;">마감</span></li>
			</ul>			
		</div>
		
		<div class="accordion" id="">화장실</div>
		<div class="panel">
			<ul>
				<li>화장지 재고량 점검<span class="deadline" style="float: right;">3일</span></li>
				<li>화장실 청소 <span class="deadline" style="float: right;">마감</span></li>
			</ul>			
		</div>				
	</div>
</div>
<div id="taskFromTyping">
	<h4>직접 입력하기</h4>
	<div id="taskTyping">
		<input type="text" id="addTaskFromTypingInput"
			placeholder="일시적 업무 입력">
		<button id="addTaskFromTyping">추가</button>
	</div>
</div>
<div>
	<img id="delete" src="images/close.png" style="display: inline-block; width: 20px; float: left;">
	<ul id="selectedTask" style="display: inline-block;">
		<!-- 선택한 업무 보여주는 공간 -->
	</ul>
	<img id="next" src="images/forward.png" style="display: inline-block; width: 20px; float: right;">
</div>
<script>
//취소버튼
$("#delete").click(function(){
	$("#selectedTask").html("");
	$(".selected").removeClass("selected");
});

//다음버튼
$("#next").click(function(){
	location.href="assignTaskNextAdmin.jsp";
});

//아코디언 길이 조정: panel로.
var acc = document.querySelectorAll(".accordion");
var i;

for (i = 0; i < acc.length; i++) {
	acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		} else {
			panel.style.maxHeight = panel.scrollHeight + "px";
		}
	})
}

//매뉴얼목록 토글 작성중 - by 태훈
var cnt=0;
$("#manualList").click(function() {
   $("#manualList").children(".accordion").toggle(cnt++ % 2 === 0);
});

var subAcc = document.querySelectorAll(".subAccordion");

for (i = 0; i < subAcc.length; i++) {
	subAcc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		} else {
			panel.style.maxHeight = panel.scrollHeight + "px";
		}

		var motherPanel = this.parentNode;
		motherPanel.style.maxHeight = motherPanel.scrollHeight
				+ panel.scrollHeight + "px";
	})
}

//업무 리스트 중 1개를 클릭 -> 
var li = document.querySelectorAll("li");
var i;

for (i = 0; i < li.length; i++) {
	li[i].addEventListener("click", function() {
		this.classList.toggle("selected");
		if (this.classList.contains("selected")) {
			var addLi = document.createElement("li");
			var nodes = this.childNodes;
			for (var j = 0; j < nodes.length; j++) {
				addLi.appendChild(nodes[j].cloneNode(true));
			}
			document.querySelector("#selectedTask").appendChild(
					addLi);
		} else {
			var list = document.querySelector("#selectedTask");
			var li = list.firstChild;
			for (var j = 0; j < list.childNodes.length - 1; j++) {
				li = li.nextElementSibling;
				if (li.innerHTML == this.innerHTML) {
					list.removeChild(li);
					break;
				}
			}
		}
	})
}

//직접 입력하여 업무 추가
var addTask = document.querySelector("#addTaskFromTyping");
addTask.onclick = function() {
	var task = document.querySelector("#addTaskFromTypingInput");
	if (task.value != "") {
		var addLi = document.createElement("li");
		addLi.appendChild(document.createTextNode(task.value));
		document.querySelector("#selectedTask").appendChild(addLi);
		task.value = "";
	}
}

//직접 입력한 업무를 리스트에서 지우기

//자동완성 - 대분류 검색 안됨
$(function() {
	$.widget("custom.catcomplete", $.ui.autocomplete, {
		_create : function() {
			this._super();
			this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
		},
		_renderMenu : function(ul, items) {
			var that = this, currentCategory = "";
			$.each(items, function(index, item) {
				var li;
				if (item.category != currentCategory) {
					ul.append("<li class='ui-autocomplete-category'>"
							+ item.category + "</li>");
					currentCategory = item.category;
				}
				li = that._renderItemData(ul, item);
				if (item.category) {
					li.attr("aria-label", item.category + " : "
							+ item.label);
				}
			});
		}
	});
	var data = [{
		label : "홀 - 쓰레기통 비우기",
		category : "청소"
	}, {
		label : "홀 - 바닥 쓸기",
		category : "청소"
	}, {
		label : "홀 - 밀걸레질",
		category : "청소"
	}, {
		label : "주방 - 음식물 쓰레기 버리기",
		category : "청소"
	}, {
		label : "주방 - 음식물 쓰레기 버리기",
		category : "청소"
	}, {
		label : "주방 - 행주 소독",
		category : "청소"
	} ];
	$("#search").catcomplete({
		delay : 0,
		source : data
	});
});

</script>

</body>
</html>