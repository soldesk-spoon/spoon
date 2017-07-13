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
    
    var id_pattern = new RegExp('[^a-zA-Z0-9]'); //아이디 패턴검사 정규식
    //아이디 값이 없거나 아이디가 유효한게 아니면
    if (id_pattern.test(document.getElementById("MEMBER_ID").value)) {
      alert("아이디를 영문자와 숫자로 입력해 주세요.");
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
	
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	 var MEMBER_EMAIL = form.member;
	 if (!re.test(form.MEMBER_EMAIL.value)) {
	 alert("올바른 이메일 주소를 입력하세요");
	 return false;
	 }
	
	
	form.submit();

}


function fnChkByte(obj) {
  
	 document.getElementById("CheckParam").value = '0';
	var maxByte = 10; //최대 입력 바이트 수
    var str = obj.value;
    var str_len = str.length;
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
    

    var id_pattern = new RegExp('[^a-zA-Z0-9]'); //아이디 패턴검사 정규식
    //아이디 값이 없거나 아이디가 유효한게 아니면
    if (id_pattern.test(str)) {
    	 document.getElementById("MEMBER_ID").value = "";
		 document.getElementById("MEMBER_ID").focus();
      return false;
    }

 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
 
    if (rbyte > maxByte) {
        alert("영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, rlen); //문자열 자르기
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
				<td>아이디 :</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"  onkeyup="fnChkByte(this);"></td>
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