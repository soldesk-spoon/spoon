<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<input type="hidden" id="fbid" name="fbid" value="${map.fbid }">
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.fbid }</td>
                
                <th scope="row">조회수</th>
                <td>${map.free_hits }</td>
            </tr>
            <tr>
            <th scope="row">작성자</th>
                <td>***추가해야됨<%-- ${map.free_hits } --%></td>
                <th scope="row">작성시간</th>
                <td>${map.free_created }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.free_subject }</td>
            </tr>
            <tr>
                <td colspan="4">${map.free_contents }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     <a href="#this" class="btn" id="delete">삭제하기</a>
     
     
    <%@ include file="../include/include-body.jsp" %>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
            
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_deleteBoard();
            });
        });
         
        function fn_openBoardList(){
        	document.location.href="/shop/freeboard/openBoardList.do";
        }
         
        function fn_openBoardUpdate(obj){
        	var B = ${map.fbid};
            document.location.href="/shop/freeboard/openBoardUpdate.do?fbid="+B;
            /*
            var fbid = "${map.fbid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("fbid", fbid);
            comSubmit.submit();*/
        }
        
        function fn_deleteBoard(){
        	var B = ${map.fbid};
            document.location.href="/shop/freeboard/deleteBoard.do?fbid="+B;
            /*
        	var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
            comSubmit.addParam("BID", $("#BID").val());
            comSubmit.submit();
             */
        }
    </script>
</body>
</html>