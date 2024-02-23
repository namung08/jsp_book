# chapter03 JSP로 시작하는 웹 프로그래밍
## 01 JSP에서 HTML 문서를 생성하는 기본 코드 구조
 - 01행     : 설정 부분 -> JSP 페이지에 대한 설정 정보
  > JSP 페이지가 생성하는 문서의 타입(종류)<br>
  > JSP 페이지에서 사용할 커스텀 태그<br>
  > JSP 페이지에서 사용할 자바 클래스 지정<br>
 - 02-16행  : 생성부분  -> HTML 코드 및 JSP 스크립트

 [HTML 문서의 제목](default.jsp)
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
|------------|------|
| page       | JSP 페이지에 대한 정보를 지정한다. 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 JSP 페이지에서 필요로 하는 정보를 설정 |
| taglib     | 사용할 태그 라이브러리를 지정 |
| include    | 특정 영역에 다른 문서를 포함시킴 |

### 02.2 스크립트 요소
 - 요소 : 스크립트릿(Scriptlet), 표현식(Expression), 선언부(Declaration)
 - JSP에서 문서의 내용을 동적으로 생성하기 위해 사용되는 것
 - 사용자가 폼에 입력한 정보를 데이터베이스에 저장할 수 있음
 - 게시글 목록을 읽어와 출력할 수도 있다.
 - 스크립트를 사용하면 자바가 제공하는 다양한 기능도 사용할 수 있음

### 02.3 기본 객체
 - 종류 : request, response, session, application, page 등
 - 이들 기본 객체를 모든 JSP 페이지에서 사용하는 것은 아님
 - request, response, session를 주로 사용

### 02.4 표현 언어
 - JSP의 스크립트 요소는 자바 문법을 그대로 사용할 수 있기 때문에, 자바 언어의 특징을 그대로 사용할 수 있다는 장점이 있다. 하지만 JSP코드가 다소 복잡해짐
 ```jsp
 <%
    int a = Integer.parseInt(request.getParameter("a"));
    int b = Integer.parseInt(request.getParameter("b"));
 %>
 a * b =<%= a * b %>
 ```
 - 위 코드를 표현 언어를 사용한다면 다음과 같이 간결하게 작성할 수 있다.
 ```jsp
 a * b = ${param.a * param.b}
 ```
 - 표현언어는 '${' 와 '}' 사이에 정해진 문법을 따르는 식을 입력한다
 - 위 코드처럼 JSP 스크립트 코드를 사용하는 것보다 표현 언어를 사용하느 것이 코드를 간결하고 이해하기 좋게 만들어주기 때문에, 특별한 이유가 없는 한 표현 언어를 주로 사용

### 02.5 표준 액션 태그와 태그 라이브러리
 #### 액션 태그
  - 액션 태그는 JSP 페이지에서 특별할 기능을 제공. 예를 들어, 다음 코드는 <jsp:include>가 액션 태그인데, 이 액션 태그는 특정한 페이지의 실행 결과를 현재 위치에 포함시킬 때 사용
  ```jsp
  <%@ page contentType="text/html; charset=utf-8"%>
  <html>
  ...
  <jsp:include page="header.jsp" flush="true"/>
  ...
  </html>
  ```
  - 액션 태그는 <jsp:액션태그이름>의 형태를 띠며 액션 태그 종류에 따라 서로 다른 속성과 값을 가짐
 #### 태그 라이브러리
  - JSTL(JavaServer Pages Standard Tag Library)
  - 커스텀 태그 중에서 자주 사용하는 것들을 별도로 표준화한 태그 라이브러리
   > ##### 커스텀 태그란?
   >  - JSP를 확장시켜주는 기능
   >  - 액션 태그와 마찬가지로 태그 형태로 기능을 제공
   >  - JSP 코드에서 중복되는 것을 모듈화 하거나 스크립트 코드를 사용할 때 발생하는 소스 코드의 복잡함을 없애기 위해서 사용
   >  - 액션 태그와 다른점이 있다면 개발자가 직접 개발해 주어야 한다.
  - if-else 조건문 그리고 for 구문과 같은 반복 처리를 커스텀 태그를 이용하여 구현 가능

