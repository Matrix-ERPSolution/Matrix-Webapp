<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<%@include file = "loginCheckUser.jsp" %>
<style>
#logo{
	display:block;
	padding-top:10px;
	margin-left: auto;
	margin-right: auto;
}
body {
	background-image: url("images/joinetc.png");
    background-position: center top;
    background-repeat: no-repeat;
    background-size: 360px 640px;
    margin: auto;
    width: 100%;
}
.addUserInput {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #004566;
 	line-height : normal;
	width: 200px;
	padding: 10px;
	text-align: center;
	background-color: rgba(0,0,0,0);
	color: #004566;
	font-weight: bold;
}
.certifyUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: rgb(153, 204, 255);
	color: black;
	margin-top: 20px;
	margin-bottom: 20px;
}
/* .addUserButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #005580;
	color: #FFFFFF;
} */
/* .cancelButton {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	border: none;
	text-align: center;
	background-color: #bfbfbf;
	color: black;
	margin-top: 20px;
} */
.addUserHeader {
	text-align: center;
	padding-top: 15%;
	height: 40px;
	font-size: 18pt;
}
.addUserContainer {
	text-align: center;
	padding-top: 20px;
	width: 300px;
	margin: auto;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgv(0,0,0);
	background-color: rgba(0, 0, 0, 0.4)
}

.modal-content {
	background: #2E64FE;
	background: linear-gradient(#2E64FE, white);
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 85%;
	height: 300px;
	position: relative;
	outline: 0;	
}

.w3-display-topright {
	position: absolute;
	right: 0;
	top: 0
}
</style>
</head>
<body>
<img id="logo" src="images/logo_white.png" width="100%" height="100%" ><br>
	<div class=addUserHeader>
		<span>직원 회원 인증</span>
	</div>
<div id="staffInfo" align="center">
<input type="text" id="branchName" name="branchName" class ="addUserInput" required="required" placeholder="지점명"><br>
<button id="findBranch" class="certifyUserButton">지점찾기</button>

<div id="branchNameCheck"></div>
<br>
<input type="text" id="resumeFile" name="resumeFile" class ="addUserInput" placeholder="이력서"><br>
<input type="text" id="healthFile" name="healthFile" class ="addUserInput" placeholder="보건증"><br>
<input type="text" id="bankFile" name="bankFile" class ="addUserInput" placeholder="통장사본"><br>
<select id="bankNameSelect">
<option selected>선택</option>
<option value="신한">신한</option>
<option value="국민">국민</option>
<option value="하나">하나</option>
<option value="우리">우리</option>
<option value="농협">농협</option>
<option value="기업">기업</option>
</select>
<br><input type="text" id="accountNum" name="accountName" class ="addUserInput" placeholder="계좌번호"><br>
<button id="certify" class="certifyUserButton" >인증요청</button>
</div>
	<!-- 모달 -->
	<div id="modalFindBranch" class="modal">
    <div class="modal-content">
      <header> 
        <span id="closeMark" class="w3-button w3-display-topright">&times;</span>
        <h2>지점찾기</h2>
      </header>
      <div>
        <%@ include file="findBranch.jsp" %>
      </div>
      <footer>
      	<div id="selectedBranchName"></div>
      </footer>
    </div>
  </div>
<script type="text/javascript">
	
	/*	
	 직원인증정보	STAFFS	insert	StaffDAO		
	 		
	 이력서 파일 첨부									파일첨부 질문!!!!!#####
	 보건증 파일 첨부									
	 통장사본 파일 첨부									
	 은행 선택지 보기									ui에서 처리? 더미 db필요?
	 본사 DB	HEAD_BRANCHES	select			
	 */

	//지점검색: 모달로 구현;
	
	var modal = document.querySelector("#modalFindBranch");
	//모달 띄우기
	document.querySelector("#findBranch").onclick=function(){
		modal.style.display="block";
	};
	//모달 닫기
	document.querySelector("#closeMark").onclick=function(){
		modal.style.display="none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	//jquery로 모달 컨트롤하려던 부분.
	/* $("#findBranch").click(function(){
		$("#modalFindBranch").css({
			"display" : "block"
		});
	}); */
	
	/* $("#closeMark").click(function(){
		$("#modalFindBranch").css({
			"display" : "none"
		});
	}); */

	/* $("body").on("click", function(event) {
		if (event.target() == $("#modalFindBranch")) {
			$("#modalFindBranch").css({
				"display" : "none"
			});
		} 
	}); */
</script>

</body>
</html>