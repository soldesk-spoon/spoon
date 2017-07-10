<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>

<body>
    <form id="frm" action="/shop/sample/insertBoard.do" method="post">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="board_subject" name="board_subject" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="board_contents" name="board_contents"></textarea>
                    </td>
                </tr>
                <tr>
                	<td>
                		<select id="subway_linenumber" onChange="onsubSelect();" >
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
                		      		
                		
                			               		
                		</select>
                			<c:if test="${!empty subList}">
                				<select name="subway_name" id="subway_name">
                					<c:forEach var="subList" items="${subList}" varStatus="i">
                						<option id="subway_name" value="${subList.subway_name}">${subList.subway_name}</option>
                					</c:forEach>
                				</select>
                			</c:if>
                		
                	</td>
                	<td></td>
                </tr>
            </tbody>
        </table>
         
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
     
    <%@ include file="../include/include-body.jsp" %>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
        });
         
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertBoard();
        });
    });
     
    function fn_openBoardList(){
    	document.location.href="/shop/sample/openBoardList.do";/*
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/shop/sample/openBoardList.do' />");
        comSubmit.submit();*/
    }
     
    function fn_insertBoard(){
		var frm = document.getElementById("frm");
    	frm.submit();
       
    }
    </script>
    
    <script type="text/javascript">
    	function onsubSelect(){
    		var subway_line = document.getElementById('subway_linenumber').value;
    		document.location.href = "/shop/sample/openBoardWrite.do?subway_linenumber="+subway_line;
    		
    	}
    
    </script>
</body>
</html>