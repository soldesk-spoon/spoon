<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<form name="update" method="post" action="/shop/freeboard/updateBoard.do">
	  <input type="hidden" id="fbid" name="fbid" value="${map.fbid }">
<form id="frm"  action="/shop/freeboard/updateBoard.do" method="post">
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
				<td colspan="3"><input type="text" id="free_subject"
					name="free_subject" class="wdp_90" value="${map.free_subject }" />
				</td>
			</tr>
            <tr>
				<td colspan="4" class="view_text"><textarea rows="20"
						cols="100" title="내용" id="free_contents" name="free_contents">${map.free_contents }</textarea>
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
        	document.location.href="/shop/freeboard/openBoardList.do";
        }
         
        function fn_updateBoard(){
			
        	var fbid = "${map.fbid}";
            var url = "/shop/freeboard/updateBoard.do";
            document.update.submit();
           /*  comSubmit.setUrl("<c:url value='/shop/freeboard/updateBoard.do?BID="+bid+"' />");
            comSubmit.submit(); */
        /* 	var frm = document.getElementById("frm");
        	frm.submit(); */
           /* var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/freeboard/updateBoard.do' />");
            comSubmit.submit();*/
        }
        
        
        
        /* function fn_openBoardUpdate(){
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/freeboard/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();
        } */
    </script>
    </form>
</body>
</html>