<%@page import="poly.dto.AdminDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.StuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>

<%
	String barcode = "";
	String stu_no = "";
	AdminDTO setting = new AdminDTO();
	String stu_name = "";
	try {
		barcode = CmmUtil.nvl((String) request.getAttribute("barcode"));
		stu_no = (String) session.getAttribute("stu_no");
		setting = (AdminDTO) session.getAttribute("setting");
		stu_no.length();
		try {
			//로그인 상태일 경우
			stu_name = CmmUtil.nvl((String) request.getAttribute("stu_name"));
			stu_name.length();
		} catch (Exception e) {
			stu_name = "";
		}

		if (stu_no.length() > 0 && stu_name.length() < 1) {
			session.removeAttribute("payment");
		}
%>
<%
	} catch (NullPointerException e) {
		barcode = "";
		stu_no = "";
		setting = new AdminDTO();
	}
%>



<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- google search console -->
<meta name="google-site-verification"
	content="fmwWNBeeDXocdy7HrWoXGlNlWUZlKzB0gnV1mXsU8pE" />
<!-- ReCaptcha -->
<script
	src='https://www.google.com/recaptcha/api.js?render=6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv'></script>
<script>
	grecaptcha.ready(function() {
		grecaptcha.execute('6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv', {
			action : 'login_captcha'
		}).then(function(token) {
			// Verify the token on the server.
			document.getElementById('g-recaptcha-response').value = token;
		});
	});
</script>

<!-- 광고 인증 -->
<script async
	src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
	(adsbygoogle = window.adsbygoogle || []).push({
		google_ad_client : "ca-pub-2201519259553144",
		enable_page_level_ads : true
	});
</script>


<%
//저장된 비어있는 쿠키(자동로그인) 삭제
	if (session.getAttribute("logout") == "1") {
%>
<script>
	location.href = "/logout.do";
</script>
<%
	}

	//관리자로 접속시 관리자 페이지로 이동(관리자페이지 미구현)
	if (stu_no.contains("admin")) {
%>
<script>
	location.href = "/admin/main.do";
</script>
<%
	}
//session+model 만료시 새로고침
	if (stu_no.length()>0 && stu_name.length()<1) {
%>
<script>
	location.href = "/";
</script>
<%
	}
%>
<!-- Title -->
<title>한국폴리텍대학 어플리케이션(재학생) v2</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/credit-icon.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/classy-nav.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="scss/_fonts.scss">
<link rel="stylesheet" href="scss/_mixin.scss">
<link rel="stylesheet" href="scss/_responsive.scss">
<link rel="stylesheet" href="scss/_theme_color.scss">
<link rel="stylesheet" href="scss/style.scss">

</head>

