<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
</head>
<body>
<h2>업무 수정</h2>
<div>
<!-- 중요체크 부분 -->
<p>중요</p>
<ul>
	<li id="importantTask" class="important">통장사본 제출<div class="finisher">홍윤영</div></li>
</ul>
</div>

<div>
업무배정 페이지 중 <br>
오늘의추천업무,  <br>
매뉴얼에서 선택하기, <br>
직접 입력하기  <br>
복붙해서 들어갈 부분 <br>
</div>



<script>


$("#importantTask").click(function(){
	alert('중요도 토글 설정');
});
</script>
</body>
</html>