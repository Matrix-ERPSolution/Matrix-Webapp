<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headSetting.jsp" %>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>	

.tabs {
  padding: 50px;
};
/* 퍼온소스 */
.w3-top,.w3-bottom{position:fixed;width:100%;z-index:1}.w3-top{top:0}.w3-bottom{bottom:0}
.w3-col{padding:0 8px}.w3-col.s3{width:24.99999%}
/* .w3-button{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}
.w3-button{-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
.w3-button:disabled{cursor:not-allowed;opacity:0.3}
.w3-button:hover{color:#000!important;background-color:#ccc!important} */
.w3-block{display:block;width:100%}
.w3-padding-64{padding-top:64px!important;padding-bottom:64px!important}
</style>
<header>
	<%@include file="slideMenu.jsp" %>
</header>
<body>
<!-- 위치조정 필요 -->
<div class="w3-top">
	<div class="tabs" >
	    <div class="w3-col s3">
	      <a id="dailyTaskTab" class="w3-button w3-block">일일업무</a>
	    </div>
	    <div class="w3-col s3">
	      <a id="manualTab" class="w3-button w3-block">매뉴얼</a>
	    </div>
	    <div class="w3-col s3">
	      <a id="staffManagementTab" class="w3-button w3-block">직원관리</a>
	    </div>
	</div> 
</div> 
<div style="background-color: aqua;" class="w3-padding-64" id="result"><%@include file="dailyTaskAdmin.jsp"%></div>


<script>
$(".inline").css({
	"display":"inline"
});
$("#dailyTaskTab").click(
		function(){
			 $.ajax({
			        url : "dailyTaskHeaderAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#manualTab").click(
		function(){
			 $.ajax({
			        url : "manual.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});
$("#staffManagementTab").click(
		function(){
			 $.ajax({
			        url : "staffManagementAdmin.jsp", 
			        success : function(result){
			           $("#result").html(result);
			        }
			    });
		});

</script>
</body>
</html>