<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	font-size: 16px;
	font-family: Consolas, sans-serif;
}

fieldset {
	width: 40%;
	display: flex;
	flex-direction: column;
	gap: 1px
}

.fieldset-container {
	display: flex;
	flex-direction: column;
	gap: 2px;
}
</style>
</head>
<body>
	<section class="fieldset-container">
		<fieldset>
			<legend>post ex</legend>
			<a href="http://localhost:8080/HelloWorld/login.jsp">login.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>init param, context param ex</legend>
			<a href="http://localhost:8080/HelloWorld/paramex.jsp">paramex.jsp</a>
			<a href="http://localhost:8080/HelloWorld/paramex2.jsp">paramex2.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>request & response ex</legend>
			<a href="jsp_11_1_ex1_request/jsp_11_1_ex1_requestParamForm.jsp">jsp_11_1_ex1_requestParamForm.jsp</a>
			<a href="jsp_11_2_ex1_response/jsp_11_2_ex1_responseForm.jsp">jsp_11_2_ex1_responseForm.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>action tag ex</legend>
			<a href="jsp_12_2_ex1_actiontagex/forwardMain.jsp">forWardMain.jsp</a>
			<a href="jsp_12_2_ex1_actiontagex/forwardParam.jsp">forWardParam.jsp</a>
			<a href="jsp_12_2_ex1_actiontagex/include01.jsp">include01.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>cookie login logout ex</legend>
			<a href="jsp_13_2_ex1_cookieex/login.jsp">login.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>session login logout ex</legend>
			<a href="jsp_14_2_ex1_sessionex/login.jsp">login.jsp</a>
		</fieldset>
		<br>
		<fieldset>
			<legend>exception ex</legend>
			<a href="jsp_15_2_ex1_exceptionex/generateError.jsp">generateError.jsp</a>
			<a href="jsp_15_2_ex1_exceptionex/notExist.jsp">notExist.jsp -> generateErrorXML.jsp</a>
		</fieldset>
		<fieldset>
			<legend>java bean ex</legend>
			<a href="jsp_16_2_ex1_beanex/member.jsp">member.jsp</a>
		</fieldset>
		<br>
	</section>

</body>
</html>