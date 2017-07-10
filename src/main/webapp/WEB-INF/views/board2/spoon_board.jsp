<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	BID, MID, BOARD_SUBJECT , BOARD_CONTENTS, BOARD_IMAGE, BOARD_LIKE,
	BOARD_HATE, MEMBER_ID, BOARD_CREATED, BOARD_UPDATED, BOARD_DELYN,
	BOARD_HITS


	<table width="95%" align="center" bgcolor="#FFFF99" border="1">


		<tr bgcolor="#996600">


			<td colspan="2" align="center"><font color="#FFFFFF"> 등록</font></td>
		</tr>

		<tr>
			<td align="center">제목</td>
			<td align="left"><input type="text" name="BOARD_SUBJECT"
				id="BOARD_SUBJECT" size=20></td>
		</tr>
		<tr>
			<td align="center">작성자</td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea rows="10" cols="45" id="" name="BOARD_"></textarea></td>
		</tr>
		<tr>
			<td align="center">상품수량</td>
			<td align="left"><input type="text" id="" name="stock" size=10>개</td>
		</tr>
		<tr>
			<td align="center">상품이미지</td>
			<td align="left"><input type="file" name="image"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시쓰기"></td>
		</tr>

	</table>
	</form>
	</td>
	</tr>
	</table>

</body>
</html>