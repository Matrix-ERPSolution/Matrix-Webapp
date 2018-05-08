<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp"%>
<title></title>
<style type="text/css">
html.open {
  overflow: hidden;
}

#sideMenu {
  width: 30px;
  height: 30px;
  position: absolute;
  left: 0px;
  top: 0px;
  z-index: 1;
  background-image: url('images/menu.png');
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
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
  width: 180px;
  height: 100%;
  position: fixed;
  top: 0px;
  left: -180px;
  z-index: 10;
  border: 1px solid #c9c9c9;
  background-color: white;
  text-align: left;
  transition: All 0.2s ease;
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
</style>

</head>
<body>
	<div id="sideMenu"></div>
	<!-- 메뉴 버튼 -->
	<div onclick="history.back();" id="pageCover"></div>
	<div id="slideMenu">
		<!-- 슬라이드 메뉴 -->
		<div id="shopName">점포</div>
		<br>
		<div id="memberClass">직위</div>
		<br>
		<div id="memberName">회원명</div>
		<br>
		<button>로그아웃</button>
		<button>홈 화면</button>
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
		$("#sideMenu").click(function() {
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

</body>
</html>