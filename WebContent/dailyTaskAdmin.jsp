<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<script>
$(function() {
   $(".accordion").accordion({  
      'collapsible':true,'active':false
   });
});
$(function() {
   $(".subAccordion").accordion({
      'collapsible':true,'active':false,
      icons : {
         "header" : "ui-icon-plus",
         "activeHeader" : "ui-icon-minus"
      }
   });
});
$(function(){
   $("#datepicker").datepicker({
      showOn : "button",
      buttonImage : "images/calendar.png",
      buttonImageOnly : true,
      showButtonPanel : true,
      currentText : '오늘 날짜',
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
      }
   });
   $("#datepicker").hide();
});

</script>
<style type="text/css">
.ui-datepicker-trigger {
	width: 20pt;
}
</style>
</head>
<body>

<div id="dateMenu">
   <div class="inline">
      <input type="text" id="datepicker">
   </div>
   <div class="inline">
      <img id="scrollPast" src="images/leftTriangle.png" width="15pt" />
   </div>
   <h2 id="date" class="inline">날짜</h2>
   <div class="inline">
      <img id="scrollFuture" src="images/rightTriangle.png" width="15pt" />
   </div>
   <div class="inline">
      <img src="images/taskassign.png" width="50pt" />
   </div>
</div>

<div id="contents">
</div>
<div style="text-align: right;">
   <button id="setTask">수정</button>
   <button id="deleteTask">삭제</button>
</div>

<script>
var currentDate = new Date();
var thisMonth = currentDate.getMonth()+1;
var today = currentDate.getDate();


/**오늘의업무 페이지 로드 + 오늘 날짜 설정*/
$.ajax({
   url:"todayTaskCSS.jsp",
   success:function(result){
      $("#contents").html(result);
      $("#date").html(thisMonth+"월"+today+"일");
   }
});
   
/**왼쪽/오른쪽 버튼으로 날짜 선택 시 세부 페이지 이동 기능*/
$("#scrollPast").on("click", function(){
   $.ajax({
      url : "pastTaskCSS.jsp", 
      success : function(result){
         $("#contents").html(result);
         $("#datepicker").datepicker("setDate", "-1d");
         $("#date").html($("#datepicker").val());
      }
   });
});

$("#scrollFuture").on("click", function(){
   $.ajax({
      url : "futureTaskAdmin.jsp", 
      success : function(result){
         $("#contents").html(result);
         $("#datepicker").datepicker("setDate", "+1d");
         $("#date").html($("#datepicker").val());
      }
   });
});

/**업무 수정, 삭제  기능*/
$("#setTask").click(function(){
   alert('업무 수정');
});
$("#deleteTask").click(function(){
   alert('업무 삭제');
});

</script>
<script>
$(".inline").css({
   "display":"inline"
});
</script>
</body>
</html>