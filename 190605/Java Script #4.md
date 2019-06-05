# Java Script #4

### Web Storage API

- 웹 브라우저에 자료를 저장하기 위한 기능으로 로컬 스토리지와 세션 스토리지로 나뉜다

- 저장하려는 데이터마다 유일한 이름(키)을 같이 저장

- 데이터의 종류에는 제한이 없으며, 저장시에는 문자열로 저장

- local storage: 영구 보관

  session storage: 브라우저가  종료될 때까지 보관

- W3C는 Same Origin Policy에 따라 도메인당 5MB를 권장하고 있으며 추가 용량이 필요할 경우 사용자의 동의를 얻어 용량 확장 가능

- window.localStorage / window.sessionStorage의 주요멤버

  - length, key(index), getItem(key), setItem(key, value), removeItem(String key), clear(), 
  - onstorage : 로컬 스토리지의 내용이 변경될 때마다 발생하는 이벤트, StorageEvent 객체 생성
  - StorageEvent의 주요 속성
    - key, oldValue, newValue, url

- 로컬/세션  스토리지의 데이터 관리

  - 저장
    - session/localStorage.mykey = "myvalue";
    - session/localStorage["mykey"] = "myvalue";
    - session/localStorage.setItem("mykey", "myvalue");
  - 읽기
    - var mydata = session/localStorage.mykey;
    - var mydata = session/localStorage["mykey"];
    - var mydata = session/localStorage.getItem("mykey");
  - 삭제
    - delete session/localStorage.mykey;
    - delete session/localStorage["mykey"];
    - session/localStorage.remove("mykey");

### Drag&Drop API

- Drag&Drop이란

  - 사용자 편의성을 고려한 UI기능
  - 마우스를 사용해 app간에 파일이나 app의 데이터를 전달하는 기능. 다양한 이벤트의 핸들러를 구현하여 처리
  - 웹애플리케이션에서 화면 상에 나타나는 요소를 옮기거나 외부에 있는 파일을 읽어 웹페이지에 출력 또는 업로드하는 용도로 사용
  - HTML5의 엘리먼트들은 draggable 속성의 값을 true로 지정하면 드래그가 가능한 소스객체가 된다.
  - &lt;img> 엘리먼트는 기본값으로 draggable속성의 값이 true이며 다른 엘리먼트들은 설정해주어야 한다.

- 관련 이벤트

  - 대상(소스객체) : dragstart, dragend, drag

    - dragstart 이벤트

      객체에서 드래그를 시작할 때

    - drag 이벤트

      드래그하는 동안 일어나는 연속적인 이벤트

      커서를 움직일 때 객체에서 반복적으로 호출

      이벤트가 일어나는 동안 나타나는 드래그 피드백의 형태는 바꿀 수 있지만 dataTransfer에 있는 데이터에는 접근 불가

    - dragend 이벤트

      연쇄 작용의 마지막 단계에서 일어나는 이벤트로 drop 이벤트후 발생

      객체에서 발생하여 드래그가 완료되었다는 것을 나타낸다. 

  - 영역(타겟객체) : dragenter, dragleave, dragover, drop

    - dragenter 이벤트

      드래그된 객체가 drop동작을 수행하기 위해 dropzone에 들어갔을 때 발생

    - dragleave 이벤트

      드래그된 객체를 drop 동작을 하지 않고 dropzone을 벗어날 때 발생

    - dragover 이벤트

      드래그된 객체가 dropzone에서 움직일 때 발생

      드래그 소스에서 호출되는 drag 이벤트와는 달리 이 이벤트와는 달리 dragover 이벤트는 마우스의 현재 타깃에서 호출

    - drop

      사용자가 마우스 버튼을 놓을 때 현재 마우스 타깃에서 호출

  - 타겟객체는 드롭이 불가능한 상태가 defalut이기 때문에 핸들러를 지정하여 dragover이벤트가 발생할 때  preventDefault()를 실행해주어서 drop 가능하게 해주어야 한다.

- dataTransfer 객체

  - 드래그되는 소스 객체에서 drop이 일어나는 타겟 객체로 전달하려는 데이터를 저장하는 객체
  - dragstart이벤트 발생시 전달되는 이벤트 객체의 dataTransfer 속성을 사용
  - 주요 속성, 메서드
    - files 속성 : FileList 타입, 드래그 대상이 파일일 때 사용
    - types 속성 : StringList타입, 전달되는 데이터들의 타입명을 추출할 수 있다. 
    - clearData(type) : type 명에 해당되는 데이터를 삭제
    - getData(type) : type 명에 해당되는 데이터를 추출
    - setData(type, data) : type 명으로 데이터를 저장
    - setDragImage(image x, y) : 드래그하는 동안 커서를 따라다니는 이미지를 (x, y) 위치에 출력되도록 설정





















