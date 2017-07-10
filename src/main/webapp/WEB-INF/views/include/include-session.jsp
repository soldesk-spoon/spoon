<%@page import="com.my.member.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	function logout(){
		var member_id = document.getElementById('member_id').value;
		document.location.href="/shop/include/include-sessionLogout?member_id="+member_id;
		
	}

</script>
</head>
<body>
<form action="GET">
<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }">
<input type="hidden" id="member_id" name="member_id"value="${sessionScope.member.member_id}">
<c:if test="${sessionScope.member.member_id  ne null }">

${sessionScope.member.member_id} 환영합니다. 

<input type="button" value="로그아웃" onclick="logout();">
</c:if>
<c:if test="${sessionScope.member.member_id eq null}">
<input type="button" onclick="document.location.href='/shop/member/login'" value="로그인">
</c:if>
</form>
</body>
</html>