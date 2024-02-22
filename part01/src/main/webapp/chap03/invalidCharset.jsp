<!-- 캐릭터 셋을 올바르게 입력하지 않으면 응답 결과에서 글자가 올바르게 출력이 되지 않는 예 -->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=iso-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
	<%Date now = new Date(); %>
	현재시각 : <%= now %>
</body>
</html>