<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<%@ include file="../include/include-session.jsp" %>
<form name="update" method="post" action="/shop/sample/updateBoard.do">
	  <input type="hidden" id="bid" name="bid" value="${map.bid }">
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
                <td>${map.bid }</td>
                
                <th scope="row">조회수</th>
                <td>${map.board_hits }</td>
            </tr>
            <tr>
            <th scope="row">작성자</th>
                <td>${map.member_id}</td>
                <th scope="row">작성시간</th>
                <td>${map.board_created }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
				<td colspan="3"><input type="text" id="board_subject"
					name="board_subject" class="wdp_90" value="${map.board_subject }" />
				</td>
			</tr>
            <tr>
				<td colspan="4" class="view_text"><textarea rows="20"
						cols="100" title="내용" id="board_contents" name="board_contents">${map.board_contents }</textarea>
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
        	document.location.href="/shop/sample/openBoardList.do";
        }
         
        function fn_updateBoard(){
			
        	var bid = "${map.bid}";
            var url = "/shop/sample/updateBoard.do";
            document.update.submit();
           /*  comSubmit.setUrl("<c:url value='/shop/sample/updateBoard.do?BID="+bid+"' />");
            comSubmit.submit(); */
        /* 	var frm = document.getElementById("frm");
        	frm.submit(); */
           /* var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
            comSubmit.submit();*/
        }
        
        
        
        /* function fn_openBoardUpdate(){
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();
        } */
    </script>
    
</body>
</html>