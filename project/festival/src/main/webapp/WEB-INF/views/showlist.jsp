
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 - festa</title>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<style>
table {
	width: 80%;
	border-collapse: collapse;
	text-align:center;
}
a{
	text-decoration:none;
}
a.hover{
	opacity : 20%
}
</style>
</head>
<body>
<form method="get" action="/festival/list">
<input type="hidden" name="action" value="search">
<input type="hidden" name="pageNo" value="1">
<section>
	<select name="city">
		<option value="서울특별시">서울특별시</option>
		<option value="경기도">경기도</option>
	</select>
	<select name="district">
		<option value="강남구">강남구</option><option value="강동구">강동구</option>
		<option value="강북구">강북구</option><option value="강서구">강서구</option>
		<option value="관악구">관악구</option><option value="광진구">광진구</option>									
		<option value="구로구">구로구</option><option value="금천구">금천구</option>									
		<option value="노원구">노원구</option><option value="도봉구">도봉구</option>									
		<option value="동대문구">동대문구</option><option value="동작구">동작구</option>	
		<option value="마포구">마포구</option><option value="서대문구">서대문구</option>		
		<option value="서초구">서초구</option><option value="성동구">성동구</option>
		<option value="성북구">성북구</option><option value="송파구">송파구</option>
		<option value="양천구">양천구</option><option value="영등포구">영등포구</option>
		<option value="용산구">용산구</option><option value="은평구">은평구</option>
		<option value="종로구">종로구</option><option value="중구">중구</option>
		<option value="중랑구">중랑구</option>				  	
	</select>
	<select name="month">
		<option value="01">1월</option><option value="02">2월</option>
		<option value="03">3월</option><option value="04">4월</option>
		<option value="05">5월</option><option value="06">6월</option>
		<option value="07">7월</option><option value="08">8월</option>
		<option value="09">9월</option><option value="10">10월</option>
		<option value="11">11월</option><option value="12">12월</option>
	</select>
	<select name="type">
		<option value="문화예술">문화예술</option><option value="주민화합">주민화합</option>
		<option value="전통역사">전통역사</option><option value="지역특산물">지역특산물</option>
		<option value="생태자연">생태자연</option><option value="기타">기타</option>
	</select>
	<input type="submit" value="검색하기">
</section>
</form>
	<c:if test='${!empty resultlist }'>
		<table>
			<c:forEach var="vo" items="${resultlist.list }">
				<tr>
					<td onclick="location.href='/festival/detail?fid=${vo.fid}'"><img src="resources/images/${vo.fid }/01.png" height='100'></td>
					<td>
						<h2>${vo.name }</h2> ${vo.place }<br> ${vo.opendate }~${vo.closedate }
					</td>
				</tr>
			</c:forEach>
			<c:if test="${resultlist.hasVs()}">
				<tr>
					<td>
						<c:if test="${resultlist.startPage > 5}">
							<a href="list?pageNo=${resultlist.startPage - 5}&action=">[이전]</a>
						</c:if> 
						<c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
							<a href="list?pageNo=${pNo}&action=">[${pNo}]</a>
						</c:forEach> 
						<c:if test="${resultlist.endPage < resultlist.totalPages}">
							<a href="list?pageNo=${resultlist.startPage + 5}&action=paging">[다음]</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</table>
	</c:if>
	<c:if test='${!empty listmsg }'>
		<h3>${listmsg }</h3>
	</c:if>
	<div id="mapid" style="width: 500px; height: 300px"></div>
	<script>
	var map; 
	var center='${center}';
	$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="
			+encodeURIComponent(center), function(data) {
		lat = data.results[0].geometry.location.lat;
		lng = data.results[0].geometry.location.lng;
		if(map)
			map.remove();
		map = L.map('mapid').setView([lat, lng], 10);
		mapLink = 
            '<a href="http://openstreetmap.org">OpenStreetMap</a>';
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
					'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
					'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
				id: 'mapbox.streets'
			}).addTo(map);
		var info = new Array();
	<c:forEach var="item" items="${mapinfo}" varStatus="listIdx"  >
		info.push(["${item.getLat()}","${item.getLng()}", "${item.getName()}","${item.getFid()}"]);
	</c:forEach>
	   var myIcon = L.icon({
	       iconUrl: 'resources/images/marker.png',
	       iconSize: [15, 15]
	   });
		for(var i in info){
			lat = info[i][0]*1;
			lng = info[i][1]*1;
			L.marker([lat,lng],{icon:myIcon}).bindPopup('<a href="detail&fid='+info[i][3]+'">'+ info[i][2]+'</a>').addTo(map);
		}
	});
</script>
</body>
</html>