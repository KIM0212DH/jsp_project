<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="testId"></c:out>
	<c:out value="testPw"></c:out>

	<c:url var="pageUrl" value="jstlRedirectFrom.jsp"></c:url>
	<p>
		생성된 url:
		<c:out value="${pageUrl }"></c:out>
	</p>

</body>
</html>