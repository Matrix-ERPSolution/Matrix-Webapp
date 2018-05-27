<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<style>
.modalBranch {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modalBranch-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
#grad1 {
    height: 640px;
    background: #2E64FE;
    background: linear-gradient(#2E64FE, white);
	text-align: center;
}
.roundBox {
	width: 200px;
	height: 30px;
	border-radius: 20px;
	text-align: center;
}
</style>
</head>
<body id="grad1">
	<div>
		<img id="logo" src="images/logo_white.png" width="80%" height="80%" style="top: 100px;"><br>
		<h4 class="inline" align="center">직원 회원 인증</h4>
	</div>

<input type="text" id="branchName" name="branchName" class="roundBox" required placeholder="지점명"><br>
<a href="#modalFindBranch" class="roundBox">지점찾기</a>
<div id="branchNameCheck"></div>
<br>
<input type="text" id="resumeFile" name="resumeFile" class="roundBox" placeholder="이력서"><br>
<input type="text" id="healthFile" name="healthFile" class="roundBox" placeholder="보건증"><br>
<input type="text" id="bankFile" name="bankFile" class="roundBox" placeholder="통장사본"><br>
<select id="bankNameSelect">
<option selected>선택</option>
<option value="신한">신한</option>
<option value="국민">국민</option>
<option value="하나">하나</option>
<option value="우리">우리</option>
<option value="농협">농협</option>
<option value="기업">기업</option>
</select> <input type="text" id="accountNum" name="accountName" class="roundBox" placeholder="계좌번호"><br>
<button id="certify" class="roundBox" >인증요청</button>

	<!-- 모달 -->
	<div id="modalFindBranch" class="modalBranch">
		<div class="modal-content">
		<%@include file="findBranch.jsp" %>
		</div>
	</div><!-- modalBranch end -->
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
	</script>

</body>
</html>