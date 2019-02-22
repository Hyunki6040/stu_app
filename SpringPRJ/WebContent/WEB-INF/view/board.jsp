<%@page import="poly.dto.AdminDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.StuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%
	String stu_no = "";
	AdminDTO setting = new AdminDTO();

	try {
		setting = (AdminDTO) session.getAttribute("setting");
		stu_no = (String) session.getAttribute("stu_no");
		stu_no.length();
	} catch (NullPointerException e) {
		stu_no = "";
		setting = new AdminDTO();
	}

	//저장된 비어있는 쿠키 삭제

	if (session.getAttribute("logout") == "1") {
%>
<script>
	location.href = "/logout.do";
</script>
<%
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
	grecaptcha.ready(function() {
		grecaptcha.execute('6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv', {
			action : 'board_captcha'
		}).then(function(token) {
			// Verify the token on the server.
			document.getElementById('g-recaptcha-response').value = token;
		});
	});
	grecaptcha.ready(function() {
		grecaptcha.execute('6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv', {
			action : 'comment_captcha'
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
<!-- amp자동 광고 -->
<script async custom-element="amp-auto-ads"
	src="https://cdn.ampproject.org/v0/amp-auto-ads-0.1.js">
	
</script>
<!-- textarea 자동 크기 -->
<style>
.textarea_size {
	resize: none;
	line-height: 150%;
	width: 100%;
	overflow-y: hidden;
	height: 30px;
}
</style>


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

<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false' style="font-family: Binggrae, sans-serif;">
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

									<li><a href="https://pf.kakao.com/_vcxgMj">문의하기</a></li>
									<li><a href="/contact.do">회원가입</a></li>
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
										<input type="text" name="id" style="width:213px;" required="">

										<p style="margin-top: 20px; margin-bottom: 0px;">비밀번호</p>
										<input type="password" name="password" style="font-family:caption; width:213px;" required="">
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
		<!-- 버튼 -->
		<div class="pixel-projects-menu wow fadeInUp" data-wow-delay="200ms">
			<div class="text-center portfolio-menu">
				<%
					if (stu_no.length() > 0) {
				%>
				<button class="btn active" data-filter=".notice">공지사항</button>
				<button class="btn" data-filter=".politec">폴리텍 대나무숲</button>
				<button class="btn" data-filter=".campus">
					<%
						//=CmmUtil.nvl((String) request.getAttribute("campus"))
					%>
					캠퍼스 대나무숲
				</button>
				<button class="btn" data-filter=".mine">내글 모아보기</button>
				<button class="btn" data-filter=".writing">게시글 작성</button>
				<button class="btn" data-filter=".chat">채팅</button>
				<%
					} else {
				%>
				<button class="btn active" data-filter=".visual">사용안내</button>
				<button class="btn" data-filter=".politec">폴리텍 대나무숲</button>
				<button class="btn" data-filter=".chat">채팅</button>
				<%
					}
				%>


			</div>
		</div>




		<div class="pixel-portfolio">
			<!-- 광고 -->
			<div>
				<amp-auto-ads type="adsense"
					data-ad-client="ca-pub-2201519259553144"> </amp-auto-ads>
			</div>
			<!-- 광고 -->
			<!--------------------------------------------- 사용안내-------------------------->
			<div class="single_gallery_item visual wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/alarm.png" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<h4 style="margin-top: 50px; color: #000000;">
							비회원은 게시글/댓글 작성 및<br />캠퍼스 게시판 열람이 불가능합니다.
						</h4>
					</div>
				</div>

			</div>
			<%
				if (stu_no.length() > 0) {
			%>

			<!--------------------------------------------- 공지사항-------------------------->
			<c:forEach var="row" items="${board_list}">
				<c:if test="${row.writer == admin}">
					<div class="single_gallery_item notice wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 360px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy년 MM월 dd일" /> 공지 사항</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<br />
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>

			<!--------------------------------------------- 캠퍼스 게시판-------------------------->
			<div class="single_gallery_item campus wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/top.jpg" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<div class="pixel-projects-menu wow fadeInUp"
							data-wow-delay="200ms">
							<div class="text-center portfolio-menu">
								<button class="btn" data-filter=".campus_recently">최신순</button>
								<button class="btn  active" data-filter=".campus_best">인기순</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 최신순 -->
			<c:forEach var="row" items="${board_list}">
				<c:if test="${row.writer != admin && row.campus != univ_campus}">

					<div class="single_gallery_item campus_recently wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 260px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="font-weight: 800;">${row.writer}의 ${row.bno}번째 외침</div>
												
											</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div style="height: 70px;"
													class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredContext.do?bno=${row.bno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고 및 삭제 요청</a></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="height: 40px;"
													class="pixel-projects-menu wow fadeInUp"
													data-wow-delay="200ms">
													<div style="height: 40px;"
														class="text-center portfolio-menu">
														<button class="btn" data-filter=".comment${row.bno}">댓글
															보기</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<table
									style="background-color: #FFFFFF; height: 120px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="3" style="text-align: center;">댓글 작성</td>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center;">
												<div class="contact-form-area text-center">
													<form action="/CommentProc.do" method="post"
														id="submitForm" enctype="multipart/form-data">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden" name="bno" id="bno"
															value="${row.bno}">
														<div style="height: 60px;">
															<textarea style="height: 20px; width: 360px;"
																class="textarea_size"
																onchange="cmaTextareaSize('comments', 30);"
																onkeyup="cmaTextareaSize('comments', 30);"
																name="comments" id="comments"
																placeholder="댓글을 입력해주세요 (최대 30자)" required></textarea>
															<script>
																cmaTextareaSize(
																		'comments',
																		30);
															</script>
														</div>
														<div
															style="height: 40px; width: 350px; text-align: right;">
															<button type="submit" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">업로드</button>
															<button type="reset" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">취소</button>
														</div>
													</form>
												</div>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
					<div class="single_gallery_item campus_recently wow"
						data-wow-delay="0.2s" style="text-align: center;">
						<%@include file="ad/ad_board.jsp"%>
</div>
				</c:if>
			</c:forEach>
			<!-- 인기순 -->
			<c:forEach var="row" items="${board_best_list}">
				<c:if test="${row.writer != admin && row.campus != univ_campus}">

					<div class="single_gallery_item campus_best wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 260px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="font-weight: 800;">${row.writer}의 ${row.bno}번째 외침</div>
												
											</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div style="height: 70px;"
													class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredContext.do?bno=${row.bno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고 및 삭제 요청</a></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="height: 40px;"
													class="pixel-projects-menu wow fadeInUp"
													data-wow-delay="200ms">
													<div style="height: 40px;"
														class="text-center portfolio-menu">
														<button class="btn" data-filter=".comment${row.bno}">댓글
															보기</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<table
									style="background-color: #FFFFFF; height: 120px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="3" style="text-align: center;">댓글 작성</td>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center;">
												<div class="contact-form-area text-center">
													<form action="/CommentProc.do" method="post"
														id="submitForm" enctype="multipart/form-data">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden" name="bno" id="bno"
															value="${row.bno}">
														<div style="height: 60px;">
															<textarea style="height: 20px; width: 360px;"
																class="textarea_size"
																onchange="cmaTextareaSize('comments', 30);"
																onkeyup="cmaTextareaSize('comments', 30);"
																name="comments" id="comments"
																placeholder="댓글을 입력해주세요 (최대 30자)" required></textarea>
															<script>
																cmaTextareaSize(
																		'comments',
																		30);
															</script>
														</div>
														<div
															style="height: 40px; width: 350px; text-align: right;">
															<button type="submit" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">업로드</button>
															<button type="reset" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">취소</button>
														</div>
													</form>
												</div>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>
					<div class="single_gallery_item campus_best wow"
						data-wow-delay="0.2s" style="text-align: center;">
						<%@include file="ad/ad_board.jsp"%>
					</div>
				</c:if>

			</c:forEach>
			<!--------------------------------------------- 내 글 모아보기-------------------------->
			<c:forEach var="row" items="${board_list}">
				<c:if test="${row.writer == nickname}">
					<div class="single_gallery_item mine wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 260px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="font-weight: 800;">${row.writer}의 ${row.bno}번째 외침</div>
												
											</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div style="height: 70px;"
													class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredContext.do?bno=${row.bno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고 및 삭제 요청</a></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="height: 40px;"
													class="pixel-projects-menu wow fadeInUp"
													data-wow-delay="200ms">
													<div style="height: 40px;"
														class="text-center portfolio-menu">
														<button class="btn" data-filter=".comment${row.bno}">댓글
															보기</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<table
									style="background-color: #FFFFFF; height: 120px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="3" style="text-align: center;">댓글 작성</td>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center;">
												<div class="contact-form-area text-center">
													<form action="/CommentProc.do" method="post"
														id="submitForm" enctype="multipart/form-data">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden" name="bno" id="bno"
															value="${row.bno}">
														<div style="height: 60px;">
															<textarea style="height: 20px; width: 360px;"
																class="textarea_size"
																onchange="cmaTextareaSize('comments', 30);"
																onkeyup="cmaTextareaSize('comments', 30);"
																name="comments" id="comments"
																placeholder="댓글을 입력해주세요 (최대 30자)" required></textarea>
															<script>
																cmaTextareaSize(
																		'comments',
																		30);
															</script>
														</div>
														<div
															style="height: 40px; width: 350px; text-align: right;">
															<button type="submit" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">업로드</button>
															<button type="reset" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">취소</button>
														</div>
													</form>
												</div>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>

				</c:if>

			</c:forEach>

			<!--------------------------------------------- 게시글 작성-------------------------->
			<div class="single_gallery_item writing wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/writing.jpg" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<div class="contact-form-area text-center">
							<form action="/BoardProc.do" method="post" id="submitForm"
								enctype="multipart/form-data">
								<input type="hidden" id="g-recaptcha-response"
									name="g-recaptcha-response"> <input type="hidden"
									name="action" value="board_captcha"> <select id="board"
									name="board"
									style="width: 100%; height: 40px; margin-bottom: 30px; border: 1px solid #E3E3E3; color: #9A9A9A; background-color: #f6f6f6; text-align-last: center"
									required>
									<option value="" disabled selected>게시판을 선택해주세요.</option>
									<optgroup label="게시판">
										<option value="폴리텍">폴리텍 대나무숲</option>
										<option value="캠퍼스">캠퍼스 대나무숲</option>
									</optgroup>
								</select>
								<div>
									내용
									<br/>
									<textarea style="width: 360px;" class="textarea_size"
										onchange="cmaTextareaSize('contents', 150);"
										onkeyup="cmaTextareaSize('contents', 150);" name="contents"
										id="contents" placeholder="내용을 입력해주세요" required></textarea>
									<script>
										cmaTextareaSize('contents', 150);
									</script>
								</div>

								<div style="width: 650px; text-align: center;">
									<button type="submit" class="btn pixel-btn wow fadeInUp">업로드</button>
									<button type="reset" class="btn pixel-btn wow fadeInUp">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

			<!--------------------------------------------- 폴리텍 게시판-------------------------->
			<div class="single_gallery_item politec wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/top.jpg" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<div class="pixel-projects-menu wow fadeInUp"
							data-wow-delay="200ms">
							<div class="text-center portfolio-menu">
								<button class="btn" data-filter=".politec_recently">최신순</button>
								<button class="btn active" data-filter=".politec_best">인기순</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 최신순 -->
			<c:forEach var="row" items="${board_list}">
				<c:if test="${row.campus == univ_campus}">

					<div class="single_gallery_item politec_recently wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 260px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="font-weight: 800;">${row.writer}의 ${row.bno}번째 외침</div>
												
											</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div style="height: 70px;"
													class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<%
												if (stu_no.length() > 0) {
											%>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredContext.do?bno=${row.bno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고 및 삭제 요청</a></td>
											<%
												}
											%>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="height: 40px;"
													class="pixel-projects-menu wow fadeInUp"
													data-wow-delay="200ms">
													<div style="height: 40px;"
														class="text-center portfolio-menu">
														<button class="btn" data-filter=".comment${row.bno}">댓글
															보기</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<%
									if (stu_no.length() > 0) {
								%>
								<table
									style="background-color: #FFFFFF; height: 120px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="3" style="text-align: center;">댓글 작성</td>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center;">
												<div class="contact-form-area text-center">
													<form action="/CommentProc.do" method="post"
														id="submitForm" enctype="multipart/form-data">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden" name="bno" id="bno"
															value="${row.bno}">
														<div style="height: 60px;">
															<textarea style="height: 20px; width: 360px;"
																class="textarea_size"
																onchange="cmaTextareaSize('comments', 30);"
																onkeyup="cmaTextareaSize('comments', 30);"
																name="comments" id="comments"
																placeholder="댓글을 입력해주세요 (최대 30자)" required></textarea>
															<script>
																cmaTextareaSize(
																		'comments',
																		30);
															</script>
														</div>
														<div
															style="height: 40px; width: 350px; text-align: right;">
															<button type="submit" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">업로드</button>
															<button type="reset" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">취소</button>
														</div>
													</form>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<%
									}
								%>

							</div>
						</div>
					</div>
					<div class="single_gallery_item politec_recently wow"
						data-wow-delay="0.2s" style="text-align: center;">
						<%@include file="ad/ad_board.jsp"%>
					</div>

				</c:if>
			</c:forEach>
			<!-- 인기순 -->
			<c:forEach var="row" items="${board_best_list}">
				<c:if test="${row.campus == univ_campus}">

					<div class="single_gallery_item politec_best wow fadeInUp"
						data-wow-delay="0.2s">
						<c:choose>
							<c:when
								test="${fn:length(row.contents) > 40 || fn:contains(row.contents, '<br>')}">
								<img src="img/bg-img/memo1.jpg" alt="">
							</c:when>
							<c:otherwise>
								<img src="img/bg-img/memo.jpg" alt="">
							</c:otherwise>
						</c:choose>

						<div
							class="hover-content text-center d-flex align-items-center justify-content-center">
							<div class="hover-text">
								<table
									style="background-color: #FFFFFF; height: 260px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="font-weight: 800;">${row.writer}의 ${row.bno}번째 외침</div>
												
											</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2">
												<div style="height: 70px;"
													class="contact-form-area text-center">${row.contents}</div>
											</td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="2" style="text-align: right;"><fmt:formatDate
													value="${row.reg_dt}" pattern="yy/MM/dd HH:mm" /> <c:if
													test="${row.writer == nickname}">
													<br />
													<a href="/BoardDel.do?bno=${row.bno}"><img
														src="img/bg-img/trash.png"
														style="height: 40px; width: 36px;" alt="">삭제</a>
												</c:if></td>
										</tr>
										<tr>
											<%
												if (stu_no.length() > 0) {
											%>
											<td style="text-align: center;"><a
												href="/LikedContext.do?bno=${row.bno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredContext.do?bno=${row.bno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고 및 삭제 요청</a></td>
											<%
												}
											%>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<div style="height: 40px;"
													class="pixel-projects-menu wow fadeInUp"
													data-wow-delay="200ms">
													<div style="height: 40px;"
														class="text-center portfolio-menu">
														<button class="btn" data-filter=".comment${row.bno}">댓글
															보기</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<%
									if (stu_no.length() > 0) {
								%>
								<table
									style="background-color: #FFFFFF; height: 120px; width: 360px; border-radius: 30px;">
									<tbody>
										<tr>
											<td colspan="3" style="text-align: center;">댓글 작성</td>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center;">
												<div class="contact-form-area text-center">
													<form action="/CommentProc.do" method="post"
														id="submitForm" enctype="multipart/form-data">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="login_captcha">
														<input type="hidden" name="bno" id="bno"
															value="${row.bno}">
														<div style="height: 60px;">
															<textarea style="height: 20px; width: 360px;"
																class="textarea_size"
																onchange="cmaTextareaSize('comments', 30);"
																onkeyup="cmaTextareaSize('comments', 30);"
																name="comments" id="comments"
																placeholder="댓글을 입력해주세요 (최대 30자)" required></textarea>
															<script>
																cmaTextareaSize(
																		'comments',
																		30);
															</script>
														</div>
														<div
															style="height: 40px; width: 350px; text-align: right;">
															<button type="submit" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">업로드</button>
															<button type="reset" style="height: 40px; width: 30px;"
																class="btn pixel-btn wow fadeInUp">취소</button>
														</div>
													</form>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<%
									}
								%>

							</div>
						</div>
					</div>
					<div class="single_gallery_item politec_best wow"
						data-wow-delay="0.2s" style="text-align: center;">
<%@include file="ad/ad_board.jsp"%>
					</div>
				</c:if>
			</c:forEach>

			<!------------------------------------------- 채팅 ----------------------------------------->
			<div class="single_gallery_item chat wow fadeInUp"
				data-wow-delay="0.6s">
				<img src="img/bg-img/chat.jpg" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<h4 style="margin-top: 50px; color: #000000;">
							채팅준비 중입니다.<br />
						</h4>
					</div>
				</div>
			</div>

			<!------------------------------------------- 댓글 ----------------------------------------->
			<c:forEach var="row" items="${comments}">
				<div class="single_gallery_item comment${row.bno} wow"
					data-wow-delay="0.2s">
					
							<table
								style="background-color: #FFFACC; height: 120px; width: 360px; border-radius: 30px;">
								<tbody>
									<tr>
										<td style="text-align: center;"><div
												style="font-weight: 800;">${row.writer}...</div></td>
										<td style="text-align: left;">${row.comments}</td>
										<td style="text-align: right;"><fmt:formatDate
												value="${row.reg_dt}" pattern="MM/dd HH:mm" /></td>
									</tr>

									<c:if test="${row.writer == nickname}">
										<tr>
											<td colspan="3" style="text-align: right;"><a
												href="/CommentDel.do?cno=${row.cno}"><img
													src="img/bg-img/trash.png"
													style="height: 40px; width: 36px;" alt="">삭제</a></td>
										</tr>
									</c:if>

									<c:if test="${row.writer != nickname}">
										<tr>
											<%
												if (stu_no.length() > 0) {
											%>
											<td colspan="2" style="text-align: right;"><a
												href="/LikedComment.do?cno=${row.cno}"><img
													src="img/bg-img/like.png"
													style="height: 40px; width: 46px;" alt="">
													${row.liked}</a></td>
											<td style="text-align: right;"><a
												href="/HatredComment.do?cno=${row.cno}"><img
													src="img/bg-img/siren.png"
													style="height: 40px; width: 45px;" alt=""> 신고</a></td>
											<%
												} else {
											%>
											<td colspan="3"></td>
											<%
												}
											%>
										</tr>
									</c:if>
								</tbody>
							</table>
							<br />
					
				</div>
			</c:forEach>

			
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

	<!-- textarea 자동크기 -->
	<script>
		function cmaTextareaSize(obj, bsize) { // 객체명, 기본사이즈
			var sTextarea = document.getElementById(obj);
			var csize = (sTextarea.scrollHeight >= bsize) ? sTextarea.scrollHeight
					+ "px"
					: bsize + "px";
			sTextarea.style.height = bsize + "px";
			sTextarea.style.height = csize;
		}
	</script>
	
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
							[07684] 서울특별시 강서구 우장산로10길 112&nbsp;&nbsp;<br />TEL 010-6575-6040<br />
							&nbsp;&nbsp;E-MAIL <span
								style="font-size: 1.1em; font-weight: bold; color: black;"></span>tostit.korea@gmail.com
							</span><br /> <small class="footer__info-copy">COPYRIGHT 2019
								BY Co.TostIt!. ALL RIGHTS RESERVED.</small><br> <small
								class="footer__info-copy">한국폴리텍대학 서울강서캠퍼스 데이터분석과<br />
								개발팀 : user8315팀
							</small> <small class="footer__info-copy">[18학번. 길현준 김현기 홍승호]</small>
						</address>
						<p class="footer__info-small">본 웹사이트에 게시된 이메일 주소가 전자우편 수집
							프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 형사처벌
							됨을 유념하시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>