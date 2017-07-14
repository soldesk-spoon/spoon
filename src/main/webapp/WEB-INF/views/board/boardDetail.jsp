<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
</head>
<body>
<%@ include file="../include/include-session.jsp" %>
<input type="hidden" id="bid" name="bid" value="${map.bid }">
<input type="hidden" id="mid1" name="mid1" value="${map.mid}">
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
                <td colspan="3">${map.board_subject }</td>
            </tr>
           <c:forEach items="${imgmap}" var="img">
                    <tr>
                    	<td><img src="${pageContext.request.contextPath}/resources/data/${img.FILE_NAME}" width="200" height="200" ></td>
                        <td>${img.FILE_NAME}</td>
                    </tr>
                    
           </c:forEach>
            
            <tr>
                <td colspan="4">${map.board_contents }</td>
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
               
            	var mid = document.getElementById('mid').value;
           		var mid1 = document.getElementById('mid1').value;
            	
            	if(mid != mid1){
            		alert("삭제 권한이 없습니다.");
            		return false;
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
        	document.location.href="/shop/sample/openBoardList.do";
        }
         
        function fn_openBoardUpdate(obj){
        	var B = ${map.bid};
            
            
        	var mid = document.getElementById('mid').value;
       		var mid1 = document.getElementById('mid1').value;
        	
        	if(mid != mid1){
        		alert("수정권한이 권한이 없습니다.");
        		return false;
        	}
        	document.location.href="/shop/sample/openBoardUpdate.do?bid="+B;
            /*
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();*/
        }
        
        function fn_deleteBoard(){
        	var B = ${map.bid};
            document.location.href="/shop/sample/deleteBoard.do?bid="+B;
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