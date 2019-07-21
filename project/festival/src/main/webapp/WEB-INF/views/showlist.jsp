
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>축제 - festa</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/mdb.min.css" rel="stylesheet">
<link href="resources/css/style.min.css" rel="stylesheet">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="resources/css/landing-page.min.css" rel="stylesheet">
<style type="text/css">
@import	url('https://fonts.googleapis.com/css?family=Notable&display=swap');
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
#logo {
	font-family: Notable;
}
html, body, header, .carousel {
	height: 100%;
}
#view{
	margin-top:100px
}
</style>
</head>
<body>
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank" id="logo">
        <strong>festas</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/" target="_blank">Notice</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/education/bootstrap/" target="_blank">new</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

	<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
	<div class="carousel-inner" role="listbox">
		<!--First slide-->
		<div class="carousel-item active">
			<div class="view" id="view">
				<div class="container">
					<div class="row">			
						<div class="col-md-44 col-lg-15 col-xl-10 mx-auto">
						<form method="get" action="/festival/list"style="align-content: center;">
							<div class="form-row">
								<div class="col-20 col-md-55 mb-55 mb-md-0">
									<select name="city" class="form-control form-control-lg">
										<option value="서울특별시">서울특별시</option>
										<option value="경기도">경기도</option>
									</select>
								</div>
								<div class="col-20 col-md-55 mb-55 mb-md-0">
									<select name="district" class="form-control form-control-lg">
										<option value="">전체</option>
										<option value="강남구">강남구</option>
										<option value="강동구">강동구</option>
										<option value="강북구">강북구</option>
										<option value="강서구">강서구</option>
										<option value="관악구">관악구</option>
										<option value="광진구">광진구</option>
										<option value="구로구">구로구</option>
										<option value="금천구">금천구</option>
										<option value="노원구">노원구</option>
										<option value="도봉구">도봉구</option>
										<option value="동대문구">동대문구</option>
										<option value="동작구">동작구</option>
										<option value="마포구">마포구</option>
									<option value="서대문구">서대문구</option>
										<option value="서초구">서초구</option>
										<option value="성동구">성동구</option>
										<option value="성북구">성북구</option>
										<option value="송파구">송파구</option>
										<option value="양천구">양천구</option>
										<option value="영등포구">영등포구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="종로구">종로구</option>
										<option value="중구">중구</option>
										<option value="중랑구">중랑구</option>
									</select>
								</div>
								<div class="col-20 col-md-55 mb-55 mb-md-0">
									<select name="month" class="form-control form-control-lg">
										<option value="">전체</option>
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</div>
								<div class="col-20 col-md-55 mb-55 mb-md-0">
									<select name="type" class="form-control form-control-lg">
										<option value="">전체</option>
										<option value="문화예술">문화예술</option>
										<option value="주민화합">주민화합</option>
										<option value="전통역사">전통역사</option>
										<option value="지역특산물">지역특산물</option>
										<option value="생태자연">생태자연</option>
										<option value="기타">기타</option>
									</select>
								</div>
								
								<div class="col-20 col-md-55 mb-55 mb-md-0">
									<button type="submit"class="btn btn-block btn-lg btn-dark">검색하기</button>
								</div>
							</div>
							<input type="hidden" name="action" value="search"> 
							<input type="hidden" name="pageNo" value="1">
						</form>
					</div>
					</div>
				</div>
			
				<div class="container">
		<div class="row">
			<div class="col-sm-5 col-md-7">
				<c:if test='${!empty resultlist }'>
					<table class="table table-stripaed" style="text-align: center; border: 1px solid #dddddd; height: 70%">
						<c:forEach var="vo" items="${resultlist.list }">
							<tr>
								<td width="40%"
									onclick="location.href='/festival/detail?fid=${vo.fid}'">
									<img src="resources/images/${vo.fid }/1.jpg" height='100'>
								</td>
								<td width="60%">
									<h3>${vo.name }</h3> ${vo.place }<br> ${vo.opendate }~${vo.closedate }
								</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table" style="text-align: center; border: 1px solid #dddddd">
						<c:if test="${resultlist.hasVs()}">
							<tr>
								<td>
									<c:if test="${resultlist.startPage > 5}">
										<a href="list?pageNo=${resultlist.startPage - 5}&action=">[이전]</a>
									</c:if> <c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
										<a href="list?pageNo=${pNo}&action=">[${pNo}]</a>
									</c:forEach> <c:if test="${resultlist.endPage < resultlist.totalPages}">
										<a href="list?pageNo=${resultlist.startPage + 5}&action=paging">[다음]</a>
									</c:if>
								</td>
							</tr>
						</c:if>
					</table>
				</c:if>
				<c:if test='${!empty listmsg }'>
					<h4>${listmsg }</h4>
				</c:if>
			</div>
			<div class="col-sm-9 col-md-5" id="mapid"
				style="width: 400px; height: 240px"></div>
		</div>
	</div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="resources/js/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/mdb.min.js"></script>
	<script>
	 	new WOW().init();
		var map;
		var center = '${center}';
		$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="
				+ encodeURIComponent(center),function(data) {
		lat = data.results[0].geometry.location.lat;
		lng = data.results[0].geometry.location.lng;
		if (map)
			map.remove();
		map = L.map('mapid').setView([ lat, lng ], 10);
		mapLink = '<a href="http://openstreetmap.org">OpenStreetMap</a>';
		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
					{maxZoom : 18,
					attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, '
						+ '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '
						+ 'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
					id : 'mapbox.streets'}).addTo(map);
		var info = new Array();
		<c:forEach var="item" items="${mapinfo}" varStatus="listIdx"  >
			info.push([ "${item.getLat()}", "${item.getLng()}",	"${item.getName()}", "${item.getFid()}" ]);
		</c:forEach>
		var myIcon = L.icon({
			iconUrl : 'resources/images/marker.png',
			iconSize : [ 15, 15 ]});
		for ( var i in info) {
			lat = info[i][0] * 1;
			lng = info[i][1] * 1;
			L.marker([ lat, lng ], 	{icon : myIcon}).bindPopup('<a href="detail&fid='+info[i][3]+'">'+ info[i][2] + '</a>').addTo(map);
		}
});
	</script>
</body>
</html>