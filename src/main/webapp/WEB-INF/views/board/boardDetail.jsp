<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page session="true" %>
<%@ include file="../include/include-header.jsp" %>

<style type="text/css">
#slider {position:relative;margin:0 auto;padding:0;list-style:none;width:350px;height:350px;overflow-x:hidden}
#slider li {display:none;position:absolute;left:0;top:0}
#slider img {width:350px;height:350px}
</style>

</head>
<body>

<%@ include file="../include/include-session.jsp" %>
<form method="post" name="LikeForm" id="LikeForm">
<input type="hidden" id="bid" name="bid" value="${map.bid }">
<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.member.mid }">
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
					<td colspan="2">
						 <input type="button" value="" onclick="insertLike();" id="Likebtn" name="Likebtn">
						 <input type="button" value="" onclick="insertHate();" id="Hatebtn" name="Hatebtn">
						 <input type="hidden" value="${lhmap.board_like}" name="like" id="like">
						 <input type="hidden" value="${lhmap.board_hate}" name="hate" id="hate">  
			
						 ${vo.alert}
						           	
                	</td>
            </tr>
         	<tr>
         			<td>
                		좋아요:
                	</td>
                	<td>
                		${sumlike}
                	</td>
                	<td>
                		싫어요:
                	</td>
                	<td>
                		${sumhate}
                	</td>
                	
           	</tr>
            
            <tr>
                <td colspan="4">${map.board_contents }</td>
            </tr>
         	<tr>
           		<td>${map.subway_name}역</td>
           	</tr>
           	
			<tr>
					<td><button type="button" id="prev_btn" class="btn">이전</button></td>
				<td>
					<ul id="slider">
					<c:forEach items="${imgmap}" var="img">
                    		<li><img src="${pageContext.request.contextPath}/resources/data/${img.FILE_NAME}" ></li>
      				</c:forEach>
      				</ul>
      				</td>
      					<td><button type="button" id="next_btn" class="btn">다음</button></td>
      		</tr>
        </tbody>
    </table>
   </form>
      
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     <a href="#this" class="btn" id="delete">삭제하기</a>
     
     
    <%@ include file="../include/include-body.jsp" %>
    
    <h4>댓글</h4>
	
	
	<table>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
				<c:if test="${row.ref ne row.cid}">
					<tr>
					<td width="300"><font face="Arial Black">&nbsp;&nbsp;${row.member_id }</font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">${row.comment_created }</font></td>
					
						<!-- <td width="150"></td> -->
					</tr>
					<tr>
						<td colspan="2">&nbsp;&nbsp;${row.comment }						
						</td></tr>
						</c:if>
						<form id="writeC" name="writeC" method="post" action="/spoon/sample/insertComment.do">
							<c:if test="${row.ref eq row.cid}">
							<tr>
							<td width="200"><font face="Arial Black">${row.member_id }</font>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">${row.comment_created }</font></td>
			<!-- 		<td></td> -->
						<td width="150"><input type="button" id="bttn${row.cid}" name="${row.cid}" value="답글" onclick="cidGet(${row.cid});"></td>
					</tr>
					<tr>
						<td colspan="2">${row.comment}
						
						</td>
						</tr>
					<tr style="DISPLAY: none" id="tr${row.cid}"><!-- -->
					<td>
						
	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member.member_id}">
	<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }">
	<input type="hidden" id="ref" name="ref" value="${row.cid}">
	<input type="hidden" id="cid" value="${row.cid }">
	<input type="hidden" id="bid" name="bid" value="${map.bid }">
	<input type="hidden" id="btncid" value="">
	
	<textarea id="comment" name="comment" rows="2" cols="30"></textarea></td>
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
	
	
	<form id="writeC2" name="writeC2" method="post" action="/spoon/sample/insertComment.do">
	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member.member_id}">
	<input type="hidden" id="mid" name="mid" value="${sessionScope.member.mid }">
	<input type="hidden" id="ref" name="ref" value="0">
	<input type="hidden" id="bid" name="bid" value="${map.bid }">
	<table><tr><td><textarea id="comment" name="comment" rows="2" cols="30"></textarea></td>
	<td><input type="button" value="등록" onclick="fn_comment2();"></td>
	</tr>
		
		</table>
	</form>
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">

    $(function() {
        var time = 500;
        var idx = idx2 = 0;
        var slide_width = $("#slider").width();
        var slide_count = $("#slider li").size();
        $("#slider li:first").css("display", "block");
        if(slide_count > 1)
            $(".btn").css("display", "inline");
     
        $("#prev_btn").click(function() {
            if(slide_count > 1) {
                idx2 = (idx - 1) % slide_count;
                if(idx2 < 0)
                    idx2 = slide_count - 1;
                $("#slider li:hidden").css("left", "-"+slide_width+"px");
                $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                    $(this).css("display", "none").css("left", "-"+slide_width+"px");
                });
                $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
                idx = idx2;
            }
        });
     
        $("#next_btn").click(function() {
            if(slide_count > 1) {
                idx2 = (idx + 1) % slide_count;
                $("#slider li:hidden").css("left", slide_width+"px");
                $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                    $(this).css("display", "none").css("left", slide_width+"px");
                });
                $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
                idx = idx2;
            }
        });
    });
    
    
    
    
    
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
        	document.location.href="/spoon/sample/openBoardList.do";
        }
         
        function fn_openBoardUpdate(obj){
        	var B = ${map.bid};
            
            
        	var mid = document.getElementById('mid').value;
       		var mid1 = document.getElementById('mid1').value;
        	
        	if(mid != mid1){
        		alert("수정권한이 권한이 없습니다.");
        		return false;
        	}
        	document.location.href="/spoon/sample/openBoardUpdate.do?bid="+B;
            /*
            var bid = "${map.bid}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("BID", bid);
            comSubmit.submit();*/
        }
        
        function fn_deleteBoard(){
        	var B = ${map.bid};
            document.location.href="/spoon/sample/deleteBoard.do?bid="+B;
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
        
        
         
    	   function cidGet(i){
				var numb = i;
				var bttnNum = "tr"+i;
    		   /* alert(bttnNum); */
    		   var DocubttnNum = document.getElementById(bttnNum);
       			if(DocubttnNum.style.display=='none'){
       				DocubttnNum.style.display='block';
       			}else{
       				DocubttnNum.style.display='none';
       			}
          }
    </script>
    
   <!--  <section id="map2view">
    	<tiles:insertAttribute name="map2view"/>
    </section> -->
    <!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width:600px;height:350px;"></div>    
<input type="hidden" id="input_lat" name="input_lat" value="${map.board_lat}">
<input type="hidden" id="input_lng" name="input_lng" value="${map.board_lng}">
<input type="hidden" id="rest" name="rest" value="${rest}">
<input type="hidden" id="address" value="${map.address}">
주소 : ${map.board_address}
    
</body>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=45aee8e672a2dfe509015315339dc5c3&libraries=services"></script>
<script>

var input_lat = document.getElementById('input_lat').value;
var input_lng = document.getElementById('input_lng').value;
var pos = "("+input_lat + ", " + input_lng+")";
var rest = document.getElementById('rest').value;
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(input_lat, input_lng); 
var content = rest;
// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = [{
    position: markerPosition,
    text: content
}];
nfowindow = new daum.maps.InfoWindow({zindex:1});
var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new daum.maps.LatLng(input_lat, input_lng), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    
    


