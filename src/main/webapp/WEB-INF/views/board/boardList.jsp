<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/include-header.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>

<%@ include file="../include/include_logo.jsp" %>

<%@ include file="../include/include-session.jsp" %>

<h2>게시판 목록</h2>
<div>
	정렬 선택
	<form method="post" action="/spoon/sample/openBoardList.do" name="selectedForm">
		<input type="hidden" id="sel" name="sel" value="">
	</form>
	<select id="selectOption" name="selectOption" onChange="javascript:selectEvent(this)">
		<option id="selectNo" value="selectNo" ${selectobj eq  "selectNo" ? "selected" :""}  >최신순</option>
		<option id="selectHit" value="selectHit" ${selectobj eq  "selectHit" ? "selected" :""} >조회수</option>
		<option id="selectLike" value="selectLike" ${selectobj eq  "selectLike" ? "selected" :""} >추천수</option>
	</select>
	<br>
</div>
<table width="751" height="95" class="board_list">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">추천수</th>
            <th scope="col">작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list }" var="row">
                    <tr>
                        <td>${row.bid }</td>
                        <td class="board_subject">
                                <a href="#this" name="board_subject">${row.board_subject }</a>
                                <input type="hidden" id="bid" value="${row.bid }">
                            </td>
                        <td>${row.board_hits }</td>
                        <td>${row.board_like }</td>
                        <td>${row.board_created }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
         
    </tbody>
</table>
<br/>
    <a href="#this" class="btn" id="write">글쓰기</a>
     
    <%@ include file="../include/include-body.jsp" %>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openBoardWrite();
            });
             
            $("a[name='board_subject']").on("click", function(e){ //제목
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
        });
         
         
        function fn_openBoardWrite(){
        	document.location.href="/spoon/sample/openBoardWrite.do?subway_linenumber=1";
        }
         
        function fn_openBoardDetail(obj){
        	var mid = document.getElementById('mid').value;
        	if(mid==""){
        		alert("접근권한이 없습니다 . 먼저 로그인 해주세요 ");
        		return false;
        	}
            var B=obj.parent().find("#bid").val();
            
            document.location.href="/spoon/sample/openBoardDetail.do?bid="+B;
            
        }
		function selectEvent(selectObj){
       		var val = selectObj.value;
        	document.getElementById('sel').value = val;
        	document.selectedForm.submit();
      	  }
		
        
    </script>
    <form method="post" action="/spoon/sample/openBoardList.do" name="search">
    <input type="text" id="sub" name="sub">
    <input type="submit" value="send">
    </form>
    
</body>
</html>