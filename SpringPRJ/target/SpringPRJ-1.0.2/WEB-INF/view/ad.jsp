<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광고 페이지</title>
</head>
<body>
	<!-- 광고 -->
	<h1>광고</h1>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script> // jQuery 최신버전
	<%int time = 5; %>
	<script type="text/javascript">
	
	$(document).ready(function(){
		setInterval("ozit_interval_test()", 1000);
		setTimeout("get_button()", 5000);
	});
	
	function get_button(){
		<%session.setAttribute("ad", "");%>
	    $("form").append("<input type="button" value="광고 닫기" onclick="window.location.href='index.do'" />");
		}
	function timer(){
		if(time > 0){
		<%time -= 1;%>
		}
	}
	</script>
	<p>${time}초 뒤에 광고를 닫을 수 있습니다..</p>
	<form>
	</form>
</body>
</html>