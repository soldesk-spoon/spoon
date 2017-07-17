<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글목록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
<input type="button" value="${map.bid}">
	<h4>댓글</h4>
	
	
	<table>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
				
					<tr>
					<c:if test="${row.ref eq 1}"><td>&nbsp;&nbsp;</td></c:if>
					<td>${row.member_id }</td>
					
						<td>${row.comment_created }</td>
					</tr>
					<tr>
						<td>${row.comment }<input type="hidden" id="bid"
							value="${row.bid }">
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<form>
		<input type="text">
	</form>

</body>
</html>