## 03 page 디렉티브
 - 작성 예
 ```jsp
 <%@ page contentType="text/htmll; charset=utf-8"%>
 <%@ page import="java.util.Date"%>
 ```
 - page 디렉티브의 주요 속성
> | 속성 | 설명 | 기본값 |
> |------|------|------|
> |contentType|JSP가 생성할 문서의 MIME 타입과 캐릭터 인코딩을 지정한다.|text/html|
> |import|JSP 페이지에서 사용할 자바 클래스를 지정한다.||
> |session|JSP 페이지가 세션을 사용할지의 여부를 지정한다.<br>"none"일 경우 출력 버퍼를 사용하지 않으며, "8kb"라고 입력한 경우 8킬로바이트 크기의 출력 버퍼를 사용한다.|최소 8kb|
> |autoFlush|출력 버퍼가 다 찼을 경우 자동으로 버퍼에 있는 데이터를 출력 스트림에 보내고 비울지 여부를 나타낸다.<br>"true"인 경우 버퍼의 내용을 웹 부라우저에 보낸 후 버퍼를 비우며, "false"인 경우 에러를 발생시킨다.||
> |info|JSP 페이지에 대한 설명을 입력한다.||
> |errorPage|JSP 페이지를 실행하는 도중에 에러가 발생할 때 보여줄 페이지를 지정한다.||
> |isErrorPage|현재 페이지가 에러를 발생될 때 보여주는 페이지인지의 여부를 지정한다.<br> "true"일 경우 에러 페이지이며, "false"일 경우 에러 페이지가 아니다.|false|
> |pageEncoding|JSP 페이지 소스 코드의 캐릭터 인코딩을 지정한다.||
> |isELIgnored|"treu"일 경우 표현 언어를 해석하지 않고 문자열로 처리하며, "false"일 경우 표현 언어를 지원한다.|false|
> |deferredSysntaxAllowedAsLiteral|#{ 문자가 문자열 값으로 사용되는 것을 혀용할지의 여부를 지정한다.|false|
> |trimDirectiveWhitespaces|출력 결과에서 템플릿 텍스트의 공백 문자를 제거할지의 여부를 지정한다.|false|
### 03.1 contentType 속성과 캐릭터 셋
 - contentType 속성은 JSP 페이지가 생성할 문서의 타입을 지정한다.
 - UTF-8 캐릭터 셋을 이용하는 XML 문서를 생성
   -> MIME 타입   : "text/xml"
      charset     : "UTF-8"
      ```jsp
      <%@  page contentType="text/xml %>
      ```
 - 인코딩을 올바르게 입력하지 않아 글자가 올바르게 출력이 되지 않은 예
[현재시간](invalidCharset.jsp)
 ```jsp
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=iso-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
	<%Date now = new Date(); %>
	현재시각 : <%= now %>
</body>
</html>
 ```
 `결과 : í˜„ìž¬ì‹œê° : Thu Feb 22 17:26:20 KST 2024`<br>
 `해결 방법 : charset=iso-8859-1 -> charset=utf-8`
### 03.2 import 속성
 - JSP는 page 디렉티브의 import 속성을 사용해서 JSP 코드에서 클래스의 단순 이름을 사용할 수 있다.
  > ```jsp
  > <%@ page import = "java.util.Calendar" %>
  > <%@ page import = "java.util.Date" %>
  > ```
 - import 속성 값으로 여러 타입을 지정할 수 있다.
  > ```jsp
  > <%@ page import = "java.util.Calendar, java.util.Date" %>
  > ```
  [Calendar 클래스 사용](useImportCalendar.jsp)
  ```jsp
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar 클래스 사용</title>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	오늘은
	<%= cal.get(Calendar.YEAR) %>년
	<%= cal.get(Calendar.MONTH)+1 %>월
	<%= cal.get(Calendar.DAY_OF_MONTH) %>일
	입니다.
</body>
</html>
  ```