<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp"%>
</head>

<body>
	<%@ include file="../include/include-session.jsp"%>
	<form id="frm" action="/spoon/sample/insertBoard.do" method="post"
		name="frm" enctype="multipart/form-data">
		<c:if test="${bid eq null}">
			<input type="hidden" id="bid" name="bid" value="1" >		
		</c:if>
		<c:if test="${bid ne null}">
			<input type="hidden" id="bid" name="bid" value="${bid}">
		</c:if>
		
		<input type="hidden" id="input_lat" name="input_lat"value="${input_lat}"> 
		<input type="hidden" id="input_lng"name="input_lng" value="${input_lng}"> 
		<input type="hidden" id="rest" name="rest" value="${rest}"> 
		<input type="hidden" id="address" name="address" value="${address}">
		<input type="hidden" name="session_mid" id="session_mid" value=""> 
		<input	type="hidden" name="session_member_id" id="session_member_id" value=""> 
		<input type="hidden" name="subway_linenumber1" id="subway_linenumber1" value="${subway_linenumber}">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="board_subject" name="board_subject"
						class="wdp_90" value="${board_subject}"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="board_contents" name="board_contents">${board_contents}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" name="file1" id="file1">
						<input type="file" name="file1" id="file1">
						<input type="file" name="file1" id="file1">
						
					</td>
					
				</tr>			
				<tr>
					<td><select id="subway_linenumber" onChange="onsubSelect();">
							<option value="1" ${subway_linenumber eq  "1" ? "selected" :""}>1호선</option>
							<option value="2" ${subway_linenumber eq  "2" ? "selected" :""}>2호선</option>
							<option value="3" ${subway_linenumber eq  "3" ? "selected" :""}>3호선</option>
							<option value="4" ${subway_linenumber eq  "4" ? "selected" :""}>4호선</option>
							<option value="5" ${subway_linenumber eq  "5" ? "selected" :""}>5호선</option>
							<option value="6" ${subway_linenumber eq  "6" ? "selected" :""}>6호선</option>
							<option value="7" ${subway_linenumber eq  "7" ? "selected" :""}>7호선</option>
							<option value="8" ${subway_linenumber eq  "8" ? "selected" :""}>8호선</option>
							<option value="9" ${subway_linenumber eq  "9" ? "selected" :""}>9호선</option>
							<option value="K" ${subway_linenumber eq  "K" ? "selected" :""}>경의중앙선</option>
							<option value="A" ${subway_linenumber eq  "A" ? "selected" :""}>공항철도</option>
							<option value="G" ${subway_linenumber eq  "G" ? "selected" :""}>경춘선</option>
							<option value="B" ${subway_linenumber eq  "B" ? "selected" :""}>분당선</option>
							<option value="SU" ${subway_linenumber eq  "SU" ? "selected" :""}>수인선</option>
							<option value="U" ${subway_linenumber eq  "U" ? "selected" :""}>의정부경전철</option>
							<option value="KK" ${subway_linenumber eq  "KK" ? "selected" :""}>경강선</option>
							<option value="I" ${subway_linenumber eq  "I" ? "selected" :""}>인천1호선</option>
							<option value="S" ${subway_linenumber eq  "S" ? "selected" :""}>신분당선</option>
							<option value="E" ${subway_linenumber eq  "E" ? "selected" :""}>용인경전철</option>
							<option value="I2" ${subway_linenumber eq  "I2" ? "selected" :""}>인천2호선</option>



					</select> <c:if test="${!empty subList}">
							<select name="subway_name" id="subway_name">
								<c:forEach var="subList" items="${subList}" varStatus="i">
									<option id="subway_name" value="${subList.subway_name}">${subList.subway_name}</option>
								</c:forEach>
							</select>
						</c:if></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="지도 입력" id="mapview" name="mapview"
			onclick="mapviewOpen();">
			 <a href="#this" class="btn" id="write">작성하기</a> <a href="#this" class="btn" id="list">목록으로</a>
	</form>

	<%@ include file="../include/include-body.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
        });
         
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
        	document.getElementById('session_mid').value = document.getElementById('mid').value;
        	document.getElementById('session_member_id').value = document.getElementById('member_id').value;
            fn_insertBoard();
        });
    });
     
    function fn_openBoardList(){
    	document.location.href="/spoon/sample/openBoardList.do";/*
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/spoon/sample/openBoardList.do' />");
        comSubmit.submit();*/
    }
     
    function fn_insertBoard(){
		var frm = document.getElementById("frm");
    	frm.submit();
       
    }
    </script>

	<script type="text/javascript">
    	function onsubSelect(){
    		var frm = document.getElementById('frm');
    		var subway_linenumber = document.getElementById('subway_linenumber').value;
    		frm.action="/spoon/sample/openBoardWrite.do?subway_linenumber="+subway_linenumber;
    		frm.submit();
    		
    	}
    	
    	function mapviewOpen(){
    		 window.open(
    		    		"/spoon/sample/board/map.do",
    		    		"EventFrame",
    		    		"menubar=no,width=900,height=550,toolbar=no"
    		    		);
    	}
    	
    	
    	
  
    </script>
</body>
</html>