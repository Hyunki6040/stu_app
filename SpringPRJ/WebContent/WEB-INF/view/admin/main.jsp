<%@page import="poly.dto.AdminDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% AdminDTO admin = (AdminDTO)request.getAttribute("admin"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<h1>어서오세요! <%=admin.getName()%>캠퍼스 관리자 페이지입니다.</h1>
<hr/>
<h2>메뉴 설정</h2>
1.메뉴 url
2. 메뉴 타입
3. board 신고 제한
4. 닉네임/학적 조회
5. 게시판글 삭제
6. 게시판 사용 제한
7. 로고url
</body>
</html>