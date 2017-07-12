<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 지도에 마커 표시하기</title>
    
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width:600px;height:350px;"></div>    
<input type="hidden" id="input_lat" name="input_lat" value="${input_lat}">
<input type="hidden" id="input_lng" name="input_lng" value="${input_lng}">
<input type="hidden" id="rest" name="rest" value="${rest}">
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
</body>
</html>