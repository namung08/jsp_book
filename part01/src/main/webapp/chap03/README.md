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
<%@page language="java" contentType="text/html; charset=UTF-8"
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

### 03.3 trimDirectiveWhitespaces 속성을 이용한 공백처리
 - [현재 시간](../chap02/time.jsp)을 실행 한 뒤 브라우저에서 소스 보기를 해 보면 첫 줄에 빈 줄이 생성이 된다. 이 부분은 page 디렉티브가 있던 위치에서 만들어진 것이다.
 - trimDirectiveWhitespaces 속성을 이용하면 불필요하게 생성되는 줄바꿈 공백 문자를 제거할 수 있다.
 
 [현재 시각](time.jsp)
 ```jsp
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지금 시간</title>
</head>
<body>
현재 : <%= new java.util.Date() %>
</body>
</html>
 ```

### 03.4 JSP 페이지의 인코딩과 pageEncoding 속성
 - JSP 파일을 읽을 때는 page 디렉티브의 pageEncoding 속성과 conetentType 속성을 사용해서 캐릭터 인코딩을 결정한다.

## 04 스크립트 요소
 ### 04.1 스크립트릿
  - JSP 페이지에서 자바 코드를 실행할 때 사용하는 코드 블록
  ```jsp
  <%
   자바코드1;
   자바코드2;
   자바코드3;
   ...
  %>
  ```
[1~10까지의 합](oneToTen.jsp)
```jsp
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1~10까지의 합</title>
</head>
<body>
	<%
		int sum = 0;
		for(int i=1;i<=10;i++) {
			sum += i;
		}
	%>
	1~10까지의 합은 <%= sum %> 입니다.
</body>
</html>
  ```
  ### 04.2 표현식
   - 어떤 값을 출력 결과에 포함시키고자 할 때 사용
   ```jsp
   <%= 값%>
   ```
   - 표현식은 '<%=>' 로 시작해서 '%>' 로 끝남
   
[1~10까지의 합](oneToTen2.jsp)
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1~10까지의 합</title>
</head>
<body>
	1~10까지의 합은
	<%=1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10%>
	입니다.
</body>
</html>
   ```

### 04.3 선언부
```jsp
<%!
  public 리턴타입 메서드이름(파라미터목록) {
    자바코드1;
    자바코드2;
    ...
    자바코드n;
    return 값;
  }
%>
```
 - [선언부를 사용하여 두 정수의 곱을 계산해주는 예](useDecl.jsp)
```jsp
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
public int multiply(int a, int b) {
	int c = a * b;
	return c;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부를 사용한 두 정수값의 곱</title>
</head>
<body>
10 * 25 = <%= multiply(10, 25) %>
</body>
</html>
```
## 05. request 기본 객체
 - JSP 페이지에서 가장 많이 사용되는 기본 객체
 - 웹 브라우저에 웹 사이트의 주소를 입력하면, 웹 브라우저는 해당 웹 서버에 연결한 후 요청 정보를 전송하는데, 이 요청 정보를 제공하는 것이 request 이다. 
 >- 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
 >- 서버와 관련된 정보 읽기
 >- 클라이언트가 전송한 요청 파라미터 읽기 기능
 >- 클라이언트가 전송한 요청 헤더 읽기 기능
 >- 클라이언트가 전송한 쿠키 읽기 기능
 >- 속성 처리 기능
### 05.1 클라이언트 정보 및 서버 정보 읽기
|메서드|리턴 타입|설명|
|-----|------|-----|
|getRemoteAddr()|String|웹 서버에 연결한 클라이언트의 ip 주소를 구한다|
|getContentLength()|long|클라이언트가 전송한 요청 정보의 길이를 구한다|
|getCharacterEncoding()|String|클라이언트가 요청 정보를 전송할 때 사용한 캐릭터의 인코딩을 구한다|
|getContentType()|String|쿨라이언트가 요청 정보를 전송할 때 사용한 컨탠츠의 타입을 구한다|
|getProtocol()|String|클라이언트가 요청한 프로토콜을 구한다|
|getMethod()|String|웹 브라우저가 정보를 전송할 때 사용한 방식을 구한다|
|getRequestURI()|String|웹 브라우저가 요청한 URL에서 경로를 구한다|
|getContextPath()|String|JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다|
|getServerName()|String|연결할 때 사용한 서버 이름을 구한다|
|getServerPort()|int|서버가 실행중인 포트 번호를 구한다|
- [클라이언트 및 서버 정보](requestInfo.jsp)
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
	클라이언트IP = <%= request.getRemoteAddr() %> <br>
	요청정보길이  = <%= request.getContentLength() %><br>
	요청정보 인코딩 = <%= request.getCharacterEncoding() %><br>
	요청정보 컨텐츠타입 = <%= request.getContentType() %> <br>
	요청정보 프로토콜 = <%= request.getProtocol() %><br>
	요청정보 전송방식 = <%= request.getMethod() %><br>
	요청 URL = <%= request.getRequestURI() %><br>
	컨텍스트 경로 = <%= request.getContextPath() %><br>
	서버이름 = <%= request.getServerName() %><br>
	서버 포트 =  <%= request.getServerPort() %><br>
</body>
</html>
```
### 05.2 요청 파라미터 처리
 - HTML 폼의 각 입력 요소는 이름을 갖는다. 이름 입력을 위한 `<input>` 태그의 name 속성은 "name" 이고 주소 입력을 위한 `<input>` 태그의 name 속성은 "address"인데, name 속성의 값이 입력 요소의 이름이 된다.
 #### 05.2.2 request 기본 객체의 요청 파라미터 관련 메소드
  - request 기본 객체는 웹 브라우저가 전송한 파라미터를 읽어올 수 있는 메서드를 제공하고 있다.

  |메서드|리턴 타입|설명|
  |-----|-----|-----|
  |getParameter(String name)|String|이름이 name인 파라미터의 값을 구한다. 존재하지 않을 경우 null을 리턴한다|
  |getParameterValues(String name)|String[]|이름이 name인 모든 파라미터의 값을 배열로 구한다. 존재하지 않을 경우 null을 리턴한다|
  |getParameterNames()|java.util.Enumeration|웹 브라우저가 전송한 파라미터의 이름 목록을 구한다|
  |getParameterMap()|java.util.Map|웹 브라우저가 전송한 파라미터의 맵을 구한다. 맵은 <파라미터 이름, 값> 쌍으로 구성된다|
 - [파라미터 전송을 위한 폼](form.jsp)
 ```jsp
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 생성</title>
</head>
<body>
<form action="/chap03/viewParameter.jsp" method="post">
	이름 : <input type="text" name="name" size="10"> <br>
	주소 : <input type="text" name="address" size="30"> <br>
	좋아하는 동물 : 
		<input type="checkbox" name="pet" value="dog">강아지
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="pig">돼지
	<br>
	<input type="submit" value="전송">
</form> 
</body>
</html>
```
