<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>

  <meta charset="UTF-8">
<meta name="description" content="loans HTML Template">
<meta name="keywords" content="loans, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="resources/bootstrap/img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="resources/bootstrap/css/owl.carousel.min.css" />
<link rel="stylesheet" href="resources/bootstrap/css/flaticon.css" />
<link rel="stylesheet" href="resources/bootstrap/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="resources/bootstrap/css/style.css" />

<!-- ------------------------------------------------------------------------------- -->


<!-- 	<link rel="shortcut icon" href="img/favicon.png">
 -->
<!-- Bootstrap CSS -->
<link href="resources/tableBoot/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/tableBoot/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/tableBoot/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/daterangepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-datepicker.css"
	rel="stylesheet" />
<link href="resources/tableBoot/css/bootstrap-colorpicker.css"
	rel="stylesheet" />
<!-- date picker -->

<!-- color picker -->

<!-- Custom styles -->
<link href="resources/tableBoot/css/style.css" rel="stylesheet">
<link href="resources/tableBoot/css/style-responsive.css"
	rel="stylesheet" />

<!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->

<!-- 아이콘 -->   
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/themify-icons/themify-icons.css">
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/simple-line-icons/css/simple-line-icons.css">

<style>
 .loginmaintaining {
 
	color: #6c757d;
    width: 11%;
    
    float: right;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
    text-align: right;

	border-top:1px solid #eeeeee ;

	border-left:1px solid #eeeeee ;

    border-right:1px solid #eeeeee ;

	border-bottom:1px solid #eeeeee ;

 
    
   background-color: #f5f8fd;

}
  
  
  </style>





</head>


<script>
	function checkWithdrawal(){
		
		if(is_empty("[name=user_pwd]")){
			alert("비밀번호를 입력해주세요.");
			$("[name=user_pwd]").focus();
			return;
		}
		if(is_empty("[name=withdrawalReason]")){
			alert("탈퇴사유를 선택해주세요.");
			$("[name=withdrawalReason]").focus();
			return;
		}
		exitPopup();	
	}


	function exitPopup(){
	
		if (confirm("정말 탈퇴하시겠습니까??") == true){
			goWithdrawalForm();
		}else{
		    return;
		}
	}

	function goWithdrawalForm(){

 //*************************************************************************************   
 //ajax를 통해 아이디 암호 맞는 사용자 삭제하기     
   		 $.ajax({ 
   			url : "/posbis/withdrawalProc.do"
			, type : "post"
			, data : $("[name=withdrawalForm]").serialize()
			, success : function(withdrawalCnt){
				
				if(withdrawalCnt == 1){
					alert("탈퇴 완료 되었습니다. \n그동안 POSBIS 를 이용해주셔서 감사합니다.");
					location.replace("/posbis/mainForm.do")
				
				}else if(withdrawalCnt==-1){
						alert("이미 탈퇴한 회원 또는 등록된 사용자가 아닙니다.");
						location.replace("/posbis/withdrawalForm.do")
				
				}else if(withdrawalCnt==0){
						alert("입력하신 비밀번호가 일치하지 않습니다.");
						location.replace("/posbis/withdrawalForm.do")
				}else {
					alert("서버쪽 DB 연동 실패!");
				}
				
			}, error : function(){
					alert("서버 접속 실패");
			}	 
   		 });

	 }
	 
     
