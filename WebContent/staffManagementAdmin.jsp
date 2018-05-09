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
<div align="center" class="w3-center">
	<h3>직원 관리</h3>
</div>
<div class="accordion" style="width: 235pt; margin-left: 20pt;">
	<h3>승인 요청 내역</h3>
	<div id="staffAcceptRequestList">
		<table style="width: 220pt; margin-left: -20pt;">
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">윤제발</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">891024</td>
				<td><input type="button" class="staffAcceptButton" value="승인"
					style="float: right"></td>
				<td><input type="button" class="staffRejectButton" value="거부"
					style="float: right"></td>
			</tr>
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">하승인</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">971205</td>
				<td><input type="button" class="staffAcceptButton" value="승인"
					style="float: right"></td>
				<td><input type="button" class="staffRejectButton" value="거부"
					style="float: right"></td>
			</tr>
		</table>
	</div>

	<h3>재직 중인 직원들</h3>

	<div id="workingStaffList">
		<table style="width: 230pt; margin-left: -20pt;">
			<tr>
				<td><img
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

	<h3>퇴사한 직원들</h3>
	<div id="retiredStaffList">

		<table style="width: 200pt; margin-left: -20pt;">
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">강퇴사</td>
				<td style="min-width: 20pt" align="right">여</td>
				<td style="min-width: 20pt" align="right">850228</td>
			</tr>
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">박그만</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">830311</td>
			</tr>
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">고만해</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">921208</td>
			</tr>
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">안해영</td>
				<td style="min-width: 20pt" align="right">여</td>
				<td style="min-width: 20pt" align="right">930915</td>
			</tr>
			<tr>
				<td><img
					src="https://www.puriindahmall.co.id/assets/img/default.png"
					width="30" height="30"></td>
				<td align="left">김이직</td>
				<td style="min-width: 20pt" align="right">남</td>
				<td style="min-width: 20pt" align="right">900330</td>
			</tr>
		</table>
	</div>
</div> <!-- end accordion -->
<script>
$(".inline").css({
	"display":"inline"
});
</script>
</body>
</html>