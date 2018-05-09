<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp"%>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style type="text/css">
html.open {
  overflow: hidden;
}

#menu {
  width: 40px;
  height: 40px;
  position: relative;
  left: 10px;
  top: 5px;
  z-index: 1;
/*   background-image: url('images/menu.png'); 
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: center;*/
 }

#close {
  width: 30px;
  height: 30px;
  position: absolute;
  right: 0px;
  top: 0px;
  background-image: url('images/close.png');
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  }

#slideMenu {
  width: 240px;
  height: 100%;
  position: fixed;
  top: 0px;
  left: -240px;
  z-index: 10;
  border: 1px solid #c9c9c9;
  background-color: white;
  text-align: left;
  transition: All 0.2s ease;
  padding-top: 40px;
}

#slideMenu.open {
  left: 0px;
}

#pageCover.open {
  display: block;
}

#pageCover {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0px;
  right: 0px;
  background-color: rgba(0, 0, 0, 0.4);
  z-index: 4;
  display: none;
}
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width : 40%;
	vertical-align: bottom;
}
ul {
	list-style: none;
}
</style>

</head>
<body>
<div class="w3-container w3-top">
  	<!-- <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a> -->
	<!-- <div id="menu" style="display:inline"></div>메뉴 버튼 -->
	<img id="menu" src="images/menu.png" style="width:40px; height:40px; display:inline">
	<img src="images/logo.png" >
</div>
<div style="max-width: 1000px; margin: auto;">
	<div onclick="history.back();" id="pageCover"></div>

	<div id="slideMenu">
		<!-- 슬라이드 메뉴 -->
		<table>
		<tr>
			<td><img src="" alt="프로필사진"></td>
			<td><div id="shopName">가락시장점</div>
				<div id="memberClass">관리자</div>
				<div id="memberName">홍윤영님</div></td>
		</tr>
		<tr>
			<td><button>로그아웃</button></td>
			<td><button>홈 화면</button></td>
		</tr>
		</table>
		
		<div id="section">
			<ul>
				<li><a href="changeInfoAdmin.jsp">회원 정보 수정</a></li>
				<li><a href="#">알림 설정</a></li>
				<li><a href="#">도움말</a></li>
				<li><a href="#">버전 정보</a></li>
				<li><a href="#">개발자 정보</a></li>
			</ul>
		</div>
		<!-- section end -->
		<div onclick="history.back();" id="close"></div>
		<!-- 닫기 버튼 -->
	</div>
	<!-- slideMenu end -->
	<script type="text/javascript">
		//sidemenu 클릭 시 slidemenu, pagecover(음영) 호출
		$("#menu").click(function() {
			$("#slideMenu,#pageCover,html").addClass("open");
			window.location.hash = "#open";
		});

		//close 클릭 혹은 다른 화면 영역 클릭 시 슬라이드 메뉴 닫힘
		window.onhashchange = function() {
			if (location.hash != "#open") {
				$("#slideMenu,#pageCover,html").removeClass("open");
			}
		};
	</script>
</div>
</body>
</html>