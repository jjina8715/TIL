# Leaflet

- 오픈 소스 자바스크립트 라이브러리. 

**leaflet 기본 설정**

```html
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="..." crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="..." crossorigin=""/>

<div id="mapid" style="width:500; height= 500;"></div>
```

1. map 생성

   ```html
   var mymap = L.map('mapid').setView([lat, lng], zoomlevel);
   ```

2. 타일레이어 추가

   ```html
   L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw' <!--타일레이어 URL 템플릿 값을 불러오는 부분-->, { 
        		maxZoom: 18,
        		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        			'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
        		id: 'mapbox.streets-satellite'
        	}).addTo(mymap);
   ```

3. 마커 추가(팝업 위도우나 툴팁 추가)

   ```html
   L.marker([lat, lng]),addTo(mymap).bindPopup("...").openPopup();
   ```

**leaflet with GeoJSON**

- leaflet map 레이어 위에 다른 데이터(GeoJSON 형식)을 엮는다.
- GeoJSON (https://geojson.org)
  - 위치정보를 갖는 점을 기반으로 체계적으로 다양한 지리적 데이터 구조를 표현하기 위해 설계된 개방형 공개 표준 형식. JSON인 자바 스크립트 오브젝트 노테이션을 사용하는 파일 포맷
  - GeoJSON 객체는 Point , Polygon MultiLineString, multiPolygon 등을 표현
  - type
    - Features : 기하학적 객체와 해당 객체에 대한 속성값을 포함
    - FeatureCollection : features의 리스트를 의미
    - leaflet는 두 타입 모두 지원하지만, Features에 properties값을 설정해 활용하는 형태로 사용하는데 최적화되어 있다.
- map에 GeoJSON 추가
  - $.getJSON(), bindPopup() 사용
  - bean GeoJSON 레이어를 먼저 생성한 뒤 변수에 할당한 다음 나중에 GeoData 정보를 설정 가능 / L.getJSON(), L.geoJson()
- geocoding : 주소를 주면 위도, 경도를 알 수 있는 구글의 api
- geolocation.getCurrentPosition(성공시 함수, 실패시 함수) : 실행되는 컴퓨터의 위치를 position으로 반환하는 navigator의 함수 