//--------------------------------------------------------
 //로고 클릭시
   function goMainForm(){
      //alert("메인으로 이동");
      location.replace("/posbis/mainForm.do");
   }
	
	//회사소개-pobis 클릭시
	
	function goIntroForm(){
      //alert("회사소개로 이동");
      location.replace("/posbis/introForm.do");
   }
	
	//마이페이지-매출관리
  function goSalesForm(){
      //alert("매출관리로 이동");
      location.replace("/posbis/salesForm.do");
   } 
	//마이페이지-메뉴관리
	function goMenuForm(){
      //alert("메뉴관리로 이동");
      location.replace("/posbis/menuForm.do");
   }
	//분석현황-검색관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
		function goPreSearchForm(){
	        //alert("검색관리로 이동");
			var rank_code = ${rank_code};
         if(rank_code == 2){
        	 location.replace("/posbis/preSearchForm.do");
         }
         else{
        	 if(confirm("프리미엄 등급 전용 서비스로 월 10,000원 정기결제로 이용하실 수 있습니다.\n 결제 정보를 등록하시겠습니까?")==false) {
					return;
				}
        	 else{
        		 location.replace("/posbis/payFormLogin.do");
             }
         }
	        
	     }
		//분석현황-차트관리 (프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못함)
		function goPreChartForm(){
	        //alert("차트관리로 이동");
			var rank_code = ${rank_code};
         if(rank_code == 2){
         	location.replace("/posbis/preChartForm.do");
         }
         else{
        	 if(confirm("프리미엄 등급 전용 서비스로 월 10,000원 정기결제로 이용하실 수 있습니다.\n 결제 정보를 등록하시겠습니까?")==false) {
					return;
				}
        	 else{
        		 location.replace("/posbis/payFormLogin.do");
             }
         }
	     }
	//내정보관리-내정보 보기
	function goMyPageForm(){
      //alert("내정보 보기으로 이동");
      location.replace("/posbis/myPageForm.do");
   }

	//qna 게시판- 질문하기
	function goqstnRegForm(){
      //alert("질문하기으로 이동");
      location.replace("/posbis/qstnRegForm.do");
   }
	//qna 게시판- 내글보기
	 function goMyQstnForm(){
       //alert("내글보기으로 이동");
       location.replace("/posbis/myQstn.do");
    }
	//qna 게시판- 전체 질문보기
	 function goQstnForm(){
        //alert("전체 질문보기으로 이동");
        location.replace("/posbis/qstnForm.do");
     }
	
	
	
	//qna 게시판- 자주묻는 질문 보기
	 function goFAQForm(){
       //alert("전체 질문보기으로 이동");
       location.replace("/posbis/FAQForm.do");
    }
	 
	//통합 관리
	 function goHomePageForm(){
	    //alert("통합 관리으로 이동");
	    location.replace("/posbis/homePageForm.do");
	 }
	//--------------------------------------------------------

	// 마케팅 전략
	      function goMarketingForm(){
	          //alert("마케팅 전략 으로 이동");
	          var rank_code = ${rank_code};
		         if(rank_code == 2){
		         	location.replace("/posbis/marketingForm.do");
		         }
		         else{
		        	 if(confirm("프리미엄 등급 전용 서비스로 월 10,000원 정기결제로 이용하실 수 있습니다.\n 결제 정보를 등록하시겠습니까?")==false) {
							return;
						}
		        	 else{
		        		 location.replace("/posbis/payFormLogin.do");
		             }
		         }
	       }   

	       // 로그아웃
	       function goLogoutForm(){
	    	   location.replace("/posbis/logoutForm.do");
			}


	  //예약관리
	 	function goResManagerForm(){
	        //alert("예약관리로 이동");
	        location.replace("/posbis/resManagerForm.do");
	     }
			

</script>

<body>
 <!-- Header Section -->
	<header class="header-section">
		<a onClick="goHomePageForm();" class="site-logo" style="cursor:pointer;">
			<img src="resources/bootstrap/img/POSBIS_logo.png" alt="">
		</a>
		<nav class="header-nav" style="height:98;">
			<ul class="main-menu">
				<li>

					<a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">INFO</a>

					<ul class="sub-menu" style="cursor:pointer; ">
						<li><a onClick="goIntroForm();">POSBIS 소개</a></li>
						<li><a onClick="goHomePageForm();">Home 화면</a></li>
					</ul>
				</li>
				<li><a class="active" style=" cursor:pointer; font-size:20; margin:-3 80 4 0">마이페이지</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMyPageForm();">내정보보기</a></li>
						<li><a onClick="goMyQstnForm();">문의내역확인</a></li>
					</ul>
				</li>
				
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">매장관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goMenuForm();">메뉴 관리</a></li>
						<li><a onClick="goSalesForm();">매출 관리</a></li>
					</ul>
				</li>
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">업계동향</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goPreSearchForm();">시장분석</a></li>
						<li><a onClick="goPreChartForm();">비교차트</a></li>
						<li><a onClick="goMarketingForm();">마케팅 전략</a></li>
					</ul>
				</li>
				<li>
					<a style="color:#fff; cursor:pointer; font-size:20; margin:0 55 4 0">예약관리</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goResManagerForm();">예약목록</a></li>
					</ul>				
				</li>
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:0 55 4 0">고객센터</a>
					<ul class="sub-menu" style="cursor:pointer;">
						<li><a onClick="goQstnForm();">Q&A 목록보기</a></li>
						<li><a onClick="goFAQForm();">자주 묻는 질문</a></li>
						<li><a onClick="goqstnRegForm();">문의하기</a></li>
					</ul>
				</li>
			</ul>
			<div class="header-right">

				<div class="hr-text" style="margin:-17 0 -15 0">
				<c:if test = "${rank_code eq '1'}">
	               <i class="ti-user">&nbsp;</i>
	            </c:if>
	               
	            <c:if test = "${rank_code eq '2'}">
	               <i class="ti-crown">&nbsp;</i>
	            </c:if>
	            
	            <b>${user_id}</b> 님 반갑습니다
                	
					<br>
                     <a style="cursor:pointer"  onClick="goMyPageForm();">[내정보 보기]</a>                        
                    &nbsp;
                     <a style="cursor:pointer"  onClick="goLogoutForm();"> [로그아웃] </a> 
				</div>
				<!-- <a href="#" class="hr-btn"><i class="flaticon-029-telephone-1"></i>Call us now! </a>
				<div class="hr-btn hr-btn-2">+45 332 65767 42</div> -->

			</div>
		</nav>
	</header>
	<!-- Header Section end -->
	


	
	<!-- Page top Section end -->
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/mypageBg.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>회원탈퇴</strong></h2>
			<div style=" color:#fff; width:40%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-user"></i> 마이페이지 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-settings"></i> 내정보 보기 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-logout"></i> 회원탈퇴</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


  
 <!--==========================
		회원탈퇴
