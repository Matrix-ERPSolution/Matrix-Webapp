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

</script>
</head>
<body>
<h3>2층 확장</h3>
저장 날짜: 2016.02.17.
<div class="accordion">
	<h3>시재관리</h3>
	<div>시재관리 디테일 여기에</div>

	<h3>재고관리</h3>
	<div>재고관리 디테일 여기에</div>

	<h3>청소</h3>
	<div class="subAccordion">
		<div>주방</div>
		<table>
			<tr>
				<td>음식물 쓰레기 버리기</td>
				<td>마감 시</td>
			</tr>
			<tr>
				<td>싱크대 닦기</td>
				<td>마감 시</td>
			</tr>
			<tr>
				<td>행주 소독</td>
				<td>마감 시</td>
			</tr>
			<tr>
				<td>냉장고 성에 제거</td>
				<td>1개월</td>
			</tr>
		</table>
		<div>홀</div>
		<table>
			<tr>
				<td>바닥 대걸레 청소</td>
				<td>오픈 시</td>
			</tr>
			<tr>
				<td>쓰레기통 비우기</td>
				<td>마감 시</td>
			</tr>
		</table>
		<div>화장실</div>
		<table>
			<tr>
				<td>남자화장실 핸드타월 갈기</td>
				<td>일주일</td>
			</tr>
		</table>
	</div> <!-- end subAccordion -->
</div> <!-- end accordion -->
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>
</html>