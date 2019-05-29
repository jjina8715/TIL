# CSS3

- 선택자

  - 전체 선택자 : *

  - 태그 선택자(타입선택자) : 태그명

  - 그룹선택자 : 태그명, 태그명, ....

  - 클래스선택자 : .class속성값

  - 아이디 선택자 : #id속성값

  - 자식선택자 : 부모태그>자식태그

  - 형제선택자 : 언니태그~동생태그(다수) / 언니태그+동생태그(하나)

  - 속성선택자  : [속성명]

    ​						[속성명=속성값]

    ​						[속성명^=속성값]

    ​						[속성명$=속성값] : img[src$=png] png로 끝나는 주소

  - PSEUDO-CLASS 

    - :hover / :link / :active / :before / :after

  - PSEUDO-ELEMENT

    -  ::first-letter / ::first-line
  
- HTML태그에 대한 randering 규칙

  - 태그마다 출력되는 영역을 정하는 규칙에 따라 inlinestyle 태그와 blockstyle태그로 나뉜다.
  - lnlinestyle: a, img, input, span,  ....
  
  - blockstyle: hn, div(시맨틱 태그들), table, ul, ol, p, form, ....
  
- 주요 스타일 속성

  |           | 속성                                                         |
  | --------- | ------------------------------------------------------------ |
  | 문자      | font-family, font-size, font-style, font-weight, font-variant, font |
  | 문단      | text-decoration, text-align, text-indent, text-transform, letter-spacing, word-spacing |
  | 테두리    | border-width, border-style, border-color                     |
  | 리스트    | list-style-type, list-style-image, list-style-position, list-style |
  | 배경      | background-color, background-image, background-repeat,  background-attackment |
  | 테이블    | border-collapse, border-spacing,  empty-cells, table-layout, vertical-align |
  | 박스 모델 | margin, margin-top/right/bottom/left, padding, padding-top/right/bottom/left        border, border-style, border-width, border-color, border-top/right/bottom/left |

- 고급 스타일 효과

  - shadow, gradient(linear, radial), navigation, dropdown, gallery, .....

- 레이아웃

  - 고정형 레이아웃
  - 유동형 레이아웃
  - 반응형 레이아웃
  - 속성
    - overflow: visible, hidden, scroll, auto, inherit
    - display: inline, block, none, inline-block
    - visibility: visible, hidden, collapse
    - position: static, relative, absolute, fixed
    - z-index: suto, number, initial
    - float: none, left, right, initial, inherit
    - clear: none, left, right, both
  - 뷰포트의 속성
    - width, height, initial-scale, mininum-scale, maxmum-scale, user-scalable
    - 