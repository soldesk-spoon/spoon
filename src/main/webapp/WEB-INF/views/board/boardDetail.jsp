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
            <tr>
                <td colspan="4">${map.board_contents }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     <a href="#this" class="btn" id="delete">삭제하기</a>
     
     
    <%@ include file="../include/include-body.jsp" %>
    
    <h4>댓글</h4>
	
	
	<table>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
				<c:if test="${row.ref ne 0}">
					<tr>
					<td width="200"><font face="Arial Black">&nbsp;&nbsp;${row.member_id }</font></td>
					<td>
						<td width="150">&nbsp;&nbsp;${row.comment_created }</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;&nbsp;${row.comment }						
						</td></tr>
						</c:if>
						<form id="writeC2" name="writeC2" method="post" action="/shop/sample/insertComment.do">
							<c:if test="${row.ref eq 0}">
							<tr>
							<td width="200"><font face="Arial Black">${row.member_id }</font></td>
					
						<td width="150"><input type="button" id="bttn" name="${row.cid}" value="열기/닫기" onclick="cidGet();">${row.comment_created }</td>
					</tr>
					<tr>
						<td colspan="2">${row.comment}
						
						</td>
						</tr>
					<tr style="DISPLAY: none" id="${row.cid}"><!-- -->
					<td>
						
	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member.member_id}">
	<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }">
	<input type="hidden" id="ref" name="ref" value="0">
	<input type="hidden" id="bid" name="bid" value="${map.bid }">
	<input type="hidden" id="cid" value="${row.cid }">
	<input type="hidden" id="btncid" value="">
	
	<input type="text" id="comment" name="comment"></td>
	<td><input type="button" value="등록" onclick="fn_comment();"></td>
	
	
		</tr>
							</c:if>
					</form>	
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	
	<form id="writeC" name="writeC" method="post" action="/shop/sample/insertComment.do">
	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member.member_id}">
	<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }">
	<input type="hidden" id="ref" name="ref" value="0">
	<input type="hidden" id="bid" name="bid" value="${map.bid }">
	<table><tr><td><input type="text" id="comment" name="comment"></td>
	<td><input type="button" value="등록" onclick="fn_comment2();"></td>
	</tr>
		
		</table>
	</form>
    
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
        
        function fn_comment(){
        	document.writeC.submit();
        }
        
        function fn_comment2(){
        	document.writeC2.submit();
        }
        
        $("#bttn").click(function () {
        	var numb=$(this).attr('name');
        	alert(numb);
        	  if ( $( "#3:first" ).is( ":hidden" ) ) {
        	    $( "#3" ).slideDown(0);
        	  } else {
        	    $( "#3" ).hide();
        	  } 
       });
         
       function cidGet(){
    	  document.getElementById("btncid").value  = document.getElementById("bttn").getAttribute('name');
       }
    </script>
</body>
</html>