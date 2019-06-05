# Java Script #3

### Canvas API

- 웹 페이지에 그림을 그릴 수 있도록 지원하는 HTML5 API

- &lt;canvas> 엘리먼트를 사용하여 그림을 그리기 위한 영역을 정의, 스크립트로 그림을 그린다.

- 직선, 박스, 원, 베지에 곡선 등 다양한 그림을 직접 그릴 수 있으며 원하는 사이즈와 칼라의 이미지 출력을 처리 가능

- HTMLCanvasObject 객체 접근

  - 웹 스크립트로 그림을 그리기 위해서는 &lt;canvas> 태그를 DOM객체로 접근해야 한다.
  - &lt;canvas>엘리먼트를 사용하여 그림을 그리기 위한 영역을 정의, javascript로 그림을 그린다.

- 그리기 기능을 지원하는 메서드들

  | 메서드                                                       | 설명                                                         |
  | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | fillRect(x, y, width, height)                                | 색이 칠해진 사각형                                           |
  | strokeRect(x, y, width, height)                              | 테두리만 있는 사각형                                         |
  | clearRect(x, y, width, height)                               | 특정 영역을 지우고 완전히 투명하게                           |
  | beginPath()                                                  | 경로를 시작                                                  |
  | closePath()                                                  | 경로를 종료                                                  |
  | stroke()                                                     | 경로를 따라서 테두리 선을 그린다                             |
  | fill()                                                       | 설정된 스타일로 도형을 채운다                                |
  | moveto(x, y)                                                 | (x, y) 위치로 시작점을 옮긴다                                |
  | lineto(x, y)                                                 | x에서 y까지 직선을 그린다                                    |
  | strokeText(msg, x, y)                                        | (x, y) 위치에 텍스트를 테두리선만 그린다                     |
  | fillText(msg, x, y)                                          | (x, y) 위치에 텍스트를 선을 채워서 그린다                    |
  | measureText(msg)                                             | 측정된 문자열의 길이 정보를 저장한 TextMetrics객체를 반환    |
  | arc(x, y, r, startAngle,endAngle, anticlockwise)             | (x, y)에서 시작하여 반시계 방향(anticlockwise)으로 반지름(r)만큼의 원을 그린다 |
  | quardraticCurveTo(cp1x, cp1y, x, y)                          | 한 개의 조절점(cp1x, xp1y)을 이용해 (x, y)까지의 곡선을 그린다 |
  | bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y)                  | 두개의 조절점 (cp1x, cp1y)와  (cp2x, cp2y)를 이용해 (x, y) 까지의 곡선을 그린다 |
  | drawImage(image, sx, sy), drawImage(image, sx, sy, sWidth, sHeight), drawImage(image, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight) | 이미지 파일을 읽어서 주어진 위치에 주어진 크기로 또는 슬라이스하여 그린다 |

- 그라디언트와 패턴

  - 그라디언트: CanvasGradient객체를 생성

    -  createLinearGradient(x1, y1, x2, y2) : 선형그라디언트 객체를 생성
    - createRadialGradient(x1, y1, r1, x2, y2, r2) : 원형그라디언트 객체를 생성
    - CanvasGradient 객체의 메서드
      - addColorStop(position, color) : postion(0.0~1.0) 위치에 color를 설정

  - 패턴: CanvasPattern 객체를 생성

    - createPattern(image, type) : image와 type에 알맞은 패턴 객체를 생성

      image : CanvasImageSource 객체

      type : repeat / repeat-x / repeat-y / no-repeat

  - save()

    - 캔버스의 상태정보를 스택에 저장
    - 스택에 저장되는 정보: 캔버스에 적용된 변형 내용

  - restore()

    - 스택에 저장된 상태 정보

- 스타일

  - 색상
    - fillStyle : 채울 색상 지정
      - 색, CanvasGradient 객체, CanvasPattern 객체 지정 가능
    - strokeStyle: 테두리 색상 지정
      - 색, CanvasGradient 객체, CanvasPattern 객체 지정 가능
    - globalAlpha : 투명도 지정, 0(투명)~1 사이 값
  - 선
    - lineWidth : 선의 두께, default = 1
    - lineCap: 선의 끝 모양을 결정
      - butt : default값, 효과 없음
      - round : 선 너비의 반을 반지름으로 하는 반원을 선 양쪽 끝에
      - square : 선 양쪽 끝에 사각형
    - lineJoin : 두 개의 선이 만날 때 선의 교차점 표시
      - round : 선과 선이 만나는 부분을 둥글게
      - bevel : 선과 선이 만나는 부분을 단명으로
      - miter : 연결한 흔적이 남지 않고 마치 처음부터 하나의 선이었던 것처럼 연결. default값

- 그림자 효과

  - shadowOffsetX
    - 객체로부터 그림자가 x축 방향으로 얼마나 떨어져 있는지 표시(기본값=0, 음수면 왼쪽)
  - shadowOffsetY
    - 객체로부터 그림자가 y축 방향으로 얼마나 떨어져 있는지 표시(기본값=0, 음수면 위쪽)
  - shadowBlur
    - 그림자가 얼마나 흐릿한지 나타낸다. 기본값=0
  - shadowColor
    - 그림자 색상을 지정, 기본값=완전히 투명한 검정

- 도형 변형

  - scale(x, y) : 도형의 크기 조정
  - rotate(angle) : 주어진 각도만큼 도형을 회전
  - translate(x, y) : 도형을 그리는 기준 위치를 이동

- 도형 합성

  - globalCompositeOperatio : 원본(먼저 그린 도형)도형과 대상(나중에 그린 도형) 도형의 겹쳐진 형태에 따른 표시 방법을 정의. source-over, source-in, destination-over, lighter, ....

- 비트맵 이미지 관리와 THMLObjectCanvas 객체

  - 비트맵 이미지 관리

    - createImageData(sw, sh)

    - createImageData(ImageData 객체)

      비트맵 이미지 객체(ImageData)를 생성

    - getImageData(sx, sy, sw, sh) : &lt;canvas> 객체의 주어진 영역의 데이터를 비트맵 이미지 객체(ImageData)로 추출 

    - putImageData(ImageData 객체, dx, dy) : &lt;canvas> 객체의  (dx, dy) 위치에 비트맵 이미지 객체(ImageData)의 데이터를 출력

  - HTMLObjectCanvas 객체 저장

    - toDataURL() : &lt;canvas>태그 영역의 모든 내용을 png 형식의 URI 문자열로 변환하여 반환