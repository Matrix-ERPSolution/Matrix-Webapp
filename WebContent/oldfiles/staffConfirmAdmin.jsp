<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</head>
<body>
<!-- 승인 요청 직원 목록 -->
<div id="staffAcceptRequestList">
		<table style="width: 220pt; margin-left: -20pt;">
			<tr>
				<td><img
					class="profilePhoto"
					src="images/defaultProfile.png"
					width="30" height="20"></td>
				<td align="left" class="staffConfirmName">윤제발</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">891024</td>
				<td><input type="button" class="staffAcceptButton" value="승인"
					style="float: right"></td>
				<td><input type="button" class="staffRejectButton" value="거부"
					style="float: right"></td>
			</tr>
			<tr>
				<td><img
					class="profilePhoto"
					src="images/defaultProfile.png"
					width="30" height="30"></td>
				<td align="left" class="staffConfirmName">하승인</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">971205</td>
				<td><input type="button" class="staffAcceptButton" value="승인"
					style="float: right"></td>
				<td><input type="button" class="staffRejectButton" value="거부"
					style="float: right"></td>
			</tr>
		</table>
	</div>
</body>
<script>
$(document).ready(function(){
	alert("ready");
});
$(".staffAcceptButton").click(
		function(){
			confirm(' 님을 직원으로 승인하시겠습니까?');
		});
$(".staffRejectButton").click(
		function(){
			confirm(' 님의 직원 승인을 거부하시겠습니까?');
		});
</script>
</html>