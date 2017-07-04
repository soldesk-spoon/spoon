<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function Idcheckparam(){
		var CheckParam1 = document.getElementById('CheckParam1').value;
		
			if(CheckParam1==1){
				
				window.opener.document.joinAction.CheckParam.value = "1";
		} 
			window.close();
	}

</script>
</head>
<body>
	<table>
		<tr>
			<td>${MEMBER_INFO}</td>
			<td>${pop_button}</td>
			<td>${CheckParam}</td>
		</tr>
	</table>
</body>
</html>