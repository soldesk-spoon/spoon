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
    var id = document.getElementById("MEMBER_ID").value;
    var queryString = "select count(member_id) from spoon_member where member_id =  "+id;
    if(id.length<6){
        document.getElementById("idcheckLayer").innerHTML = "<font color=red>6�ڸ� �̻� �Է��ϼ���.</font>";    
    }else{
        // 1. XMLHttpReqeust ��ü ����
        createXhr();
        // 2. �̺�Ʈ �ڵ鷯 ���
        xhr.onreadystatechange = callback;  // callback �Լ��� ���
        // 3. open()�� ���� ��û���� ������ ����
        xhr.open("POST", "/JoinIdCheckController", true);
        // 4. Header�� contentType ���� - post
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // 5. send()�� ���� ��û
        xhr.send(queryString);  // ��û ������ �����ش�.
    }
}
function callback(){
    if(xhr.readyState==4){      // ������ �� ���� ���
        if(xhr.status == 200){  // �����ڵ尡 200�� ��� - ������ ���
            var resTxt = xhr.responseText;  // ������ ���� ���� text
            //alert(resTxt);
            document.getElementById("idcheckLayer").innerHTML = resTxt;        
        }else{
            alert("��û ó���� ���������� ���� �ʾҽ��ϴ�.\n"+xhr.status);
        }
    }
}
</script>


</head>
<body>
	<form action="/shop/member/join_action" method="post">
	MEMBER_ID,MEMBER_EMAIL,MEMBER_PASSWORD
		<table>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" onkeyup="idcheck();"></td>
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