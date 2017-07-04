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
    if(window.ActiveXObject){   // IE 이전버전
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
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(form.CheckParam.value != "1"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if(!form.MEMBER_PASSWORD.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(form.MEMBER_PASSWORD.value != form.MEMBER_PASSWORD2.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}	
	
	
	if(!form.MEMBER_EMAIL.value){
		alert("메일 주소를 입력하세요.");
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
				<td>아이디 :</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"></td>
				<td><input type="button" id="IdCheck" name="IdCheck" value="중복 확인" onclick="idcheck();">
		<tr>
				<td>비밀번호 :</td>
				<td><input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD"></td>
			</tr>
			<tr>
				<td>비밀번호 확인 :</td>
				<td><input type="password" id="MEMBER_PASSWORD2" name="MEMBER_PASSWORD2"></td>
			</tr>
			
			<tr>
				<td>이메일 :</td>
				<td><input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL"></td>
			</tr>
			<tr>
				<td><input type="button" value="가입" onclick="checkValue();"></td>
			</tr>
		</table>

	</form>
</body>

</html>