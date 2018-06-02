<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업무 배정</title>
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
</style>
</head>
<body>
<h2>5월 3일(목)</h2>
<h2>업무 배정</h2>
<hr> <br>
<h4>${param.selectedTask}
<i class="fa fa-chevron-right" aria-hidden="true" style="margin-left:25px"></i>
</h4>
<div id="assignedTaskBox">
	<ul>
		<li ><i class="fa fa-circle" aria-hidden="true" style="margin-right:25px"></i></li> <li>쇼케이스 얼룩 제거</li> <li>D-1</li>
	</ul>
	<ul>
		<li><i class="fa fa-circle-thin" aria-hidden="true" style="margin-right:25px"></i></li> <li>아이스크림 기계 청소</li> <li>D-7</li>
	</ul>
	<ul>
		<li><i class="fa fa-circle" aria-hidden="true" style="margin-right:25px"></i></li> <li>연진이 생일 케이크 사오기</li> <li>D-0</li>
	</ul>
</div>

<hr><br>
<div id="taskFromRecommend">
	<h4>담당자 지정하기</h4>
	<div class="accordion" id="assignableParts">파트별</div>
	<div class="panel">
		<ul>
			<li class="units"><button class="units">오픈조</button></li>
			<li class="units"><button class="units">미들조</button></li>
			<li class="units"><button class="units">마감조</button></li>
		</ul>
	</div>
	
	<div class="accordion" id="stockControl">개인별</div>
	<div class="panel">
		<div class="subAccordion">
			<div>현재 근무자</div>
		</div>
		<div class="subPanel" id="presentStaff">
			<ul>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>김연진</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>김태훈</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>홍윤영</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>장윤석</p></li>				
			</ul>
		</div>
		<div class="subAccordion">
			<div>근무 예정자</div>
		</div>
		<div class="subPanel" id="scheduledStaff">
			<ul>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>박대기</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>정예정</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>한다음</p></li>
			</ul>
		</div>
		<div class="subAccordion">
			<div>기타</div>
		</div>
		<div class="subPanel" id="otherStaff">
			<ul>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>김기타</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>윤엘스</p></li>
				<li class="staffs"><i class="fa fa-user fa-3x" aria-hidden="true" ></i> <p>허등등</p></li>
			</ul>
		</div>
	</div>
</div>

<hr> <br>
<h5>해당 업무를 --- 파트에 배정합니다.</h5>
<div id="selectedTasks">
	<ul id="selectedTasksList">
	
	</ul>
</div>

<hr> <br>
<div style="text-align: center;">
<!-- <input type="button" class="assignButton" value="배정하기">
<input type="button" class="assignCancelButton" value="취소"> -->
<button id="assignButton">배정하기</button>
<button id="assignCancelButton">취소</button>
</div>
<script>
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
	 $.ajax({
	        //url : "controller?cmd=assignTaskAdminAction", 
	        //data : {  }
	        success : function(result) {
	        	confirm("~를 ~에게 배정합니다.");
				location.href = "controller?cmd=headerAdminUI";
	        }
	 });
});
$('#assignCancelButton').on('click',function (){
	        	alert("홈화면으로 돌아갑니다.");
				location.href = "controller?cmd=headerAdminUI";
});
</script>
</body>
</html>
