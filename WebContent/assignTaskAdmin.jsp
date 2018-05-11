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
</style>
</head>
<body>
<h2>5월 3일(목)</h2>
<h2>업무 배정</h2>
<div id="taskFromRecommend">
	<h4>오늘의 추천업무</h4>
	<div class="accordion" id="cleanControl">위생관리</div>
	<div class="panel">
		<ul>
			<li>쇼케이스 얼룩 제거 <span class="deadline" style="float: right;">D-1</span></li>
			<li>아이스크림 기계 청소 <span class="deadline" style="float: right;">D-7</span></li>
			<li>냉장고 성에 제거 <span class="deadline" style="float: right;">D-9</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="stockControl">재고관리</div>
	<div class="panel">
		<ul>
			<li>원두 재고 점검 <span class="deadline" style="float: right;">D-2</span></li>
			<li>컵 재고 점검 <span class="deadline" style="float: right;">D-3</span></li>
		</ul>
	</div>
	
	<div class="accordion" id="moneyControl">시재관리</div>
	<div class="panel">
		<ul>
			<li>영업 준비금 환전 <span class="deadline" style="float: right;">D-1</span></li>
		</ul>
	</div>
</div>

	<div id="taskFromManual">
		<h4>매뉴얼에서 선택하기</h4>
		<div id="searchTaskFromManual">
			<input id="search" type="text" placeholder="업무 목록 검색">
			<button>검색</button>
		</div>
		<div id="manualList">매뉴얼 전체보기</div>
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
					<li>음식물 쓰레기 버리기 <span class="interval" style="float: right;">마감
							시</span></li>
					<li>싱크대 닦기 <span class="interval" style="float: right;">마감
							시</span></li>
					<li>행주 소독 <span class="interval" style="float: right;">마감
							시</span></li>
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
	</div>
	<div class="accordion manual" id="moneyControl" >홀</div>
	<div class="panel" >
		<div class="subAccordion">
			<div>청결관리</div>
		</div>
		<div class="subPanel" id="kitchenTask">
			<ul>
				<li>대걸레 청소 <span class="interval" style="float: right;">마감
						시</span></li>
				<li>테이블 위 닦기 <span class="interval" style="float: right;">마감
						시</span></li>
				<li>쓰레기통 비우기 <span class="interval" style="float: right;">마감
						시</span></li>
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
		
	<div id="taskFromTyping">
		<h4>직접 입력하기</h4>
		<div id="taskTyping">
			<input type="text" id="addTaskFromTypingInput"
				placeholder="일시적 업무 입력">
			<button id="addTaskFromTyping">추가</button>
		</div>
	</div>
	<div id="selectedTasks">
		<ul id="selectedTasksList"></ul>
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
				if(!this.classList.contains("selected") && document.querySelector("#selectedTasksList").innerHTML){
					return;
				}
				this.classList.toggle("selected");
				if (this.classList.contains("selected")) {
					var addLi = document.createElement("li");
					var nodes = this.childNodes;
					for (var j = 0; j < nodes.length; j++) {
						addLi.appendChild(nodes[j].cloneNode(true));
					}
					document.querySelector("#selectedTasksList").appendChild(addLi);
				} else {
					document.querySelector("#selectedTasksList").innerHTML = "";
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
				document.querySelector("#selectedTasksList").appendChild(addLi);
				task.value = "";
			}
		}

		//선택or입력된 업무를 리스트에서 지우기

		//자동완성
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
			var data = [ {
				label : "anders",
				category : ""
			}, {
				label : "annhhx10",
				category : "Products"
			}, {
				label : "annttop C13",
				category : "Products"
			}, {
				label : "andreas andersson",
				category : "People"
			}, {
				label : "andreas johnson",
				category : "People"
			}, {
				label : "홀 - 쓰레기통 비우기",
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

		//업무검색
	</script>

</body>
</html>