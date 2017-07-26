<%@page import="com.my.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.menu {
		padding-left: 80%
	}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function logout() {
		var member_id = document.getElementById('member_id').value;
		document.location.href = "/spoon/include/include-sessionLogout?member_id="+member_id;

	}
</script>

<script type="text/javascript">
	function login_check(){
		var member_id = document.getElementById('MEMBER_ID').value;
		var member_password = document.getElementById('MEMBER_PASSWORD').value;
		
		if(member_id== ""){
			alert("아이디를 입력하세요 ");
			return false;
		}
		if(member_password==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		document.logForm.submit();
		
	}
	
	function getList() {
		document.location.href="/shop/sample/openBoardList.do";
	}
</script>



</head>
<body>
	<input type="hidden" id="hidden_mid" name="hidden_mid" value="${sessionScope.member.mid }"> 
	<form action="/spoon/member/login_action" name="logForm" method="post" >
		<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }"> 
		<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member.member_id}">
		<c:if test="${sessionScope.member.mid  ne null}">
			${sessionScope.member.member_id} 환영합니다. 
			<input type="button" value="로그아웃" onclick="logout();">
			<input type="button" value="목록보기" onclick="getList();">
		</c:if>
		
		<c:if test="${sessionScope.member.mid eq null}">
		${sessionScope.member.alert}
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
				<td><input type="button" value="로그인" onclick="login_check();"></td>
				<td><input type="button" value="회원가입" onclick="document.location.href='/shop/member/member_join'">
			</tr>
		</table>
		</c:if>
	</form>
	<div class="menu" id="menu" >
		<form id="menuForm" name="menuForm">
			<!-- qna, 자유게시판, 내정보 -->
			<input type="button" id="QnA" name="QnA" value="Q&A" onclick="QnA_page()">
			<input type="button" id="free" name="free" value="자유게시판" onclick="free_page()" >
			<input type="button" id="my" name="my" value="내정보" onclick="my_page()">
		</form>
	</div>
	
</body>

<script type="text/javascript">
	var hidden_mid = document.getElementById('hidden_mid');
	
	function QnA_page() {
		document.location.href="/spoon/QnA_board/openBoardList.do";
	}

</script>

</html>