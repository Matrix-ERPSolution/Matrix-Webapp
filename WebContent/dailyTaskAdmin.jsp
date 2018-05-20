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

.finisher {
 display: inline;
}
ul {
 margin-left: -20pt;
 list-style: none;
}
li::before {
 font-size: 12pt;
 content: "•";
 color: gray;
 display: inline-block;
 width: 1em;
   margin-left: -1em;
}
li.selected::before {
 color: red;
}
.ui-datepicker-trigger {
 width: 20pt;
}
.inline {
 display: inline-block;
}
#datemenu {
	vertical-align: middle 
}
</style>
<script type="text/javascript">
var currentDate = new Date();
var thisMonth=currentDate.getMonth()+1;
var thisDay=currentDate.getDate();

$(function(){
   $("#datepicker").datepicker({
      showOn : "button",
      buttonImage : "images/calendar.png",
      buttonImageOnly : true,
      showButtonPanel : true,
      currentText : '이번 달로',
      closeText : '닫기',
      nextText : "다음 달",
      prevText : "이전 달",
      dateFormat : "m"+"월 "+"d"+"일",
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
       $("#date").html(dateText);
       
        if(dateText==(thisMonth+"월 "+thisDay+"일")) {
         $.ajax({
          url : "assignTaskAdmin.jsp",
          data : {},
          success : function(result){
           $("#contents").html(result);
          }
         })
        } else if(dateText==(thisMonth+"월 "+(thisDay+1)+"일")) {
         $.ajax({
            url : "futureTaskAdmin.jsp",
           date : {},
            success : function(result){
               $("#contents").html(result);
            }
        });
        }
    }
   });
   $("#datepicker").hide();
});
</script>
</head>
<body>
<!-- 날짜선택바 -->
<div id="dateMenu" class="w3-center" style="vertial-align:center; padding:1px;">
   <div class="inline">
      <input type="text" id="datepicker">
   </div>
   <div class="inline">
      <img id="scrollPast" src="images/leftTriangle.png" width="15pt" />
   </div>
   <h2 id="date" class="inline">n월 n일</h2>
   <div class="inline">
      <img id="scrollFuture" src="images/rightTriangle.png" width="15pt" />
   </div>
   <div class="inline" >
       <i class="fa fa-external-link w3-xlarge" aria-hidden="true" id="assignTaskButton"></i>
   </div>
</div>

<!-- 알맹이 -->
<!-- <h2 id="dailyTaskTitle" style="text-align:center;">dailyTaskTitle</h2> --> <!-- 오늘/내일/과거 업무 보기 -->
<div id="content">
<div class="accordion" id="personal">개인업무</div>
<div class="panel">
 <ul>
  <li class="selected">보건증 갱신<div class="finisher" style="float: right;">김태훈</div></li>
  <li class="selected">통장사본 제출 <div class="finisher" style="float: right;">홍윤영</div></li>
  <li>연진이 생일 케이크 사오기 (2호) <div class="finisher" style="float: right;">김수한무</div></li>
 </ul>
</div>

<div class="accordion" id="openTeam">오픈조</div>
<div class="panel" >
 <ul>
  <li>쇼케이스 점등 <div class="finisher" style="float: right;">장윤석</div></li>
  <li>POS기 켜기 <div class="finisher" style="float: right;">장윤석</div></li>
  <li>커피머신 켜기 <div class="finisher" style="float: right;">김태훈</div></li>
  <li>딸기 씻기 <div class="finisher" style="float: right;">장윤석</div></li>
 </ul>
</div>

<div class="accordion" id="middleTeam">미들조</div>
<div class="panel">
</div>

<div class="accordion" id="closeTeam">마감조</div>
<div class="panel">
</div>
<br>
<div style="text-align: center;">
   <button id="updateTask">수정</button>
   <button id="deleteTask">삭제</button>
</div>
</div>

 

<script>
// 아코디언
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

/**오늘의 업무 페이지 로드 + 오늘 날짜 설정*/
$.ajax({
   url:"todayTaskAdmin.jsp",
   success:function(result){
      $("#contents").html(result);
      $("#date").html(thisMonth+"월 "+thisDay+"일");
   }
});
   
/**왼쪽/오른쪽 버튼으로 날짜 선택 시 세부 페이지 이동 기능*/
$("#scrollPast").on("click", function(){
 $("#datepicker").datepicker("setDate", "-1d");
 $("#date").html($("#datepicker").val());
 //오늘, 과거 업무 페이지일때 왼쪽 버튼 누르면 hide(내일 업무 페이지에서는 hideX.) //현재 제대로 구현 안됨
 if($("#date").html()!=(thisMonth+"월 "+(thisDay+1)+"일")){
  $("#updateTask").hide();
  $("#deleteTask").hide();
 }
});

$("#scrollFuture").on("click", function(){
    $("#datepicker").datepicker("setDate", "+1d");
    $("#date").html($("#datepicker").val());
});

/**업무 수정, 삭제  기능*/
$("#updateTask").click(function(){
   alert('업무 수정');
});
$("#deleteTask").click(function(){
   alert('업무 삭제');
});
/**assignTaskAdmin 페이지로 이동*/
$("#assignTaskButton").click(
		function(){
			 $.ajax({
			        url : "assignTaskAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
</script>

</body>
</html>
