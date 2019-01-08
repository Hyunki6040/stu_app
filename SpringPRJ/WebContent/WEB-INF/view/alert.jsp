<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //이 jsp는 문자열 2개를 전송 받음 
   //1개는 경고창 문구
   //다른 1개는 경고창을 띄운뒤 이동할 Controller
   String msg = (String)request.getAttribute("msg");//Notice경고창 문구
   String url = (String)request.getAttribute("url");//Notice경고창을 띄운뒤 이동할 Controller
%>
<script>
   var msg = '<%=msg%>';
   var url = '<%=url%>';
   alert(msg);
   location.href=url;
</script>
<%=msg%>
<%=url%>