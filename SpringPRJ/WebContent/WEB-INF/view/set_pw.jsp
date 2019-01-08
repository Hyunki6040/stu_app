<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%
	String stu_no = "";
	try {
		stu_no = (String) session.getAttribute("temp_id");
		stu_no.length();
	} catch (NullPointerException e) {%>
		<script>location.href = "/index.do"; </script>
		System.out.prinrln("메인페이지")
	<%}
	
	//저장된 비어있는 쿠키 삭제
	System.out.println(stu_no);
	if(session.getAttribute("logout")=="1"){%>
		<script>location.href = "/logout.do"; </script>
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
    <title>Pixel - Digital Agency HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
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
                        <a href="index.do" class="nav-brand" style="font-weight:bold; color:#FFBB00">PolyTechCardApp</a>

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
                        <h2>비밀번호 변경</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="/setPW.do" method="post" id="submitForm" enctype="multipart/form-data">
                            <input type="hidden" name="stu_no" value =<%=stu_no%> id = "stu_no" class="form-control wow fadeInUp" required/>
                            <input type="password" name="pwd" id = "pwd" class="form-control wow fadeInUp" maxlength="20" placeholder="비밀번호(8자리~20자 사이)" required/>
                            <input type="password" name="pwd" id = "pwdChk" class="form-control wow fadeInUp" maxlength="20" placeholder="비밀번호 확인(8자리~20자 사이)" required/>
                            <button type="button" onclick = "check()" class="btn pixel-btn wow fadeInUp" >비밀번호 변경</button>
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
<script>
function check(){
var pwd = document.getElementById('pwd');
var pwdChk = document.getElementById('pwdChk');
var stu_no = document.getElementById('stu_no');
var name = document.getElementById('name');
var birthdate = document.getElementById('birthdate');
var department = document.getElementById('department');
var barcode_no = document.getElementById('barcode_no');

if(pwd.value.length<8) { 
   alert('비밀번호는 8자 이상 20자 이하입니다.'); 
   pwd.focus(); 
   return false; 
}
if(pwdChk.value.length < 8) {
   alert('비밀번호 확인은 8자 이상 20자 이하입니다.'); 
   pwdChk.focus();
   return false;
}

if(pwd.value != pwdChk.value){ 
   alert('비밀번호가 다릅니다..'); 
   pwdChk.focus();
   return false;
   }
$('#submitForm').submit();
}
</script>

</html>