// 이미지 지도를 생성합니다
var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
</script>

<script type="text/javascript">
	window.onload = function(){
	var like = document.getElementById('like').value;
	var hate = document.getElementById('hate').value;
	
	if(like=='1'){
		document.getElementById('Likebtn').value = "취소"
	}else{
		document.getElementById('Likebtn').value = "좋아요"
	}
	
	if(hate=='1'){
		document.getElementById('Hatebtn').value = "취소"
	}else{
		document.getElementById('Hatebtn').value = "싫어요"
	}
	
	}

	function insertLike() {
		var hatebtn = document.getElementById('Hatebtn').value;
		var bid = document.getElementById('bid').value;
		var mid = document.getElementById('mid').value;
		var like = document.getElementById('like').value;
		var form = document.forms["LikeForm"];
		
		if(!like||like=='0'){
			document.getElementById('like').value='1';
			alert(document.getElementById('like').value);
		}else{
			document.getElementById('like').value='0'
			alert(document.getElementById('like').value);
			
		}
		
		document.LikeForm.action="/spoon/sample/insertLikeHate.do?bid="+bid;
		form.submit();
		
	}
	
	function insertHate() {
		var bid = document.getElementById('bid').value;
		var mid = document.getElementById('mid').value;
		var hate = document.getElementById('hate').value;
		var form = document.forms["LikeForm"];
		if(!hate||hate=='0'){
			document.getElementById('hate').value='1';
		}else{
			document.getElementById('hate').value='0'
		}
		
		document.LikeForm.action="/spoon/sample/insertLikeHate.do?bid="+bid;
		form.submit();
		
	}

</script>

</html>