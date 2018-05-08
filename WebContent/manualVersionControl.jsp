<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>manualVersionControl</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>

  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>
 
<div id="manualVersion" class="ui-widget">
  <h2>버전별 매뉴얼 관리</h2>
  <table id="users" class="ui-widget ui-widget-content">
    <thead>
      <tr class="ui-widget-header ">
        <th>버전명</th>
        <th>마지막 수정 날짜</th>
        <th>기본으로 설정</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>여름시즌</td>
        <td>2017.05.10</td>
        <td>체크아이콘</td>
        <td>수정아이콘</td>
        <td>삭제아이콘</td>
      </tr>
      <tr>
        <td>겨울시즌</td>
        <td>2016.02.17</td>
        <td>체크아이콘</td>
        <td>수정아이콘</td>
        <td>삭제아이콘</td>
      </tr>
      <tr>
        <td>초기</td>
        <td>2010.01.31</td>
        <td>체크아이콘</td>
        <td>수정아이콘</td>
        <td>삭제아이콘</td>
      </tr>
    </tbody>
  </table>
</div>
 
 
</body>
</html>