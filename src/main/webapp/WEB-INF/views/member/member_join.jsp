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


function checkValue()
{
	var form = document.joinAction;

	if(!form.MEMBER_ID.value){
		alert("���̵� �Է��ϼ���.");
		return false;
	}
	
	if(form.CheckParam.value != "1"){
		alert("���̵� �ߺ�üũ�� ���ּ���.");
		return false;
	}
	
	if(!form.MEMBER_PASSWORD.value){
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	}
	
	// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
	if(form.MEMBER_PASSWORD.value != form.MEMBER_PASSWORD2.value ){
		alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
		return false;
	}	
	
	
	if(!form.MEMBER_EMAIL.value){
		alert("���� �ּҸ� �Է��ϼ���.");
		return false;
	}
	
	form.submit();

}

</script>


</head>
<body>
	<form action="/shop/member/join_action" method="post" name="joinAction">
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
				<td><input type="button" value="����" onclick="checkValue();"></td>
			</tr>
		</table>

	</form>
</body>

</html>