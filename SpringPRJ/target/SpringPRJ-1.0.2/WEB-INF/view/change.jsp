<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
    
    
    <%
   String stu_no = "";
   try {
      stu_no = CmmUtil.nvl((String) session.getAttribute("stu_no"));
      stu_no.length();
   } catch (NullPointerException e) {
      stu_no = "";
   }
   
   //저장된 비어있는 쿠키 삭제
   System.out.println(stu_no);
   if(session.getAttribute("logout")=="1"){%>
      <script>location.href = "/logout.do"; </script>
   <%}
   
   UserDTO pDTO = (UserDTO)request.getAttribute("pDTO");
   if (pDTO == null) {
      pDTO = new UserDTO();
   }
   if(stu_no.length() < 9){%>
      <script>location.href = "/index.do"; </script>
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
                        <h2>학생정보수정</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="/updatePhoto.do" method="post" id="submitForm"  enctype="multipart/form-data">
                        
                                  <h6>사진 크기는 200 X 200 로 해주세요.</h6>
                                  <h8>사진 규정 미준수로 인한 <br/>불이익에 대해서는 책임지지 않습니다.</h8>
                                  <input type="file" name="photo" style="margin-top:20px; "/>
                                  <input type = "hidden" name = "stu_no" value = "<%=stu_no %>"/>
                                  <button type="button" onclick = "check()" class="btn pixel-btn wow fadeInUp" >수정</button>
                              </form>
                              <br/>
                          			<button type="button" onclick = "location.href = '/deleteUser.do?stu_no=<%=stu_no%>'" class="btn pixel-btn wow fadeInUp" >회원탈퇴</button>
                          	 <br/><br/>
                          	 		<button type="button" onclick = "location.href = '/set_pw.do'" class="btn pixel-btn wow fadeInUp" >비밀번호 수정</button>
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

$('#submitForm').submit();
}
</script>

</html>