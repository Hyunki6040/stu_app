<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>회원탈퇴</title>

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
					<div class="section-heading text-center wow fadeInUp"
						data-wow-delay="100ms">
						<h2>회원탈퇴</h2>
						<img src="img/core-img/x.png" alt="">
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<!-- Contact Form -->
					<div class="contact-form-area text-center">

						<form action="/stuDelete.do" id="submitForm">
							<input type="hidden" name="stu_no" value=" <%-- <%=CmmUtil.nvl(uDTO.getStu_no())%> --%> " />
							
							<h6 style="text-align: center; height:100px;">회원탈퇴를 하시면 <br/> 회원님의 정보는 전부 삭제됩니다.</h6>
							
							<h6 style="text-align: center; height:50px;">회원탈퇴를 하시겠습니까?</h6>
							
							<button type="button" onclick="check()" class="btn pixel-btn wow fadeInUp">회원탈퇴</button>
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
	  
	  var stu_no=document.getElementById('stu_no');
	
	 $('#submitForm').submit();
	  }
  
  </script>

</html>