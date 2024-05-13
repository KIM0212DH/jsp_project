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
<c:url var="pageUrl" value="jstlRedirectTo.jsp"></c:url>
<p>생성된 url: <c:out value="${pageUrl }"></c:out></p>

<%-- <c:redirect url="https://www.naver.com"></c:redirect> --%>
<c:redirect url="${pageUrl}">
	<c:param name="userId" value="testId"></c:param>
	<c:param name="userPw" value="testPw"></c:param>
</c:redirect>
</body>
</html>