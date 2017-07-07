<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.text.*" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
request.setCharacterEncoding("UTF-8"); 

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
</head>

<c:url var="insertUrl" value="/DoWriteBoard.do"/>
<sf:form modelAttribute="boardBeanObjToWrite" method="POST" action="${insertUrl}">
<table width="400" border="1" cellspacing="0" cellpadding="5">
<tr>
<td><b>이름</b></td>
<td><sf:input path="member_id" size="50" maxlength="50"/><br/>
<sf:errors path="member_id" cssClass="error"/></td>
</tr>
 
<tr>
<td><b>제목</b></td>
<td><sf:input path="board_subject" size="50" maxlength="50"/><br/>
<sf:errors path="board_subject" cssClass="error"/></td>
</tr>

<tr>
<td><b>내용</b></td>
<td><sf:textarea path="board_contents" size="200" cssStyle="width:350px;height:100px;" maxlength="200"/><br/>
<sf:errors path="board_contents" cssClass="error"/></td>
</tr>

<tr>
<td><input type="submit" value="등록"/></td>
</tr>
</table>
</sf:form>
<!-- 
<body>
</body>
 -->
</html>