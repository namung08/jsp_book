# chapter03 JSP로 시작하는 웹 프로그래밍
## 01 JSP에서 HTML 문서를 생성하는 기본 코드 구조
`chap03/default.jsp`
 - 01행     : 설정 부분 -> JSP 페이지에 대한 설정 정보
  > JSP 페이지가 생성하는 문서의 타입(종류)<br>
  > JSP 페이지에서 사용할 커스텀 태그<br>
  > JSP 페이지에서 사용할 자바 클래스 지정<br>
 - 02-16행  : 생성부분  -> HTML 코드 및 JSP 스크립트
```jsp
<!-- 이 코드는 JSP 페이지가 생성할 문서가 HTML이며 java 언어를 사용, 문서의 캐릭터 셋(character set)이 UTF-8인 것을 나타낸다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
```
## 02 JSP 페이지의 구성 요소
 - 디렉티브(Directive)
 - 스크립트 : 스크립트릿(Scriptlet), 표현식(Expression), 선언부(Declaration)
 - 표현 언어(Expression Language)
 - 기본 객체(Implicit Object)
 - 정적인 데이터
 - 표준 액션 태그(Action Tag)
 - 커스텀 태그(Custom Tag)와 표준 태그 라이브러리(JSTL)
### 02.1 디렉티브 
 - 디렉티브는 JSP 페이지에 대한 설정 정보를 지정할 때 사용되며, 다음과 같이 선언할 수 있다.
 ```jsp
 <%@ 디렉티브이름 속성1="값1" 속성2="값2" ...%>
 ```
 `chap03/default.jsp`의 01행을 다시 보도록 하자
 ```jsp
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 ```
 - 여기서 디렉티브 이름은 "page"가 되고 language, contentType, pageEncoding라는 속성을 사용했으며 속성값은 각각 java, text/html; charset=UTF-8, UTF-8이 된다.
 JSP가 제공하는 디렉티브는 다음 표와 같다
| 디렉티브   | 설명 |
|---------  |---------|
| page      | JAP 페이지에 대한 정보를 지정한다. 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 JSP 페이지에서 필요로 하는 정보를 설정|
| taglib    | 사용할 태그 라이브러리를 지정 |
| include   | 특정 영역에 다른 문서를 포함시킴 |
