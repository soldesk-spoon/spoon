<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function login_check(){
		var member_id = document.getElementById('MEMBER_ID').value;
		var member_password = document.getElementById('MEMBER_PASSWORD').value;
		
		if(member_id== ""){
			alert("���̵� �Է��ϼ��� ");
			return false;
		}
		if(member_password==""){
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
		
		document.logForm.submit();
		
	}
</script>
</head>
<body>
	${alert}
	<form action="/shop/member/login_action" method="post" name="logForm">
		<table>
			<tr>
				<td>���̵� : </td>
				<td><input type="text" name="MEMBER_ID" id="MEMBER_ID"></td>
			</tr>
			<tr>
				<td>��й�ȣ : </td>
				<td><input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD"></td>
			</tr>
			
			<tr>
				<td><input type="button" value="�α���" onclick="login_check();"></td>
				<td><input type="button" value="ȸ������" onclick="document.location.href='/shop/member/member_join'">
			</tr>
		</table>
	</form>
</body>
</html>