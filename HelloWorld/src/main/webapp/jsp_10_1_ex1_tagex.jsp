<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int i = 0;
	while (true) {
		i++;
		out.println("2 * " + i + " = " + (2 * i) + "<br>");
	%>
	+++++++++++++++++
	<br>

	<%
	if (i >= 9)
		break;
	}
	%>
	<br>
	<br>

	<!-- 전역 변수 -->

	<%
	out.println("i = " + i + "<br>");
	out.println("str = " + str + "<br>");
	out.println("sum = " + sum(1, 9) + "<br>");
	%>

	<%!int i = 10;
	String str = "ABCDEF";%>

	<%!public int sum(int x, int y) {
		return x + y;
	}%>


	<br>
	<br>
	<!-- 하나씩만 표현 가능 -->
	<%=i%><br>
	<%=str%><br>
	<%=sum(1, 10)%><br>


	<%
	int j = 20;
	String a = "aaaa";
	%>

	<br>
	<br>
	<%
	out.println("j = " + j + "<br>");
	out.println("a = " + a + "<br>");
	%>










</body>

</html>