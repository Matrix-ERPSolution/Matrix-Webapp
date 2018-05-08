<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</script>
</head>
<body>
<h3>어제 업무</h3>
<div class="accordion">
	<div>
		<p class="inline" align="left">개인업무</p><p class="inline"></p>
	</div>
	<div id="personalTask">
		<table>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>포스트잇 사오기</td>
				<td>김태훈</td>
			</tr>
			<tr>
				<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
				<td>열쇠 카운터에 놔두기</td>
				<td>홍윤영</td>
			</tr>
		</table>
	</div>
	<!-- end personal -->

	<h3>오픈조</h3>
	<div id="openUnit">
		<div class="subAccordion">
			<div>
				<p class="inline">오픈 업무</p><p class="inline" style="margin-left: 50pt;">홍윤영</p>
			</div>
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
				<tr>
					<td><span class="ui-icon ui-icon-bullet" style=""></span></td>
					<td>커피머신 켜기</td>
					<td>김태훈</td>
				</tr>
			</table>
			<div>
				<p class="inline">재료 준비</p><p class="inline" style="margin-left: 50pt;">김태훈</p>
			</div>
		</div> <!-- end subAccordion -->
	</div> <!-- end openUnit -->

	<h3>미들조</h3>
	<div id="middle">미들업무</div>

	<h3>마감조</h3>
	<div id="close">마감업무</div>

</div> <!-- end accordion -->
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>