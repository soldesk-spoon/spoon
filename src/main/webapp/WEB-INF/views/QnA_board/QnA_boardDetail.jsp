<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<%@ include file="../include/include_logo.jsp" %>
<%@ include file="../include/include-session.jsp" %>
<input type="hidden" id="qid" name="qid" value="${map.qid }">
<input type="hidden" id="mid1" name="mid1" value="${map.mid}">
<input type="hidden" id="adminNY" name="adminNY" value="${adminNY}">
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
                <td>${map.member_id}</td>
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
     <div class="board_view">
     <div style="padding-top: 3px;">
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     <a href="#this" class="btn" id="delete">삭제하기</a>
     </div>
     </div>
     <br><br>
     <table class="board_view">
     	<tr>
     		<td>
     		<c:if test="${adminNY eq 'N'}">
     			<c:if test="${map.qna_comment eq null}">
     				답변이 없습니다.
     			</c:if>
     			<c:if test="${map.qna_comment ne null}">
     				${map.qna_comment}
     			</c:if>
     		</c:if>
     		<c:if test="${adminNY eq 'Y'}">
     			<c:if test="${map.qna_comment eq null}">
     				<form name="commentForm" id="commentForm" method="post" action="/spoon/QnA_board/insertComment.do">
     				<input type="hidden" id="qid" name="qid" value="${map.qid }">
     				<textarea cols="100" rows="2" id="comment" name="comment" ></textarea>
     				<input type="button" id="commentbtn" name="commentbtn" value="답변 작성 " onclick="insertComment();">
     				</form>
     			</c:if>
     			<c:if test="${map.qna_comment ne null}">
     				${map.qna_comment }
     				<br><br>&nbsp;&nbsp;&nbsp;
     				<input type="button" value="삭제하기" onclick="deleteComment();">
     			</c:if>
     		</c:if>
     		</td>
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
                
            	var mid = document.getElementById('mid').value;
           		var mid1 = document.getElementById('mid1').value;
           		var adminNY = document.getElementById('adminNY').value;
           		if(adminNY == 'N'){
           			if(mid != mid1){
                		alert("삭제 권한이 없습니다.");
                		return false;
                	}
           		}
            	
            	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
            		e.preventDefault();
                    fn_deleteBoard();
            	}else{   //취소
            	    return;
            	}
            	
            });
        });
         
        function fn_openBoardList(){
        	document.location.href="/spoon/QnA_board/d";
        }
         
        function fn_openBoardUpdate(obj){
        	var B = ${map.qid};
            var mid = document.getElementById('mid').value;
       		var mid1 = document.getElementById('mid1').value;
        	
        	if(mid != mid1){
        		alert("수정권한이 권한이 없습니다.");
        		return false;
        	}
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
            document.location.href="/spoon/QnA_board/deleteBoard.do?qid="+B;
            /*
        	var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
            comSubmit.addParam("BID", $("#BID").val());
            comSubmit.submit();
             */
        }
        
        function insertComment() {
       		
        	document.commentForm.submit();
        	
        	
        }
        
        function deleteComment() {
        	var B = ${map.qid};
        	document.location.href = "/spoon/QnA_board/deleteComment.do?qid="+B;
        }
        
    </script>
</body>
</html>