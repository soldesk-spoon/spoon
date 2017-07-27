<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<%@ include file="../include/include_logo.jsp" %>
<%@ include file="../include/include-session.jsp" %>
<form name="update" method="post" action="/spoon/QnA_board/updateBoard.do">
	  <input type="hidden" id="qid" name="qid" value="${map.qid }">
<form id="frm"  action="/spoon/QnA_board/updateBoard.do" method="post">
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
				<td colspan="3"><input type="text" id="qna_subject"
					name="qna_subject" class="wdp_90" value="${map.qna_subject }" />
				</td>
			</tr>
            <tr>
				<td colspan="4" class="view_text"><textarea rows="20"
						cols="100" title="내용" id="qna_contents" name="qna_contents">${map.qna_contents }</textarea>
				</td>
			</tr>
        </tbody>
    </table>
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">저장하기</a>
      </form>
    
    

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
                fn_updateBoard();
            });
             
            
        });
         
        function fn_openBoardList(){
        	document.location.href="/spoon/QnA_board/openBoardList.do";
        }
         
        function fn_updateBoard(){
			
        	var qid = "${map.qid}";
            var url = "/spoon/QnA_board/updateBoard.do";
            document.update.submit();
           /*  comSubmit.setUrl("<c:url value='/spoon/QnA_board/updateBoard.do?BID="+bid+"' />");
            comSubmit.submit(); */
        /* 	var frm = document.getElementById("frm");
        	frm.submit(); */
           /* var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/QnA_board/updateBoard.do' />");
            comSubmit.submit();*/
        }
        
        
        
        /* function fn_openBoardUpdate(){
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/QnA_board/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();
        } */
    </script>
    </form>
</body>
</html>