<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 - festa</title>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
   <style>
   table{
   	width:80%;
   	border-collapse:collapse;
   }
   </style>
</head>
<body>
<c:if test=${!empty resultlist }>
	<table >
		<c:forEach var="vo" items="${resultlist.list }">
			<tr>
				<td><img src="images/${vo.fid }/01.jpg" height='100'></td>
				<td>
				<h2>${vo.name }</h2>
				${vo.place } <br>
				${vo.opendate }~${vo.closedate }
				</td>
			</tr>
		</c:forEach>
		<c:if test="${resultlist.hasFestivals()}">
		<tr>
		<td>
			<c:if test="${resultlist.startPage > 5}">
				<a href="list?pageNo=${resultlist.startPage - 5}&action=paging">[이전]</a>
			</c:if>
			<c:forEach var="pNo" begin="${resultlist.startPage}" 
						end="${resultlist.endPage}">
				<a href="list?pageNo=${pNo}&action=paging">[${pNo}]</a>
			</c:forEach>
			<c:if test="${resultlist.endPage < resultlist.totalPages}">
				<a href="list?pageNo=${resultlist.startPage + 5}&action=paging">[다음]</a>
			</c:if>
		</td>
		</tr>
		</c:if>		
	</table>
</c:if>
<div id="mapid" style="width:600px; height:400px"></div>
<script>
var mymap = L.map('mapid').setView([37.5017, 127.0409], 10);
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
       '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
       'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox.streets'
 }).addTo(mymap);
 var latlng = '${latlng}';
	   var myIcon = L.icon({
	       iconUrl: 'images/map-marker.png',
	       iconSize: [30, 50]
	   });
	   
	var markers = [];
	
	for(var place in latlng){
 		markers.push(L.marker(place, {icon: myIcon}));
	}
 var group = L.layerGroup(markers);
 
 group.eachLayer(function (layer, i) {
     layer.bindPopup('<a href="/"></a>');
 });
 
 group.addTo(mymap);
</script>
</body>
</html>