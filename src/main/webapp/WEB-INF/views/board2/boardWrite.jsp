<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>

<body>
    <form id="frm" action="/shop/boardTwo/insertBoard.do" method="post">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="qna_subject" name="qna_subject" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="qna_contents" name="qna_contents"></textarea>
                    </td>
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
    	document.location.href="/shop/boardTwo/openBoardList.do";/*
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/shop/boardTwo/openBoardList.do' />");
        comSubmit.submit();*/
    }
     
    function fn_insertBoard(){
		var frm = document.getElementById("frm");
    	frm.submit();
       
    }
    </script>
</body>
</html>