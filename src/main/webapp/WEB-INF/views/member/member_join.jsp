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
    
    var id_pattern = new RegExp('[^a-zA-Z0-9]'); //���̵� ���ϰ˻� ���Խ�
    //���̵� ���� ���ų� ���̵� ��ȿ�Ѱ� �ƴϸ�
    if (id_pattern.test(document.getElementById("MEMBER_ID").value)) {
      alert("���̵� �����ڿ� ���ڷ� �Է��� �ּ���.");
      document.getElementById("MEMBER_ID").value = "";
      document.getElementById("MEMBER_ID").focus();
      return false;
    }
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
	
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	 var MEMBER_EMAIL = form.member
	 if (!re.test(document.join.MEMBER_EMAIL.value)) {
	 alert("�ùٸ� �̸��� �ּҸ� �Է��ϼ���")
	 return false;
	 }
	
	
	form.submit();

}


function fnChkByte(obj) {
  
	 document.getElementById("CheckParam").value = '0';
	var maxByte = 10; //�ִ� �Է� ����Ʈ ��
    var str = obj.value;
    var str_len = str.length;
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
    

    var id_pattern = new RegExp('[^a-zA-Z0-9]'); //���̵� ���ϰ˻� ���Խ�
    //���̵� ���� ���ų� ���̵� ��ȿ�Ѱ� �ƴϸ�
    if (id_pattern.test(str)) {
    	 document.getElementById("MEMBER_ID").value = "";
		 document.getElementById("MEMBER_ID").focus();
      return false;
    }

 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //�ѱ�2Byte
        } else {
            rbyte++; //���� �� ������ 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return�� ���ڿ� ����
        }
    }
 
    if (rbyte > maxByte) {
        alert("���� " + maxByte + "�ڸ� �ʰ� �Է��� �� �����ϴ�.");
        str2 = str.substr(0, rlen); //���ڿ� �ڸ���
        obj.value = str2;
        fnChkByte(obj, maxByte);
    } else {
    }
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
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"  onkeyup="fnChkByte(this);"></td>
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