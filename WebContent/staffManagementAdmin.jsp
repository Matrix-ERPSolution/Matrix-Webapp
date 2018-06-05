<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="headSetting.jsp"%>
<%@include file = "tabMenuAdmin.jsp" %>
<style type="text/css">
.accordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: 2px solid #d4e5f7;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
.subAccordion {
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: 2px solid #e6f2ff;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}
.active, .accordion:hover, .subAccordion:hover {
    background-color: #99ccff;
}

.accordion:before, .subAccordion:before {
	font-family: FontAwesome;
    content: '\f0da';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    font-family: FontAwesome;
    content: '\f0d7';
}

.panel, .subPanel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
.inline {
	display:inline;
}

/* modal */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    /* padding: 20px; */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    height:180px;
    
}
.profilePhoto {
	border-radius: 50%;
	height: 40px;
	width: 40px;
	float: left;
}
.resultStaffTable {
	font-size: 10pt;
	padding-top: 10px;
	padding-bottom: 10px;
}
.resultStaffTable tr td {
	padding-right: 10px;
}
.resultStaffTable tr td input {
	background-color: white;
	border-color:rgb(50, 132, 226);
	border-width:1px;
	border-radius:10%;
	color: rgb(50, 132, 226);
	padding: 3px;
}
.setWorkPartHeader{
	font-size: 14pt;
	text-align: left;
    padding: 10px 16px 10px 10px;
    background-color: rgb(50, 132, 226);
    color: white;
    width: 100%;
}
.workParts {
	border: none;
	background-color: rgb(153,153,153);
	color: rgb(255,255,255);
	border-radius: 20%;
	padding: 14px;
	cursor: pointer;	
}
.selected {
	background-color: rgb(50, 132, 226);
}
.container {
	max-width: 800px;
	min-height: 640px;
    margin: auto;
	text-align: center;
	background-color: rgba(255,255,255,0.2);
}
</style>
</head>
<body>
<div class="container">
<div align="center" class="w3-center">
	<h3>직원 관리</h3>
</div>

<div id="preStaffs" class=" accordion" onclick="activateAcc(this)">승인 요청 내역</div>
<div class="panel"></div>

<div id="workingStaffs" class=" accordion" onclick="activateAcc(this)">재직 중인 직원들</div>
<div class="panel"></div>

<div id="leftStaffs" class=" accordion" onclick="activateAcc(this)">퇴사한 직원들</div>
<div class="panel"></div>

<!-- 파트 수정 Modal content -->
<div class="modal">	<!-- 얘 위치를 정확히 모르겠음 -->
<div class="modal-content">
</div>
</div>

</div>
<script>

/**승인 요청 내역 관련 event*/
var acceptStaff = function(input){
	var acceptedStaff = $(input).parent().siblings(".preStaffName").html();
	if(confirm(acceptedStaff+' 님을 직원으로 승인하시겠습니까?')) {
		var staffIdToSetJoinDate = $(input).parents("tr").attr("id");
		$.ajax({
			url : "controller?cmd=setJoinDateAction",
			data : {
				staffId : staffIdToSetJoinDate
			},
			success : function(result){
				alert("승인되었습니다.");
				document.querySelector("#staffManagementTab").click();	//jQuery로는 안됨
			}
		});
	}
};
var rejectStaff = function(input){
	var rejectedStaff = $(input).parent().siblings(".preStaffName").html();
	if(confirm(rejectedStaff+' 님의 직원 승인을 거부하시겠습니까?')) {
		var staffIdToRemoveStaff = $(input).parents("tr").attr("id");
		$.ajax({
			url : "controller?cmd=removeStaffAction",
			data : {
				staffId : staffIdToRemoveStaff
			},
			success : function(result){
				alert("거부되었습니다.");
				document.querySelector("#staffManagementTab").click();	//jQuery로는 안됨
			}
		});
	}
};

/**재직 중인 직원들 관련 event*/
/*파트 변경*/
var modal = document.querySelector(".modal");
//console.log($(".modal"));	//jQuery로는 안됨
var getWorkPart = function(input){
	var staffIdToSetWorkPart = $(input).parents("tr").attr("id");
	var staffNameToSetWorkPart = $(input).parent().siblings().next("td.workingStaffName").html();
	var workPartToSet = $(input).val();
	 $.ajax({
		 url : "controller?cmd=getWorkPartsAction",
		 data : {
			 staffId : staffIdToSetWorkPart,
			 staffName : staffNameToSetWorkPart,
			 oldWorkPart : workPartToSet
		 },
		 success : function(result){
			$(".modal-content").html(result);
			modal.style.display = "block";
		 }
	 })
};

var setWorkPart = function(input){
	if($(input).siblings().hasClass("selected")){
		$(input).siblings().removeClass("selected");	
	}
	$(input).addClass("selected");
	$(".modal-content").fadeOut('slow');
	$(".modal").fadeOut('slow');
	var workPart = $(input).html();
	var staffId = $(".staffInfoToSetWorkPart").attr("id");
	$.ajax({
		url : "controller?cmd=setWorkPartAction",
		data : {
			staffId : staffId,
			workPart : workPart
		},
		success : function(result){
			alert("수정되었습니다.");
			document.querySelector("#staffManagementTab").click();
		}
	});
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

/*퇴사*/
var setLeaveDate= function(input){
	var staffIdToSetLeaveDate = $(input).parents("tr").attr("id");
	if(confirm(staffIdToSetLeaveDate+' 님을 퇴사시키겠습니까?')){
		$.ajax({
			url : "controller?cmd=setLeaveDateAction",
			data : {
				staffId : staffIdToSetLeaveDate
			},
			success : function(result) {
				alert("퇴사되었습니다.");
				document.querySelector("#staffManagementTab").click();
			}
		});
	}
};

/**직원 상세 페이지 관련 event*/
var getStaffDetail = function(input){
	var staffIdToGetStaffDetail = $(input).parent("tr").attr("id");
	location.href = "controller?cmd=staffDetailAdminUI&staffId="+staffIdToGetStaffDetail;
}

/**세부 페이지 이동 event*/
var activateAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      if(input.id=="preStaffs"){
    		$.ajax({
    	        url : "controller?cmd=getPreStaffsAction", 
    	        data: {},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        	panel.style.maxHeight = panel.scrollHeight + "px";
    	        }
    	    });
    	}
      
       if(input.id=="workingStaffs"){
	  		$.ajax({
	  	        url : "controller?cmd=getWorkingStaffsAction", 
	  	        data: {},
	  	        success : function(result){
	  	        	panel.innerHTML = result;
	  	        	panel.style.maxHeight = panel.scrollHeight + "px";
	  	        }
	  	    });
	  	}
       
       if(input.id=="leftStaffs"){
	  		$.ajax({
	  	        url : "controller?cmd=getLeftStaffsAction", 
	  	        data: {},
	  	        success : function(result){
	  	        	panel.innerHTML = result;
	  	        	panel.style.maxHeight = panel.scrollHeight + "px";
	  	        }
	  	    });
  		}
      
    } 
}
</script>
</body>
</html>
