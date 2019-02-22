<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광고 페이지</title>
</head>
<body>
	<div align="center">
		<%
			int num = (int) (Math.random() * 4);
		%>
		<c:set var="num" value="<%=num%>" />
		<c:choose>
			<c:when test="${num == '0'}">
				<!-- 애드핏50 -->
				<ins class="kakao_ad_area" style="display: none;"
					data-ad-unit="DAN-1ibh1ykeyjtpz" data-ad-width="320"
					data-ad-height="50"></ins>
				<script type="text/javascript"
					src="//t1.daumcdn.net/adfit/static/ad.min.js" async></script>
			</c:when>
			<c:when test="${num == '1'}">
				<!-- 애드핏100 -->
				<ins class="kakao_ad_area" style="display: none;"
					data-ad-unit="DAN-sl8wrv8e7u45" data-ad-width="320"
					data-ad-height="100"></ins>
				<script type="text/javascript"
					src="//t1.daumcdn.net/adfit/static/ad.min.js" async></script>
			</c:when>
			<c:when test="${num == '2'}">
				<!-- 클릭몬 광고 100 -->
				<iframe width="320" height="100" allowtransparency="true" src="https://mtab.clickmon.co.kr/pop/wp_m_320_100.php?PopAd=CM_M_1003067%7C%5E%7CCM_A_1051222%7C%5E%7CAdver_M_1046207&mon_rf=REFERRER_URL" frameborder="0" scrolling="no"></iframe>
			</c:when>
			<c:otherwise>
				<!-- 클릭몬 광고 50 -->
				<iframe width="320" height="50" allowtransparency="true" src="https://mtab.clickmon.co.kr/pop/wp_m_320.php?PopAd=CM_M_1003067%7C%5E%7CCM_A_1051222%7C%5E%7CAdver_M_1046207&mon_rf=REFERRER_URL" frameborder="0" scrolling="no"></iframe>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>