<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- 현재 재직중인 직원 관리 -->
<div id="workingStaffList">
		<table style="width: 230pt; margin-left: -20pt;">
			<tr>
				<td><img
					class="profilePhoto"
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">김연진</td>
				<td style="min-width: 50pt" align="right">여</td>
				<td style="min-width: 20pt" align="right">880101</td>
				<td><input type="button" class="retireButton" value="퇴사"
					style="float: right"></td>
				<td><img
					src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					width="30" height="30"></td>
			</tr>
			<tr>
				<td><img
					class="profilePhoto"
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">정알바</td>
				<td style="min-width: 50pt" align="right">여</td>
				<td style="min-width: 20pt" align="right">960903</td>
				<td><input type="button" class="retireButton" value="퇴사"
					style="float: right"></td>
				<td><img
					src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					width="30" height="30"></td>
			</tr>
			<tr>
				<td><img
					class="profilePhoto"
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">김태훈</td>
				<td style="min-width: 50pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">921108</td>
				<td><input type="button" class="retireButton" value="퇴사"
					style="float: right"></td>
				<td><img
					src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					width="30" height="30"></td>
			</tr>
			<tr>
				<td><img
					class="profilePicture"
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">장윤석</td>
				<td style="min-width: 50pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">930826</td>
				<td><input type="button" class="retireButton" value="퇴사"
					style="float: right"></td>
				<td><img
					src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					width="30" height="30"></td>
			</tr>
			<tr>
				<td><img
					class="profilePicture"
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">박파트</td>
				<td style="min-width: 50pt" align="right">여</td>
				<td style="min-width: 20pt" align="right">940530</td>
				<td><input type="button" class="retireButton" value="퇴사"
					style="float: right"></td>
				<td><img
					src="https://cdn3.iconfinder.com/data/icons/trico-circles-solid/24/Circle-Solid-Phone-256.png"
					width="30" height="30"></td>
			</tr>
		</table>
	</div>

</body>
<script>
$(".retireButton").click(
		function(){
			confirm(' 님을 퇴사 처리하시겠습니까?');
		});
</script>
</html>