<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 팝업으로 띄울 지점찾기: findBranch.jsp로 연결. -->
<html>
<head>
<%@include file="headSetting.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.modalBranch {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.modalBranch:target {
    opacity:1;
    pointer-events: auto;
}
.modalBranch > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	overflow: auto;	
}
</style>
</head>
<body>
<img class="inline" src="images/back.png" width="30pt" align="left"/>
	<h1>직원 회원 인증</h1>
지점명<input type="text" id="branchName" name="branchName" required><a href="#modalFindBranch">지점찾기</a>
<div id="branchNameCheck"></div>
<br>
이력서<input type="text" id="resumeFile" name="resumeFile"><br>
보건증<input type="text" id="healthFile" name="healthFile"><br>
통장사본<input type="text" id="bankFile" name="bankFile"><br>
계좌번호<select id="bankNameSelect">
<option selected>선택</option>
<option value="신한">신한</option>
<option value="국민">국민</option>
<option value="하나">하나</option>
<option value="우리">우리</option>
<option value="농협">농협</option>
<option value="기업">기업</option>
</select> <input type="text" id="accountNum" name="accountName"><br>
<button id="certify" class="ui-button ui-widget ui-corner-all" >인증요청</button>

	<!-- 모달 -->
	<div id="modalFindBranch" class="modalBranch">
	<header><a href="#close">닫기</a></header>
		<div>
				<%@include file="findBranch.jsp" %>
		</div>
				
	</div><!-- modal end -->
<script type="text/javascript">
		/*	
		 직원인증정보	STAFFS	insert	StaffDAO		
		 지점 검색		findBranch.jsp		본사 DB	HEAD_BRANCHES	select			
		 시/도 선택지 보기				주소	ADDRESSES	select			
		 구/군 선택지 보기				주소	ADDRESSES	select			
		 선택한 지역의 지점 목록 보기				본사 DB	HEAD_BRANCHES	select			
		 이력서 파일 첨부									파일첨부 질문!!!!!#####
		 보건증 파일 첨부									
		 통장사본 파일 첨부									
		 은행 선택지 보기									ui에서 처리? 더미 db필요?
		 본사 DB	HEAD_BRANCHES	select			
		 */

		//지점검색
		
	</script>

</body>
</html>