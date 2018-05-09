<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.accordion{
    background-color: #e6f2ff;
    font-weight: bold;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover{
    background-color: #99ccff;
}

.accordion:before{
    content: '\25B6';
    color: #003366;
    font-weight: bold;
    float: left;
    margin-right: 5px;
}

.active:before {
    content: '\25BC';
}

.panel{
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}

.finisher {
	display: inline;
}
</style>
</head>

<body>
<h3>내일 업무</h3>
<div class="accordion">개인업무</div>
	<div class="panel">
	</div>
<div class="accordion">오픈조</div>
	<div class="panel">
		<ul>
			<li>쇼케이스 점등</li>
			<li>POS기 켜기</li>
			<li>커피머신 켜기</li>
			<li>딸기 씻기</li>
		</ul>
	</div>

<div class="accordion" id="middleTeam">미들조</div>
	<div class="panel">
	</div>

<div class="accordion" id="closeTeam">마감조</div>
	<div class="panel">
	</div>

<script>
var acc = document.querySelectorAll(".accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}

$(".inline").css({
	"display":"inline"
});
</script>
</body>