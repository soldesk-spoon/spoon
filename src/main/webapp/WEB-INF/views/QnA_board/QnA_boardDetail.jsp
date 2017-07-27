<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<input type="hidden" id="qid" name="qid" value="${map.qid }">
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
                <td>${map.qid }</td>
                
                <th scope="row">조회수</th>
                <td>${map.qna_hits }</td>
            </tr>
            <tr>
            <th scope="row">작성자</th>
                <td>***추가해야됨<%-- ${map.qna_hits } --%></td>
                <th scope="row">작성시간</th>
                <td>${map.qna_created }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.qna_subject }</td>
            </tr>
            <tr>
                <td colspan="4">${map.qna_contents }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     <a href="#this" class="btn" id="delete">삭제하기</a>
     
     <table>
     	<tr>
     		<td>답변 : </td>
     		<c:if test="${resultString eq null}">
     			${resultString}
     			<form name="answerForm" id="answerForm" method="post" action="/spoon/QnA_board/insertAnswer.do">
     			<input type="hidden" id="qid" name="qid" value="${map.qid }">
     			<textarea cols="2" rows="10" id="answer" name="answer" ></textarea>
     			<input type="button" id="answerbtn" name="answerbtn" value="답변 작성 " onclick="insertAnswer();">
     			</form>
     		</c:if>
     		<c:if test="${resultString ne null}">
     			${answerMap.answer}
     		</c:if>
     	</tr>
     </table>
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
        	document.location.href="/spoon/QnA_board/openBoardList.do";
        }
         
        function fn_openBoardUpdate(obj){
        	var B = ${map.qid};
            document.location.href="/spoon/QnA_board/openBoardUpdate.do?qid="+B;
            /*
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();*/
        }
        
        function fn_deleteBoard(){
        	var B = ${map.qid};
            document.location.href="/shop/QnA_board/deleteBoard.do?qid="+B;
            /*
        	var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
            comSubmit.addParam("BID", $("#BID").val());
            comSubmit.submit();
             */
        }
        
        function insertAnswer() {
        	
        }
        
    </script>
</body>
</html>