<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>지점 검색</title>
</head>
<body>
	<h1>지점관리</h1>
	<select>
		<option value="">시/도</option>
	</select>
	<select>
		<option value="">시/군/구</option>
	</select>
	<div id="resultBranch">		<!-- 지점검색; 이하는 더미 데이터. -->
		<table id="branchList" border="2">
			<tr>
				<th>지점명</th>
				<th>도로명 상세주소</th>
				<th>지번 상세주소</th>
			</tr>
			<tr>
				<td>송파구청사거리</td>
				<td>오금로 81</td>
				<td>방이동 22-3</td>
			</tr>
			<tr>
				<td>경찰병원역</td>
				<td>중대로 135</td>
				<td>가락동 79</td>
			<tr>
				<td>잠실롯데</td>
				<td>올림픽로 240</td>
				<td>잠실동 40-1</td>
			</tr>
		</table>
	</div>	<!-- resultBranch end-->

</body>
</html>