<body oncontextmenu='return false' onselectstart='return false'
	ondragstart='return false' style="font-family: Binggrae, sans-serif;">
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">


		<!-- Navbar Area -->
		<div class="pixel-main-menu" id="sticker">
			<div class="classy-nav-container breakpoint-off">
				<div class="container-fluid" style="background-color: #FFFFFF;">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="pixelNav">

						<!-- Nav brand -->
						<a href="/" class="nav-brand"
							style="font-weight: bold; color: #FFBB00">PolyTechCardApp</a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Nav Start -->
							<div class="classynav" style="padding-top: 50px;">
								<ul>
									<li><a href="/">메인페이지</a></li>

									<%
										if (stu_no.length() > 0) {
									%>
									<li><a href="change.do">학생정보수정</a></li>
									<li><a href="https://pf.kakao.com/_xdKxlvj/chat">[오류 및 불편 신고] / [광고문의]</a></li>
									<%
										if (setting.getCampus().equals("1.2")) {
									%>
									<li><a href="https://pf.kakao.com/_vcxgMj">총학생회</a></li>
									<%
										}
									%>
									<li><a href="/logout.do">로그아웃</a></li>
									<%
										} else {
									%>
									<li><a href="/campus.do">회원가입</a></li>
									<li><a href="/find_pw.do">비밀번호찾기</a></li>
									<%
										}
									%>

								</ul>

								<%
									if (stu_no.length() > 0) {
									} else {
								%>

								<!-- 로그인 폼 -->
								<div class="top-social-info ml-5">
									<form action="/loginProc.do" method="post">
										<p style="margin-bottom: 0px;">학번</p>
										<input type="text" name="id" style="width: 213px;" required="">

										<p style="margin-top: 20px; margin-bottom: 0px;">비밀번호</p>
										<input type="password" name="password" required=""
											style="font-family: caption; width: 213px;">
										<div class="check-text">
											<ul>
												<li style="margin-top: 20px;"><input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha"><input
													type="checkbox" id="brand" value="" name="useCookie">
													<label for="brand" style="margin-right: 50px;"><span></span>로그인유지</label>
													<input type="submit" value="로그인"
													style="background-color: #86E57F; color: #FFFFFF; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; width: 60px; height: 30px;">
												</li>
											</ul>
										</div>
									</form>
								</div>
								<%
									}
								%>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<!-- -----------메인 페이지--------------- -->
	<div class="pixel-portfolio-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center wow fadeInUp"
						data-wow-delay="100ms">
						<%
							if (stu_no.length() > 0) {
						%>
						<h4 style="color: #F2CB61">오늘의 학식</h4>
						<div
							style="border: 3px solid; border-radius: 10px; border-color: #FFE08C;">
							<!--  메뉴표시 -->
							<jsp:include page="web_crolling.jsp" flush="false">
								<jsp:param value="<%=setting.getMenu_url()%>" name="url" />
								<jsp:param value="<%=setting.getMenu_type()%>" name="menu_type" />
							</jsp:include>
						</div>
						<%
							} else {
						%>

						<div
							style="border: 3px solid; border-radius: 10px; border-color: #FFE08C;">
							<!--  메뉴표시 -->
							<h4>
								<a href="/campus.do" style="color: #F2CB61">Click! 학적사항으로<br />회원가입을
									해주세요.
								</a>
							</h4>

						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>

		<!-- 버튼 -->
		<div class="pixel-projects-menu wow fadeInUp" data-wow-delay="200ms">
			<div class="text-center portfolio-menu">
				<%
					if (stu_no.length() > 0) {
				%>
				<button class="btn" data-filter=".barcode">학식카드</button>
				<button class="btn" data-filter=".stu">학생증</button>

				<%
					} else {
				%>
				<button class="btn active" data-filter=".visual">학식카드/학생증</button>
				<%
					}
				%>
				<button class="btn" onclick="location.href='/board.do'">커뮤니티</button>
				<button class="btn" data-filter=".ad">AD</button>

			</div>
		</div>

		<div class="pixel-portfolio">
			<!--------------------------------------------- 공지사항-------------------------->
			<div class="single_gallery_item notice wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/alarm.png" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<h4 style="margin-top: 50px; color: #000000;">시스템 공지사항입니다.</h4>
					</div>
				</div>
			</div>
			<!-- 광고 -->
			<div class="single_gallery_item ad wow" data-wow-delay="0.2s">
				<%@include file="ad/ad_index.jsp"%>
			</div>

			<%
				if (stu_no.length() > 0) {
			%>
			<!--------------------------------------------- 학식카드 바코드-------------------------->

			<div class="single_gallery_item barcode wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/pizza.png" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<img
							src='https://barcode.tec-it.com/barcode.ashx?data=<%=barcode%>&code=Code128&dpi=96&dataseparator='
							alt='Barcode Generator TEC-IT' />
						<h4 style="margin-top: 50px; color: #000000;">
							바코드 인식 실패시<br /> 휴대폰 밝기를 최대로 설정해주세요.
						</h4>
					</div>
				</div>
			</div>


			<!------------------------------------------- 학생증----------------------------------------->

			<div class="single_gallery_item stu wow fadeInUp"
				data-wow-delay="0.4s">
				<img src="img/bg-img/card.png" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">

						<table
							style="background: #FbFbFb url(img/bg-img/capture1.gif) no-repeat left; height: 360px; width: 360px; border-radius: 30px;">
							<tbody>

								<tr>
									<td colspan="2"><img src="<%=setting.getLogo_url()%>"
										style="width: 138px; height: 50px;" /></td>
								</tr>

								<tr>
									<td rowspan="9" style="width: 200px; height: 200px;">
										<%
											if (CmmUtil.nvl((String) request.getAttribute("photo")).length() > 0) {
										%> <img
										src="<%=CmmUtil.nvl((String) request.getAttribute("photo"))%>"
										/200x200 /> <%
 	} else {
 %> <a href="/change.do"><br /> <br /> <br /> <img
											src="img/bg-img/profile.png" /200x200 /><br /> <br />
											<p style="color: red; font-weight: 800;">클릭! 이미지를 변경해주세요</p>
									</a> <%
 	}
 %>
									</td>
									<td
										style="float: left; margin-top: 10px; margin-left: 10px; height: 30px;">
										<p>학번</p>
									</td>
								</tr>
								<tr>
									<td colspan="2"><%=CmmUtil.nvl((String) request.getAttribute("stu_no"))%></td>
								</tr>
								<tr>
									<td colspan="2"
										style="float: left; margin-top: 10px; margin-left: 10px; height: 30px;">
										<p>학과</p>
									</td>
								</tr>
								<tr>
									<td><%=CmmUtil.nvl((String) request.getAttribute("department"))%></td>
								</tr>
								<tr>
									<td colspan="2"
										style="float: left; margin-top: 10px; margin-left: 10px; height: 30px;">
										<p>이름</p>
									</td>
								</tr>
								<tr>
									<td><%=CmmUtil.nvl((String) request.getAttribute("stu_name"))%></td>
								</tr>

								<tr>
									<td colspan="2"
										style="float: left; margin-top: 10px; margin-left: 10px; height: 30px;">
										<p>생년월일</p>
									</td>
								</tr>
								<tr>
									<td><%=CmmUtil.nvl((String) request.getAttribute("birthday"))%></td>
								</tr>
								<tr>
									<td colspan="2"
										style="float: left; margin-top: 10px; margin-left: 10px;"><p>
											학생회비 :

											<%
										if (CmmUtil.nvl((String) request.getAttribute("payment")).equals("1")) {
									%>

											<span style="font-color: black">납부</span>

											<%
												} else if (CmmUtil.nvl((String) request.getAttribute("payment")).equals("2")) {
											%>
											<span style="font-color: black">기능사</span>

											<%
												} else {
											%>
											<span style="color: red; font-weight: 800;">미납</span>
										</p> <%
 	}
 %></td>
								</tr>
								<tr>
									<td colspan="2"><img src="img/stamp/stamp${campus}.png"
										oncontextmenu="return false"
										style="width: 250px; height: 40px; -webkit-touch-callout: none;" /></td>
								</tr>
							</tbody>
						</table>
						<%
							} else {
						%>
						<!--------------------------------------------- 비회원-------------------------->
						<div class="single_gallery_item visual wow fadeInUp"
							data-wow-delay="0.2s">
							<img src="img/bg-img/alarm.png" alt="">
							<div
								class="hover-content text-center d-flex align-items-center justify-content-center">
								<div class="hover-text">
									<h4 style="margin-top: 50px; color: #000000;">
										비회원은 이용 하실 수 없는 서비스입니다.<br />학적사항을 입력해 가입해 주시기 바랍니다.
									</h4>
								</div>
							</div>
						</div>
						<%
							}
						%>

					</div>
				</div>
			</div>

		</div>
		<!-- ##### Portfolio Area End ###### -->


		<!-- ##### All Javascript Script ##### -->
		<!-- jQuery-2.2.4 js -->
		<script src="js/jquery/jquery-2.2.4.min.js"></script>
		<!-- Popper js -->
		<script src="js/bootstrap/popper.min.js"></script>
		<!-- Bootstrap js -->
		<script src="js/bootstrap/bootstrap.min.js"></script>
		<!-- All Plugins js -->
		<script src="js/plugins/plugins.js"></script>
		<!-- Active js -->
		<script src="js/active.js"></script>

		<footer>
			<div align="center">
				<!-- 애드핏 -->
				<ins class="kakao_ad_area" style="display: none;"
					data-ad-unit="DAN-t4sxu7qo3igl" data-ad-width="320"
					data-ad-height="50"></ins>
				<script type="text/javascript"
					src="//t1.daumcdn.net/adfit/static/ad.min.js" async></script>
				<hr>
			</div>
			<!-- footer :: s -->
			<div class="home-footer ">
				<a class="footer__logo" href="/">한국폴리텍대학 어플리케이션(재학생) v2</a>
				<div class="footer__wrap">

					<div class="footer__info-wrap">
						<div class="footer__info">
							<address class="footer__info-address" style="font-size: 0.9em;">
								[07684] 서울특별시 강서구 우장산로10길 112&nbsp;&nbsp;<br />TEL
								010-6575-6040<br /> &nbsp;&nbsp;E-MAIL <span
									style="font-size: 1.1em; font-weight: bold; color: black;"></span>tostit.korea@gmail.com
								</span><br /> <small class="footer__info-copy">COPYRIGHT 2019
									BY Co.TostIt!. ALL RIGHTS RESERVED.</small><br> <small
									class="footer__info-copy">한국폴리텍대학 서울강서캠퍼스 데이터분석과<br />
									개발팀 : user8315팀
								</small> <small class="footer__info-copy">[18학번. 길현준 김현기 홍승호]</small>
							</address>
							<p class="footer__info-small">본 웹사이트에 게시된 이메일 주소가 전자우편 수집
								프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해
								형사처벌 됨을 유념하시기 바랍니다.</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- 미납자 광고 -->
		<%
			if (CmmUtil.nvl((String) request.getAttribute("payment")).equals("0")) {
		%>


		<%
			}
		%>
	
</body>

</html>