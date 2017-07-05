<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum 지도 시작하기</title>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8524663cb5d0a1412f368d10073818a3"></script>
	
</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
</body>
</html>