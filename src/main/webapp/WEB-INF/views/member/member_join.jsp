<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
var xhr;
function createXhr(){
    if(window.ActiveXObject){   // IE ��������
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        xhr = new XMLHttpRequest();
    }
}
 
function idcheck(){
    var MEMBER_ID = document.getElementById("MEMBER_ID").value;
    var CheckParam = document.getElementById("CheckParam").value;
    window.open(
    		"/shop/member/JoinIdCheck?MEMBER_ID="+MEMBER_ID+"&CheckParam="+CheckParam,
    		"EventFrame",
    		"menubar=no,width=430,height=360,toolbar=no"
    		);
}
</script>


</head>
<body>
	<form action="/shop/member/join_action" method="post">
	MEMBER_ID,MEMBER_EMAIL,MEMBER_PASSWORD
	<input type="hidden" id="CheckParam" name="CheckParam" value="0">
		<table>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"></td>
				<td><input type="button" id="IdCheck" name="IdCheck" value="�ߺ� Ȯ��" onclick="idcheck();">
		<tr>
				<td>��й�ȣ :</td>
				<td><input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD"></td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ�� :</td>
				<td><input type="password" id="MEMBER_PASSWORD2" name="MEMBER_PASSWORD2"></td>
			</tr>
			
			<tr>
				<td>�̸��� :</td>
				<td><input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL"></td>
			</tr>
			<tr>
				<td><input type="submit" value="����"></td>
			</tr>
		</table>

	</form>
</body>

</html>