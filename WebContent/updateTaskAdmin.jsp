<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
.finisher {
	display: inline;
}
ul {
	margin-left: -20pt;
	margin-top: -5pt;
	list-style: none;
}
li::before {
	font-size: 12pt;
	content: "\25CF";
	color: gray;
	display: inline-block;
	width: 1em;
  	margin-left: -1em;
}
li.selected::before {
	color: red;
}
h2 {
	text-align: center;
}
p {
	font-size: 9pt;
	margin-left: -5pt;
}
.center {
	text-align: center;
}
</style>
</head>
<body>
<h2>업무 수정</h2>
<div>
<!-- 중요체크 부분 -->
<p>중요</p>
<ul>
	<li id="selectedTask" class="selected">통장사본 제출<div class="finisher" style="float: right; ">홍윤영</div></li>
</ul>
</div>

<div>
업무배정 페이지 중 <br>
오늘의추천업무,  <br>
매뉴얼에서 선택하기, <br>
직접 입력하기  <br>
복붙해서 들어갈 부분 <br>
</div>
<div class="center">
	<button>수정완료</button>
	<button>취소</button>
</div>
<script>
$("#selectedTask").click(function(){
	alert('중요도 토글 설정');
});
</script>
</body>
</html>