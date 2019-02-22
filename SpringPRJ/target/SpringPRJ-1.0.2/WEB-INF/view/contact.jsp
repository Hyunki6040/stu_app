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
<!-- ReCaptcha -->
<script
	src='https://www.google.com/recaptcha/api.js?render=6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv'></script>
<script>
	grecaptcha.ready(function() {
		grecaptcha.execute('6LeaUI0UAAAAAL6wM03uW1BIDSnYv-Xm0hnALttv', {
			action : 'reg_captcha'
		}).then(function(token) {
			// Verify the token on the server.
			document.getElementById('g-recaptcha-response').value = token;
		});
	});
</script>
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
                        <form action="/contactProc.do" method="post" id="submitForm" enctype="multipart/form-data">
                        
                        <input type="hidden"
													id="g-recaptcha-response" name="g-recaptcha-response">
													<input type="hidden" name="action" value="reg_captcha">
                            <input type="text" name="stu_no" id = "stu_no" class="form-control wow fadeInUp"  placeholder="학번(10자리)" required/>
                            <input type="password" name="pwd" id = "pwd" class="form-control wow fadeInUp" maxlength="20" placeholder="비밀번호(8자리~20자 사이)" style="font-family: caption;" required/>
                            <input type="password" name="pwd" id = "pwdChk" class="form-control wow fadeInUp" maxlength="20" placeholder="비밀번호 확인(8자리~20자 사이)" style="font-family: caption;" required/>
                            <input type="text" name="name" id = "name" class="form-control wow fadeInUp" placeholder="이름" required/>
							
							<% 
							
							String period = (String)session.getAttribute("period");	
							String campus = (String)session.getAttribute("campus");
								String department = (String)session.getAttribute("department");
								if(campus.length() > 0 && department.length() > 0){
				            %>
							<input type="hidden" name="campus" value="<%=campus %>">
                        	<input type="hidden" name="department" value="<%=department %>">
                        <input type="hidden" name="period" value="<%=period %>">
                        	<%}else{ %>
                        	<script>
							   location.href="/campus.do";
							</script>
                        	<%} %>
							<input type="text" name="birthdate" id = "birthdate" class="form-control wow fadeInUp" placeholder="생년월일 ex)990101" required/><br/>
                            
                            <h6>추가정보 - 아래의 내용들은 잘못입력하면 수정이 불가합니다. 신중히 작성해주세요.</h6><br/>
                            <h6>식권 하단에 위치한 8자리를 입력해주세요.</h6>
                            <input type = "text" name = "barcode_no" id = "barcode_no" class="form-control wow fadeInUp" maxlength="8" placeholder = "바코드 번호" required/>
                            <br/>
                            <h6>공백으로 두면 자동으로 닉네임이 생성됩니다.</h6>
                            <input type = "text" name = "nickname" id = "nickname" class="form-control wow fadeInUp" maxlength="10" placeholder = "닉네임 최대 10자"/>
                            <br/>
                            <br/>
                            <input type = "checkbox" name = "agreement" id = "agreement" value="agree" class="form-control wow fadeInUp" required/> <a onclick="agreement()">개인정보처리방침</a>에따른 개인정보활용에 동의 합니다.
                            <br/>
                            <button type="button" onclick = "check()" class="btn pixel-btn wow fadeInUp" >회원가입</button>
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
function agreement(){
	window.open("/admin/agreement.do", "_blank");
}
function check(){
var pwd = document.getElementById('pwd');
var pwdChk = document.getElementById('pwdChk');
var stu_no = document.getElementById('stu_no');
var name = document.getElementById('name');
var birthdate = document.getElementById('birthdate');
var department = document.getElementById('department');
var barcode_no = document.getElementById('barcode_no');
var nickname = document.getElementById('nickname');

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

if(stu_no.value.length<10){ 
   alert('학번은 10자 입니다.'); 
   stu_no.focus(); 
   return false; 
   } 
if(!Number(stu_no.value)){ 
   alert('학번은 숫자를 입력해야합니다'); 
   return false; 
   } 

if(name.value.lengh<2){ 
   alert('이름은 2자 이상입니다.'); 
   name.focus(); 
   return false; 
   } 

if(birthdate.value.length<6){ 
   alert('생일은 6자 입니다.'); 
   birth.focus(); 
   return false; 
   } 
if(!Number(birthdate.value)){ 
   alert('생일은 숫자를 입력해야합니다'); 
   return false; 
   } 

if(barcode_no.value.length<8){ 
   alert('바코드 번호는 8자입니다.'); 
   barcode_no.focus(); 
   return false; 
   } 
if(!Number(barcode_no.value)){ 
   alert('바코드번호는 숫자를 입력해야합니다');
   return false; 
   } 

   
$('#submitForm').submit();
}
</script>

</html>