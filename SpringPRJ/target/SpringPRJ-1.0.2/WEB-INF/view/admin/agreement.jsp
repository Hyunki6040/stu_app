<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
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
                        <h2>개인정보 처리방침</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <pre><p>토스트잇!은 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.</p>

                        <p>
제1조(개인정보의 처리목적) 토스트잇!은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 
  1. 홈페이지 회원 가입 및 관리 
     회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다. 
  2. 서비스 제공 
     서비스 제공, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증 등을 목적으로 개인정보를 처리합니다. 
      제2조(개인정보의 처리 및 보유기간) ① 토스트잇!은(는) 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다. 

   ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 
   1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지 
     다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지 
     1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지 
      2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지 
     
     2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지
     다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지 
     1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록 
        - 표시․광고에 관한 기록 : 6월 
        - 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년 
        - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년 
     2)「통신비밀보호법」제41조에 따른 통신사실확인자료 보관
       - 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년 
       - 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
     3) 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」시행령 제29조에 따른 본인확인정보 보관 : 게시판에 정보 게시가 종료된 후 6개월
     
      제5조(정보주체와 법정대리인의 권리․의무 및 행사방법) ① 정보주체는 토스트잇!에 대해 언제든지 개인정보 열람․정정․삭제․처리정지 요구 등의 권리를 행사할 수 있습니다.
   ② 제1항에 따른 권리 행사는  토스트잇!에 대해 개인정보보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며,  토스트잇!은(는) 이에 대해 지체없이 조치하겠습니다. 
   ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. 
   ④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. 
   ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. 
   ⑥  토스트잇! 은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 
   
   
    제6조(처리하는 개인정보 항목) 토스트잇! 은(는) 다음의 개인정보 항목을 처리하고 있습니다. 
  1. 홈페이지 회원 가입 및 관리 
    ․필수항목 : 성명, 생년월일, 재학생중인 대학, 학과, 학번, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소
  2. 재화 또는 서비스 제공  
    ․필수항목 : 성명, 생년월일, 재학생중인 대학, 학과, 학번, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 은행계좌정보 등 결제정보   
  3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
    ․IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등 
    
     제7조(개인정보의 파기) ① 토스트잇! 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. 
   ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 
   ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다. 
   1. 파기절차 
     토스트잇! 은(는) 파기 사유가 발생한 개인정보를 선정하고, 토스트잇!의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다. 
   2. 파기방법 
     토스트잇! 은(는) 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다. 
     
      제8조(개인정보의 안전성 확보조치) 토스트잇!은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다. 
   1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등 
   2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 
   3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제 
   

       제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)     
   ① 토스트잇!은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.
   ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(https/http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
      가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에
     대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여
      이용자에게 최적화된 정보 제공을 위해 사용됩니다.
      나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
      다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
      
       제10조(개인정보 보호책임자) ① 토스트잇! 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. 

   ▶ 개인정보 보호책임자 
       성명 : 김현기 
       직책 : 토스트잇! 대표
       연락처 : 010-6575-6040, tostit.korea@gmail.com 
         ※ 개인정보 보호 담당부서로 연결됩니다. 
 
  ② 정보주체께서는 토스트잇! 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 토스트잇! 은(는) 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다. 

   제13조(개인정보 처리방침 변경) ① 이 개인정보 처리방침은 2019. 02. 10부터 적용됩니다.
     </p></pre>
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