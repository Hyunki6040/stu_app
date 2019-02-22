<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>한국폴리텍대학 어플리케이션(재학생) v2</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
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
        <!-- Navbar Area -->
        <div class="pixel-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container-fluid" style="background-color:#FFFFFF;">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="pixelNav">

                        <!-- Nav brand -->
                        <a href="/" class="nav-brand" style="font-weight:bold; color:#FFBB00">PolyTechCardApp</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Contact Area Start #####-->
    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2>회원가입</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="/campusProc.do" method="post" id="submitForm" enctype="multipart/form-data">
							<div class="dropdown" id="mydropdown">
								<select id="campus" name="campus" style="width: 100%; height: 40px; margin-bottom: 30px; 
									border: 1px solid #E3E3E3; color: #9A9A9A; background-color: #f6f6f6; text-align-last:center" required>
									<option value="" disabled selected>대학을 선택해주세요.</option>
									<optgroup label="제 Ⅰ대학">
										<option value="1.1">서울 정수 캠퍼스</option>
										<option value="1.2">서울 강서 캠퍼스</option>
										<option value="1.3">성남 캠퍼스</option>
										<option value="1.4">제주 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅱ대학">
										<option value="2.1">인천 캠퍼스</option>
										<option value="2.2">안성 캠퍼스</option>
										<option value="2.3">남인천 캠퍼스</option>
										<option value="2.4">화성 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅲ대학">
										<option value="3.1">춘천 캠퍼스</option>
										<option value="3.2">원주 캠퍼스</option>
										<option value="3.3">강릉 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅳ대학">
										<option value="4.1">대전 캠퍼스</option>
										<option value="4.2">청주 캠퍼스</option>
										<option value="4.3">아산 캠퍼스</option>
										<option value="4.4">홍성 캠퍼스</option>
										<option value="4.5">충주 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅴ대학">
										<option value="5.1">광주 캠퍼스</option>
										<option value="5.2">김제 캠퍼스</option>
										<option value="5.3">목포 캠퍼스</option>
										<option value="5.4">익산 캠퍼스</option>
										<option value="5.5">순천 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅵ대학">
										<option value="6.1">대구 캠퍼스</option>
										<option value="6.2">구미 캠퍼스</option>
										<option value="6.3">달성 캠퍼스</option>
										<option value="6.4">포항 캠퍼스</option>
										<option value="6.5">영주 캠퍼스</option>
									</optgroup>
									<optgroup label="제 Ⅶ대학">
										<option value="7.1">창원 캠퍼스</option>
										<option value="7.2">부산 캠퍼스</option>
										<option value="7.3">울산 캠퍼스</option>
										<option value="7.4">동부산 캠퍼스</option>
										<option value="7.5">진주 캠퍼스</option>
									</optgroup>
									<optgroup label="특성화 대학">
										<option value="8.1">바이오 캠퍼스</option>
										<option value="8.2">섬유패션 캠퍼스</option>
										<option value="8.3">항공 캠퍼스</option>
									</optgroup>
								</select>
							</div>
							<!-- 기능사/다기능 -->
							<div class="dropdown" id="mydropdown">
								<select id="period" name="period" style="width: 100%; height: 40px; margin-bottom: 30px; 
									border: 1px solid #E3E3E3; color: #9A9A9A; background-color: #f6f6f6; text-align-last:center" required>
									<option value="" disabled selected>과정을 선택해주세요.</option>
									<optgroup label="과정">
										<option value="다기능">2/3년제 다기능</option>
										<option value="기능사">1년제 기능사</option>
									</optgroup>
								</select>
							</div>
                            <button type="submit"  class="btn pixel-btn wow fadeInUp" >다음</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Contact Area End #####-->

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