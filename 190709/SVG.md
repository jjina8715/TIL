# SVG

- Scalable Vector Graphics, 2차원 벡터 그래픽을 표현하기 위한 XML 기반의 파일 형식

- 1999년  W3C의 주도하에 개발된 오픈 표준의 벡터 그래픽 파일 형식

- SVG 형식의 이미지와 그 작동은 XML 텍스트 파일들로 정의되어 검색화, 목록화, 스크립트화가 가능하며 압축도 가능

- 특징

  - 벡터를 기반으로 한 그래픽을 그리는 데 사용하는 마크업 언어의 하나, XML의 한 종류이므로 XML 문법을 그대로 이용 가능
  - 벡터를 기반으로 그래프를 그리는데 좌표를 조합하여 그리는 방식. 
    - 벡터 기반은 픽셀 기반과 다르게 작은 데이터로도 도형을 그릴 수 있다. 해상도가 바뀌거나 도형을 확대하더라도 선이 깨끗. 
    - 복잡한 도형은 좌표가 많아져서 표시하는데 시간이 걸리게 된다는 단점

- SVG 시작

  ```html
  <svg width="" height="" xmlns="http://www.w3c.org/2000/svg"></svg> 
  ```

  &lt;svg>태그는 svg의 root태그

  svg는 XHTML 스펙을 따른다. 반드시 xmlns attribute를 이용해 namespace를 지정해줘야 한다. 

  &lt;svg>태그를 HTMl 문서 안에서 사용하는 경우에는 xmlns 속성 생략 가능

- 기본 도형 태그

  | 도형        | 요소명  | 기본 속성                  |
  | ----------- | ------- | -------------------------- |
  | 사각형      | rect    | x, y, width, height        |
  | 둥근 사각형 | rect    | x, y, width, heght, rx, ry |
  | 원          | circle  | cx, cy, r                  |
  | 타원        | ellipse | cx, cy, rx, ry             |
  | 선          | line    | x1, y1, x2, y2             |
  | 연결선      | polygon | points                     |
  | 다각형      | polygon | points                     |

- Path

  - &lt;path d="패스 데이터" pathlength="길이">

    - 임의의 모양을 묘사 - 연속된 점으로 외각선을 표현(직선, 곡선, 원호 등)
    - fill과 stroke 등 스타일 지정이 가능 - 폐쇄형/개방형

  - Path Data

    - 대문자 기호는 절대 좌표, 소문자 기호는 상대좌표
    - 좌표값 사이는 공백이나 컴마 등 구분 문자 사용

    | 명령      | 내용                    | 기호 | 매개변수           |
    | --------- | ----------------------- | ---- | ------------------ |
    | moveto    | (no drawing)            | M m  | (x y)+             |
    | closepath | (끝점-시작점 사이 line) | Z z  |                    |
    | lineto    | General Line            | L l  | (x y)+             |
    |           | Horizontal Line         | H h  | x+                 |
    |           | Vertical Line           | V v  | y+                 |
    | curveto   | Cubic Bezier            | C c  | (x1 y1 x2 y2 x y)+ |
    |           | Shorthand/Smooth        | S s  | (x2 y2 x y)+       |

- SVG 스타일 지정

  - 태그의 속성
  - CSS

- 페인팅(Painting)

  - 페인팅 대상
    - 대상 객체 : 도형, 텍스트, 패스
    - 페인팅 작업(operation) : fill&stroke
    - 페인팅 방법 : single color, gradient (linear or radial), pattern
  - 페인팅 속성의 값 : 예 fill="...."
    - None : non fill
    - currentColor : 현재 색상으로 fill
    - &lt;color> : 지정한 색상
    - &lt;URI> :  미리 정의된 fill 스타일

- 좌표 시스템의 변환(Transformations)

  - 2D 기본 변환 : transform="..."
  - 이동(translation) : translate(tx, ty)
  - 회전(rotation) : rotate(a) 시계방향 ratate(a, x, y) 각도, 중심점 
  - 신축(scaling) : scale(sx, sy)
  - 비틀림(shearing, skew) : skewX(a) 오른쪽, skewY(a) 아래쪽 축의 비틀림 각도

- 그래디언트(Gradient)

  - SVG에서 지원되는 그래디언트
  - 선형 그래디언트 &lt;linearGradient id="..." 속성들>내용&lt;linearGradient>
    - 내용의 표현 : &lt;stop> &lt;animate> &lt;set> ,....
      - 속성 offset, color opacity
  - 원형 그래디언트 &lt;radialGradient id="..." 속성들>내용&lt;radialGradient>
    - gradientUnits = "userSpaceOnUse | objectBoundingBox"
    - cx, cy, r : 원형 그래디언트의 중심 및 크기
    - fx, fy : 그래디언트 변화의 시작점

- 패턴(Pattern)

  - &lt;defs>에서 패턴을 정의, fill/stroke에서 속성으로 참조(사용)
  - patternUnits="userSpaceOnUse | objectBoundingBox"
  - x, y, width, height : 패턴의 뷰포트 크기
  - viewBox : 패턴의 뷰박스
  - preserveAspectRatio="none" 인 경우 뷰포트에 크기 맞춤

- 마스킹(Masking)

  - 마스크 효과(알파 채널)
  - &lt;g>, &lt;그래픽 객체> 등 그리기에서 mask속성으로 참조(사용)

- 투명도의 특성

  - 객체와 그룹의 투명도 처리
  - 각 객체의 투명도를 적용하여 렌더링한 후 그룸의 렌더링을 적용

- Animation 기본

  - &lt;animate.../> 시간 축에 속성이나 특성의 수치 값을 할당
  - &lt;set.../> 비수치값을 가지는 속성 애니메이션
  - &lt;animateMotion.../> 패스에 따라 이동
  - &lt;animateTransform.../> 색상 애니메이션
  - &lt;animateTransform../> 변환 애니메이션

- 