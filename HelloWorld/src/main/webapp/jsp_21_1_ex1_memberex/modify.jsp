<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String loginId;
	String loginPw;
	%>
	<%
	loginId = (String)session.getAttribute("memberId");
	loginPw = (String)session.getAttribute("memberPw");
	%>
	
	<h2><%=loginId%>의 정보를 수정합니다.</h2>
	
	<form action="modifyOk.jsp" method="post">
        <label for="password">기존 비밀번호:</label>
        <input type="password" id="password" name="password" placeholder="기존 비밀번호 입력"><br><br>
        <label for="password">새로운 비밀번호:</label>
        <input type="password" id="newpassword" name="newpassword" placeholder="새로운 비밀번호 입력"><br><br>
        <label for="password">새로운 비밀번호 확인:</label>
        <input type="password" id="newpasswordcheck" name="newpasswordcheck" placeholder="새로운 비밀번호 입력"><br><br>
        <label for="phonenum">새로운 전화번호:</label>
        <input type="text" id="newphonenum" name="newphonenum" placeholder="새로운 전화번호 입력"><br><br>
		<input type="submit" value="수정">
			
    </form>
</body>
</html>