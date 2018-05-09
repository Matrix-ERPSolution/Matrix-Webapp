<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</script>
<h3 class="w3-center">오늘의 업무</h3>
<div class="accordion">
	<div>
		<p class="inline" align="left">개인업무</p>
		<p class="inline"></p>
	</div>
	<div id="personalTask">
		<table>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>보건증 갱신</td>
				<td>김태훈</td>
			</tr>
			<tr>
				<td><span class="ui-icon ui-icon-bullet"></span></td>
				<td>통장사본 제출</td>
				<td>홍윤영</td>
			</tr>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>연진이 생일 케이크 사오기 (2호)</td>
				<td>김수한무</td>
			</tr>
		</table>
	</div>
	<!-- end personal -->

	<h3>오픈조</h3>
	<div id="openUnit">
		<div class="subAccordion">
			<div>오픈 업무</div>
			<table>
				<tr>
					<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
					<td>쇼케이스 점등</td>
					<td></td>
				</tr>
				<tr>
					<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
					<td>POS기 켜기</td>
					<td>장윤석</td>
				</tr>
			</table>
			<div>재료 준비</div>
		</div> <!-- end subAccordion -->
	</div> <!-- end openUnit -->

	<h3>미들조</h3>
	<div id="middle">미들업무</div>

	<h3>마감조</h3>
	<div id="close">마감업무</div>

</div> <!-- end accordion -->
<footer style="text-align: right;">
	<button>수정</button> <button>삭제</button>
</footer>

<script>
$(".inline").css({
	"display":"inline"
});
</script>