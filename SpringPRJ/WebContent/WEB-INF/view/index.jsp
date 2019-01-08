<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.StuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	String barcode = "";
	String stu_no = "";
	String ad = "need";
	try {
		barcode = CmmUtil.nvl((String) request.getAttribute("barcode"));
		stu_no = (String) session.getAttribute("stu_no");
		ad = (String) session.getAttribute("ad");
		stu_no.length();
	} catch (NullPointerException e) {
		barcode = "";
		stu_no = "";
		ad = "";
	}
	
	//저장된 비어있는 쿠키 삭제
	System.out.println(stu_no);
	if(session.getAttribute("logout")=="1"){%>
		<script>location.href = "/logout.do"; </script>
	<%}
%>
<%
		if (CmmUtil.nvl((String) request.getAttribute("payment")).equals("1")) {//납부
			} else if(ad == "need") {//미납%>
				<script>location.href = "/ad.do"; </script>
	<%}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>한국폴리텍대학 서울강서캠퍼스 (재학생) 2018</title>

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

<body style="font-family:Binggrae, sans-serif;">
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
    <!-- 광고 인증 -->
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
							<script>
							     (adsbygoogle = window.adsbygoogle || []).push({
							          google_ad_client: "ca-pub-2201519259553144",
							          enable_page_level_ads: true
							     });
							</script>
							
        <!-- Navbar Area -->
        <div class="pixel-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container-fluid" style="background-color:#FFFFFF;">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="pixelNav">

                        <!-- Nav brand -->
                        <a href="index.do" class="nav-brand" style="font-weight:bold; color:#FFBB00">PolyTechCardApp</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Nav Start -->
                            <div class="classynav" style="padding-top: 50px;">
                                <ul>
                                    <li><a href="index.do">메인페이지</a></li>
                                    
                                  <%
										if (stu_no.length() > 0) {
									%>
									<li><a href="change.do">학생정보수정</a></li>
									<li><a href="https://pf.kakao.com/_vcxgMj">문의하기</a></li>
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
										if (stu_no.length() > 0){}else{
									%>

                     <!-- 아이디/회원가입 폼 -->
                        <div class="top-social-info ml-5">
                           <form action="/loginProc.do" method="post">
                              <p style="margin-bottom: 0px;">학번</p>
                              <input type="text" name="id" required="">

                              <p style="margin-top: 20px; margin-bottom: 0px;">비밀번호</p>
                              <input type="password" name="password" required="">
                              <div class="check-text">
                                 <ul>
                                    <li style="margin-top: 20px;"><input type="checkbox"
                                       id="brand" value="" name="useCookie"> <label
                                       for="brand" style="margin-right: 50px;"><span></span>로그인유지</label>
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
                <div class="col-12" >
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                    	<h4 style="color:#F2CB61">오늘의 학식</h4>
						<div style="border: 3px solid; border-radius: 10px; border-color: #FFE08C;">
							<h5><%@include file="web_crolling.jsp"%></h5>
						</div>
					</div>
                </div>
            </div>
        </div>

        <!-- 버튼 -->
        <div class="pixel-projects-menu wow fadeInUp" data-wow-delay="200ms">
            <div class="text-center portfolio-menu">
                <button class="btn active" data-filter=".visual">학식카드</button>
                <button class="btn" data-filter=".add">학생증</button>
            </div>
        </div>

        <div class="pixel-portfolio">

            <!--------------------------------------------- 학식카드 바코드-------------------------->
            	<%
										if (stu_no.length() > 0){
									%>
            <div class="single_gallery_item visual wow fadeInUp" data-wow-delay="0.2s">
                <img src="img/bg-img/pizza.png" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                       <img src='https://barcode.tec-it.com/barcode.ashx?data=<%=barcode%>&code=Code128&dpi=96&dataseparator='alt='Barcode Generator TEC-IT' />
                        <h4 style="margin-top:50px;color:#000000;"> 바코드 인식 실패시<br/> 휴대폰 밝기를 최대로 설정해주세요.</h4>
                        <br/>
                        <br/>
			             <!-- 광고 -->
			             <h1>광고</h1>
                        
                    </div>
                </div>
            </div>
            <%}else{ %>
            <div class="single_gallery_item visual wow fadeInUp"
				data-wow-delay="0.2s">
				<img src="img/bg-img/pizza.png" alt="">
				<div
					class="hover-content text-center d-flex align-items-center justify-content-center">
					<div class="hover-text">
						<h4 style="margin-top: 50px; color: #000000;">
							로그인 해주세요.
						</h4>
					</div>
				</div>
			</div>
			<%} %>

            <!------------------------------------------- 학생증----------------------------------------->
            <%
										if (stu_no.length() > 0){
									%>
            <div class="single_gallery_item add wow fadeInUp" data-wow-delay="0.4s">
                <img src="img/bg-img/card.png" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                    <table style="background-color:#FFFFFF; height:360px; width:360px; border-radius:30px;">
                    	<tbody>
                    		<tr>
                    			<td colspan="2"> 한국폴리텍 대학 모바일 학생증</td>
                    		</tr>
                    		<tr>
                    			<td rowspan="7" style="width:200px; height:200px;"><img  src="<%=CmmUtil.nvl((String) request.getAttribute("photo"))%>"/200x200/> </td>
                    			<td style="float:left; margin-top:10px; margin-left:10px;"> 학번 </td>
                    		</tr>
                    		<tr>
                    			<td colspan="2"> <%=CmmUtil.nvl((String) request.getAttribute("stu_no"))%></td> 
                    		</tr>
                    		<tr>
                    			<td colspan="2" style="float:left; margin-top:10px; margin-left:10px;"> 이름 </td> 
                    		</tr>
                    		<tr>
                    			<td><%=CmmUtil.nvl((String) request.getAttribute("stu_name"))%></td>
                    		</tr>
                    		<tr>
                    			<td colspan="2" style="float:left; margin-top:10px; margin-left:10px;"> 생년월일  </td>
                    		</tr>
                    		<tr>
                    			<td><%=CmmUtil.nvl((String) request.getAttribute("birthday"))%></td>
                    		</tr>
                    		<tr>
                    			<td colspan="2"  style="float:left; margin-top:10px; margin-left:10px;">학생회비 : <%
										if (CmmUtil.nvl((String) request.getAttribute("payment")).equals("1")) {
									%> <span style="font-color: black">납부</span> <%
									 	} else {
									 %> <span style="color: red; font-weight: 800;">미납</span> <%
									 	}
									 %>
                    			</td>
                    		</tr>
                    		<tr>
                    			<td colspan="2"><img src="img/bg-img/stamp.png" style="width:250px; height:40px;" /></td>
                    		</tr>
                    	</tbody>
                    </table>
						<%}else{ %>
						<h4 style="margin-top: 50px; font-color: #FFFFFF;">
							로그인 해주세요.
						</h4>
						<%} %>
                        <h4 style="margin-top:30px; color:#000000;">학생증</h4>
                    </div>
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
    
</body>

</html>