============================-->
     <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-7" align="center" style="margin:0 0 0 410">
            <section class="panel">
              <header class="" style="background-color:#7f9ed436;">
                	   <font color="#39485f">회원탈퇴</font>
              </header>
             <div class="panel-body"> 
			
      <div class="container">
                  <form name="withdrawalForm" class="form-validate form-horizontal" id="feedback_form"  >
                  
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 100">아이디 <span class="required">*</span></label>
                    <div class="col-lg-6" style="margin:-4 0 0 -15">
                        <h4><strong>${user_id}</strong></h4>
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 100">비밀번호<span class="required">*</span></label>
                    <div class="col-lg-6">
                        <input type="password"  name="user_pwd" class="form-control" id="exampleInputEmail1"  >
                      </div> 
                  </div>
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 100">탈퇴사유 <span class="required">*</span></label>
                    <div class="col-lg-6">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="withdrawalReason" size=1 class="form-control" id="exampleInputEmail1" > 
			                  <option value="" selected> ---- 탈퇴사유를 선택해주세요 ----</option>
			                  <option value="1">컨텐츠 부족</option>
			                  <option value="2">이용불편</option>
			                  <option value="3">사용빈도수 낮음</option>
			                  <option value="4">폐업</option>
			             </select>
                      </div> 
                  </div>
                  
 
                  
        			<input type="hidden" name="user_id" value="${user_id}">
        			<input type="hidden" name="u_no" value="${u_no}">
        			
        		  <div style="margin:30 0 20 0">	
                    <button class="btn btn-default" type="button" value="탈퇴" onClick="checkWithdrawal()"> 탈퇴 </button>&nbsp;&nbsp;
 					<button class="btn btn-default" type="button" value="최소" onClick="goMyPageForm()"> 취소 </button>
                	</div>
                </form>

              </div>
            </section>
          </div>
 
</section>
</section>
 
</main>
 
 
<!--==========================
    꼬리말
  ============================-->
	<footer class="footer-section">
		<div class="container">
			<img class="footer-logo" src="resources/bootstrap/img/POSBIS_logo.png" alt="">
			<div class="row">

				<div class="footer-widget">

					<p>POSBIS는 항상 도전하는 정신으로 고객 편의성 증대를 위하여 혁신 기술을 도입하고, 세련된 디자인과 높은 성능으로 국내의 POS 통계 분석 업계 표준을 설정 및 유지해 나가고 있습니다. 항상 행복과 고객님의 사업이 번창하시기를 기원합니다.</p>
					<p>
						월드메르디앙벤쳐 2차 Korea, Seoul 가산디지털단지역<br> <strong>Phone:</strong>
						+1 5589 55488 55<br> <strong>Email:</strong> info@example.com<br>
					</p>
				</div>


			</div>
			<div class="copyright">
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
				Copyright &copy;
				2020
				All rights reserved | This template is made with <i
					class="fa fa-heart-o" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank">Colorlib</a>
				Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
			</div>
		</div>
	</footer>
	<!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!--====== Javascripts & Jquery ======-->
	<script src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/bootstrap/js/jquery.slicknav.min.js"></script>
	<script src="resources/bootstrap/js/owl.carousel.min.js"></script>
	<script src="resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="resources/bootstrap/js/main.js"></script>
	<!-- ---------------------------------------------------------------------- -->

	<!-- javascripts -->
	<script src="resources/tableBoot/js/jquery.js"></script>
	<!-- nice scroll -->
	<script src="resources/tableBoot/js/jquery.scrollTo.min.js"></script>
	<script src="resources/tableBoot/js/jquery.nicescroll.js"
		type="text/javascript"></script>

	<!-- jquery ui -->
	<script src="resources/tableBoot/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom checkbox & radio-->
	<script type="text/javascript" src="resources/tableBoot/js/ga.js"></script>
	<!--custom switch-->
	<script src="resources/tableBoot/js/bootstrap-switch.js"></script>
	<!--custom tagsinput-->
	<script src="resources/tableBoot/js/jquery.tagsinput.js"></script>

	<!-- colorpicker -->

	<!-- bootstrap-wysiwyg -->
	<script src="resources/tableBoot/js/jquery.hotkeys.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg.js"></script>
	<script src="resources/tableBoot/js/bootstrap-wysiwyg-custom.js"></script>
	<script src="resources/tableBoot/js/moment.js"></script>
	<script src="resources/tableBoot/js/bootstrap-colorpicker.js"></script>
	<script src="resources/tableBoot/js/daterangepicker.js"></script>
	<script src="resources/tableBoot/js/bootstrap-datepicker.js"></script>
	<!-- ck editor -->
	<script type="text/javascript"
		src="resources/tableBoot/assets/ckeditor/ckeditor.js"></script>
	<!-- custom form component script for this page-->
	<script src="resources/tableBoot/js/form-component.js"></script>
	<!-- custome script for all page -->
	<script src="resources/tableBoot/js/scripts.js"></script>
  
  
</body>
</html>
 