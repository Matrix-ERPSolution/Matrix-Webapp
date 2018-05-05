<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배정할 업무를 선택하세요</title>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.ui-autocomplete-category {
	font-weight: bold;
	padding: .2em .4em;
	margin: .8em 0 .2em;
	line-height: 1.5;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script>
	$(function() {
		$(".accordion").accordion({'collapsible':true,'active':false});
	});
	$(function() {
		$(".subAccordion").accordion({
			icons : {
				"header" : "ui-icon-plus",
				"activeHeader" : "ui-icon-minus",
			}
		});
	});
	$( function() {
	    $.widget( "custom.catcomplete", $.ui.autocomplete, {
	      _create: function() {
	        this._super();
	        this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
	      },
	      _renderMenu: function( ul, items ) {
	        var that = this,
	          currentCategory = "";
	        $.each( items, function( index, item ) {
	          var li;
	          if ( item.category != currentCategory ) {
	            ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
	            currentCategory = item.category;
	          }
	          li = that._renderItemData( ul, item );
	          if ( item.category ) {
	            li.attr( "aria-label", item.category + " : " + item.label );
	          }
	        });
	      }
	    });
	    var data = [
	      { label: "anders", category: "" },
	      { label: "annhhx10", category: "Products" },
	      { label: "annttop C13", category: "Products" },
	      { label: "andreas andersson", category: "People" },
	      { label: "andreas johnson", category: "People" },
	      { label: "홀 - 쓰레기통 비우기", category: "청소" },
	      { label: "주방 - 음식물 쓰레기 버리기", category: "청소" },
	      { label: "주방 - 행주 소독", category: "청소" }
	    ];
	  $( "#search" ).catcomplete({
	      delay: 0, source: data
	    });
	  } );


</script>
<body>
<h2>5월 3일(목)</h2>
<hr size="2px" width="300px" align="left" color="black">
<h2>업무 배정</h2>
<hr size="2px" width="300px" align="left" color="black">
<div id="taskFromRecommend ">
<h4>오늘의 추천업무</h4>
			<div class="accordion" style="width: 250pt; margin-left: -15pt;">
				<h3>청결관리</h3>
				<div>
						<table style="width: 240pt; margin-left: -20pt;">
							<tr>
								<td align="left">쇼케이스 얼룩 제거</td>
								<td>D-1</td>
							</tr>
							<tr>
								<td align="left">아이스크림 기계 청소</td>
								<td>D-7</td>
							</tr>
							<tr>
								<td align="left">냉장고 성에 제거</td>
								<td>D-9</td>
							</tr>
							
						</table>					
				</div>
			<h3>재고관리</h3>
				<div>
						<table style="width: 240pt; margin-left: -20pt;">
							<tr>
								<td align="left">원두 재고 점검</td>
								<td>D-2</td>
							</tr>
							<tr>
								<td align="left">컵 재고 점검</td>
								<td>D-3</td>
							</tr>
							
						</table>	
				</div>
			<h3>시재관리</h3>
				<div>
						<table style="width: 240pt; margin-left: -20pt;">
							<tr>
								<td align="left">영업 준비금 환전</td>
								<td>D-1</td>
							</tr>
							
						</table>	
				</div>				
			</div>
	</div>
	<!-- id="taskFromRecommend" area end -->
	
	<hr size="2px" width="300px" align="left" color="black">
	<div>
		<h4>매뉴얼에서 선택하기</h4>
		<div id="taskSearchFromManual">
			<input id="search" type="text" placeholder="업무 목록 검색">
			<i class="fa fa-plus-square-o" aria-hidden="true"></i>
		</div>
		<div class="accordion" style="width: 250pt; margin-left: -15pt;">
			<h3>시재관리</h3>
			<div>시재관리 디테일 여기에</div>
		
			<h3>재고관리</h3>
			<div>재고관리 디테일 여기에</div>
		
			<h3>청소</h3>
			<div class="subAccordion">
				<div>주방</div>
				<table>
					<tr>
						<td>음식물 쓰레기 버리기</td>
						<td>마감 시</td>
					</tr>
					<tr>
						<td>싱크대 닦기</td>
						<td>마감 시</td>
					</tr>
					<tr>
						<td>행주 소독</td>
						<td>마감 시</td>
					</tr>
					<tr>
						<td>냉장고 성에 제거</td>
						<td>1개월</td>
					</tr>
				</table>
				<div>홀</div>
				<table>
					<tr>
						<td>바닥 대걸레 청소</td>
						<td>오픈 시</td>
					</tr>
					<tr>
						<td>쓰레기통 비우기</td>
						<td>마감 시</td>
					</tr>
				</table>
				<div>화장실</div>
				<table>
					<tr>
						<td>남자화장실 핸드타월 갈기</td>
						<td>일주일</td>
					</tr>
				</table>
			</div> <!-- end subAccordion -->
		</div> <!-- end accordion -->
	</div>
	<!-- id="taskFromManual" area end -->
	
	<hr size="2px" width="300px" align="left" color="black">
	<div>
		<h4>직접 입력하기</h4>
		<div id="taskTyping">
		<input type="text"  placeholder="일시적 업무 입력">
		<i class="fa fa-plus-square-o" aria-hidden="true"></i>
		</div>
	</div>
	<!-- id="taskFromManual" area end -->
	
	<hr size="2px" width="300px" align="left" color="black">
	<div class="ui-widget" style="margin-top:2em; font-family:Arial">
 		 배정할 업무 목록:
		<div id="log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
	</div>
	<!-- 배정할 업무 목록 area end -->
	
	<hr size="2px" width="300px" align="left" color="black">	
	<p>총 3가지 업무를 배정합니다.
	<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
	</p>
</body>
</html>