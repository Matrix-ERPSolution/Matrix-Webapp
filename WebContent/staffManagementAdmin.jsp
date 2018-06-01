<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="headSetting.jsp"%>
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
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel, .subPanel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
</head>
<body>
<div align="center" class="w3-center">
	<h3>직원 관리</h3>
</div>
<%-- <div class="accordion" style="width: 235pt; margin-left: 20pt;">
	<h3 id="preStaffs">승인 요청 내역</h3>
		<div><%@include file="staffConfirmAdmin.jsp" %></div>
	
	<h3>재직 중인 직원들</h3>
		<div><%@include file="staffCurrentAdmin.jsp" %></div>
			
	<h3>퇴사한 직원들</h3>
		<div><%@include file="staffRetiredAdmin.jsp" %></div>
</div> --%>
<div class="preStaffs accordion" onclick="activateAcc(this)">승인 요청 내역</div>
<div class="panel"></div>

<div class="workingStaffs accordion" onclick="activateAcc(this)">재직 중인 직원들</div>
<div class="panel"></div>

<div class="leftStaffs accordion" onclick="activateAcc(this)">퇴사한 직원들</div>
<div class="panel"></div>
<script>
$(".inline").css({
	"display":"inline"
});

$(".profilePhoto").click(function(){
	$.ajax({
		url : "controller?cmd=staffDetailAdminUI", 
		data : {},
		success : function(result){
			$("#result").html(result);
			}
		});
	});

$(document).ready(function(){
	//alert("ready");
});

$(".staffAcceptButton").click(
		function(){
			confirm(' 님을 직원으로 승인하시겠습니까?');
		});
$(".staffRejectButton").click(
		function(){
			confirm(' 님의 직원 승인을 거부하시겠습니까?');
		});
		
var activateAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      if(input.classList.contains("preStaffs")){
    		$.ajax({
    	        url : "controller?cmd=getPreStaffsAction", 
    	        data: {},
    	        success : function(result){
    	        	panel.innerHTML = result;
    	        	panel.style.maxHeight = panel.scrollHeight + "px";
    	        }
    	    });
    	}
       if(input.classList.contains("workingStaffs")){
  		$.ajax({
  	        url : "controller?cmd=getWorkingStaffsAction", 
  	        data: {},
  	        success : function(result){
  	        	panel.innerHTML = result;
  	        	panel.style.maxHeight = panel.scrollHeight + "px";
  	        }
  	    });
  	}
       /*if(input.classList.contains("leftStaffs")){
  		$.ajax({
  	        url : "controller?cmd=getLeftStaffsAction", 
  	        data: {},
  	        success : function(result){
  	        	panel.innerHTML = result;
  	        	panel.style.maxHeight = panel.scrollHeight + "px";
  	        }
  	    });
  	} */
      
    } 
}

var activateSubAcc = function(input){
    input.classList.toggle("active");
    var panel = input.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
    	var space = "";
    	var task = "";
    	if(input.classList.contains('taskType')){
    		task = input.id;
    		space = input.parentNode.previousElementSibling.id;
    	} else if(input.classList.contains('spaceType')){
    		space = input.id;
    		task = input.parentNode.previousElementSibling.id;
    	}
    	$.ajax({
	        url : "controller?cmd=getManualTasksAction", 
	        data: {
				spaceType : space, 
				taskType : task
			},
	        success : function(result){
	        	panel.innerHTML = result;
	        	panel.style.maxHeight = panel.scrollHeight + "px";
	        	var motherPanel = input.parentNode;
	            motherPanel.style.maxHeight = motherPanel.scrollHeight + panel.scrollHeight + "px";
	        }
	    });
    } 
    
    
}
</script>
</body>
</html>