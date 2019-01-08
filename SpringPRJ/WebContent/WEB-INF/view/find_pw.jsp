<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>

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
                        <h2>비밀번호 찾기</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="/findPW.do" method="post" id="submitForm" enctype="multipart/form-data">
                            <input type="text" name="stu_no" id = "stu_no" class="form-control wow fadeInUp"  placeholder="학번(10자리)" required/>
                            <input type="text" name="name" id = "name" class="form-control wow fadeInUp" placeholder="이름" required/>
                     <div class="dropdown" id="mydropdown">
                        <select id="department" name="department" style="width: 100%; height: 40px; margin-bottom: 30px; 
                           border: 1px solid #E3E3E3; color: #9A9A9A; background-color: #f6f6f6; text-align-last:center">
                           <option value="" disabled selected>학과를 선택해주세요.</option>
                           <optgroup label="학과">
                              <option value="데이터분석과">데이터분석</option>
                              <option value="디지털콘텐츠과">디지털콘텐츠</option>
                              <option value="의료정보과">의료정보</option>
                              <option value="주얼리디자인과">주얼리디자인</option>
                              <option value="패션디자인과">패션디자인</option>
                              <option value="패션산업과">패션산업</option>
                              <option value="시각정보디자인과">시각정보디자인</option>
                              <option value="실내건축디자인과">실내건축디자인</option>
                              <option value="외식조리과">외식조리</option>
                              <option value="컴퓨터응용기계과">컴퓨터응용기계</option>
                              <option value="스마트금융과과">스마트금융과</option>
                              <option value="정보보안과">정보보안</option>
                              <option value="출판편집디자인과">출판편집디자인</option>
                              <option value="의료정보(시니어헬스케어)과">의료정보(시니어헬스케어)</option>
                              <option value="산업애니메이션과">산업애니메이션</option>
                              <option value="옷수선고급과">옷수선고급</option>
                              <option value="병원CS매니저과">병원CS매니저</option>
                              <option value="포켓몬마스터과">포켓몬마스터</option>
                           </optgroup>
                        </select>
                     </div>
                     <input type="text" name="birthdate" id = "birthdate" class="form-control wow fadeInUp" placeholder="생년월일 ex)990101" required/><br/>
                            <button type="submit"  class="btn pixel-btn wow fadeInUp" >확인</button>
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
$('#submitForm').submit();
}
</script>

</html>