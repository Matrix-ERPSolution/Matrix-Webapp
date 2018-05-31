<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.accordion {
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

.active, .accordion:hover {
    background-color: #99ccff;
}

.accordion:before {
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.unfinished {
	color: gray;
}
ul {
	margin-left: -20pt;
	list-style: none;
}
li::before {
	font-size: 12pt;
	display: inline-block;
}
li.important::before {
	content: "\2605";
	color: orange;
	width: 1em;
	margin-left: -1.4em;
}
.ui-datepicker-trigger {
	width: 20pt;
	cursor: pointer;
}
.ui-datepicker-trigger:hover {
	width: 25pt;
}
#datemenu {
	vertical-align: middle 
}
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
#scrollPast:hover, #scrollFuture:hover {
	width: 17pt;
}
</style>
<script type="text/javascript">
var now = new Date();
var thisYear=now.getFullYear();
var thisMonth=now.getMonth()+1;
thisMonth = thisMonth >= 10 ? thisMonth : '0' + thisMonth;
var thisDay=now.getDate();

$(function(){
   $("#datepicker").datepicker({
      showOn : "button",
      buttonImage : "images/calendar.png",
      buttonText: "날짜 선택",
      buttonImageOnly : true,
      showButtonPanel : true,
      currentText : '이번 달로',
      closeText : '닫기',
      nextText : "다음 달",
      prevText : "이전 달",
      dateFormat : "yy/mm/dd",
      altField: "#alterDate",
      altFormat: "m"+"월 "+"d"+"일",
      showMonthAfterYear : true,
      showOtherMonths : true,
      selectOtherMonths : true,
      changeMonth: false, //true 하면 스크롤로 월 선택 가능
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        yearSuffix: "년",
      maxDate: "+1d",
      onSelect : function(dateText, inst){
       contentLoad();
    }
   });
});
</script>
</head>
<body>
<!-- 날짜선택바 -->
<div id="dateMenu" class="w3-center" style="vertial-align:center; padding:1px;">
   <span>
      <input type="text" id="datepicker" hidden="hidden">
      <input type="text" id="alterDate" hidden="hidden">
  </span>
  <span>
      <img id="scrollPast" src="images/leftTriangle.png" width="15pt"/>
   </span>
   <h2 id="date" style="display: inline;"></h2>
   <span>
      <img id="scrollFuture" src="images/rightTriangle.png" width="15pt"/>
   </span>
   <span>
       <i class="fa fa-external-link w3-xlarge" aria-hidden="true" id="assignTaskButton"></i>
   </span>
</div>

<!-- <h2 id="dailyTaskTitle" style="text-align:center;">dailyTaskTitle</h2> --> <!-- 오늘/내일/과거 업무 보기 -->
<div id="content"></div>

<div style="text-align: center;">
   <button id="updateTask">수정</button>
   <button id="deleteTask">삭제</button>
</div>

<div id="myModal" class="modal">
	<div class="modal-content">
		<div id="updateContent"></div>
		<div style="text-align: center;">
			<button id="confirmUpdate">수정완료</button>
			<button id="cancel">취소</button>
		</div>
	</div>
</div>

<script>
$("#confirmUpdate").click(function(){
	$("#myModal").css({
		"display":"none"
	});
});

$("#cancel").click(function(){
	$("#myModal").css({
		"display":"none"
	});
});

// 아코디언
var activateAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
		$.ajax({
	        url : "controller?cmd=getDailyTasksAction", 
	        data: {
	        	assignDate : $("#datepicker").val(),
	        	assignType : input.id
			},
	        success : function(result){
	        	panel.innerHTML = result;
	        	panel.style.maxHeight = panel.scrollHeight + "px";
	        }
	    });
    } 
}

/**일일업무 컨텐츠 로드 및 UI 설정*/
var contentLoad = function(){
	$("#date").html($("#alterDate").val());
	if($("#datepicker").val() == (thisYear + "/" +thisMonth + "/" + thisDay)){
		$("#updateTask").show();
		$("#deleteTask").show();
		$("#scrollFuture").show();
	} else if($("#datepicker").val() == (thisYear + "/" +thisMonth + "/" + (thisDay+1))){
		$("#updateTask").show();
		$("#deleteTask").show();
		$("#scrollFuture").hide();
	} else {
		$("#updateTask").hide();
		$("#deleteTask").hide();
		$("#scrollFuture").show();
	}
	$.ajax({
	   url:"controller?cmd=getAssignedPartsAction",
	   data:{
		 date : $("#datepicker").val()
		},
	   success:function(result){
	      $("#content").html(result);
	   }
	});
}
$(document).ready(function(){
	$("#datepicker").datepicker("setDate", "0d");
	contentLoad();
});

/**왼쪽/오른쪽 버튼으로 날짜 선택 시 세부 페이지 이동 기능*/
$("#scrollPast").on("click", function(){
	var dateVal = $("#datepicker").datepicker("getDate");
	dateVal.setDate(dateVal.getDate()-1);
	$("#datepicker").datepicker("setDate", dateVal);
	contentLoad();
});

$("#scrollFuture").on("click", function(){
	var dateVal = $("#datepicker").datepicker("getDate");
	dateVal.setDate(dateVal.getDate()+1);
	$("#datepicker").datepicker("setDate", dateVal);
	contentLoad();
});

/**업무 수정, 삭제  기능*/

$("#updateTask").click(function(){
	$(this).toggleClass("clicked");
	if($(this).hasClass("clicked")){
		$(".assignDetail").not($(".unfinished")).parent("li").css({"color": "lightgray"});
		$(".unfinished").show();
		$(".unfinished").prev().show();
		$(".unfinished").next().show();
		$(this).html("수정완료");
	} else {
		$(".assignDetail").not($(".unfinished")).parent("li").css({"color": "black"});
		$(".unfinished").not($(".personal").children()).hide();
		$(".unfinished").prev().hide();
		$(".unfinished").next().hide();
		$(this).html("수정");
	}
});

var activateTask = function(input){
	alert('ajax 업무수정'+input.parentElement.innerHTML)
}
var activateAssign = function(input){
	alert('ajax 업무재배정'+input.parentElement.innerHTML)
}

$("#deleteTask").click(function(){
   alert('업무 삭제');
});
/**assignTaskAdmin 페이지로 이동*/
$("#assignTaskButton").click(function(){
	$.ajax({
        url : "controller?cmd=assignTaskAdminUI", 
        data : {
        	date : $("#datepicker").val()
        },
        success : function(result){
           $("#result").html(result);
        }
    });
});



</script>

</body>
</html>
