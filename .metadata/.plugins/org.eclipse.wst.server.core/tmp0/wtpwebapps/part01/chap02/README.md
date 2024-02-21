## time.jsp에서 시간을 출력해 주는 부분
```java
현재 : <%= new java.util.Date() %>
```
 - java.util.Date는 시간 값을 처리할 때 사용되는 자바 클래스다. <%=와 %>는 스크립트릿(scriptlet) 이라는 JSP의 스크립트 요소로서 <%=와 %> 사이에 위치한 값을 문자열로 생성해 준다.
