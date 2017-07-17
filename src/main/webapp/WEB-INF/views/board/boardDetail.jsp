<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jsp" %>
<!-- jQuery library (served from Google) -->


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
         	<tr>
           		<td>${map.subway_name}역</td>
           	</tr>
        </tbody>
    </table>
      <c:forEach items="${imgmap}" var="img">
                    <ul class="bxslider">
                    	<li><img src="${pageContext.request.contextPath}/resources/data/${img.FILE_NAME}" width="200" height="200" ></li>
                    </ul>
      </c:forEach>
    
    
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

<!-- jQuery library (served from Google) -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/lib/jquery.bxslider.css" rel="stylesheet" />
<script>
$(document).ready(function(){
  $('.bxslider').bxSlider();  
});
</script>
</html>