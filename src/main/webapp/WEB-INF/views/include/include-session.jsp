<%@page import="com.my.member.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	function logout(){
		var user_id = document.getElementById('user_id').value;
		document.location.href="/shop/include/include-session?user_id="+user_id;
		
	}

</script>
</head>
<body>
<form action="GET">
<c:if test="${user_id  ne null }">
<input type="hidden" id="user_id" name="user_id" value="${user_id}">
${user_id}님 환영합니다.
<input type="button" value="로그아웃" onclick="logout();">
</c:if>
<c:if test="${user_id eq null}">
<input type="button" onclick="document.location.href='/shop/member/login'" value="로그인">
</c:if>
</form>
</body>
</html>