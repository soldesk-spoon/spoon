<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/shop/member/login_action" method="post" name="logForm">
		<table>
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="MEMBER_ID" id="MEMBER_ID"></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD"></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="button" value="회원가입" onclick="document.location.href='/member/member_join'">
			</tr>
		</table>
	</form>
</body>
</html>