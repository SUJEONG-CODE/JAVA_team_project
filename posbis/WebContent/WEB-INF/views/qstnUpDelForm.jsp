<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A 수정/삭제하기</title>

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
 
<!-- ------------------------------------------------------------------ -->
<!-- 만약에 상세보기할 게시판 글이 없으면 경고 후 이전 화면으로 이동하기-->
<!-- ------------------------------------------------------------------ -->
<%--   <c:if test="${empty qstnDTO}">
	<script>
		alert("게시판 글이 삭제되었습니다.");
		location.replace("/posbis/qstnForm.do")
	</script>
</c:if>
  --%>

 
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
   <title> 게시판 수정/삭제 </title>
   <script>
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   // [게시판 수정/삭제 화면]에 입력된 데이터의 유효성 체크 함수 선언
   //NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
   function checkQstnUpDelForm(upDel){
     //----------------------------------------------------------------------------
     // 매개변수로 들어온 upDel 에 "del"이 저장되었으면
     // 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
     //----------------------------------------------------------------------------
     if(upDel=="del"){
        if( is_empty("[name=qna_pwd]") ){
           alert("암호를 입력해 주세요");
           $("[name=qna_pwd]").focus();
           return;
        }
        
        //-------------------------------------------
        // name=upDel 을 가진 양식에 "del" 저장하기
        //-------------------------------------------
           // <주의> 아래 코드를 생략하면 일어나는 일
           //-----------------------------------------------------------------
           // 수정 버튼을 누르고 취소하게 되면 name=upDel 에 "up"이 들어간다
           // 그리고 삭제 버튼을 누르면 name=upDel 에 "up" 이 들어간 상태에서
           // 삭제가 진행되므로 올바른 삭제가 진행되지 않는다
        $("[name=upDel]").val("del");
        
        if(confirm("정말 삭제하시겠습니까?")==false) {return;}
     }
     //----------------------------------------------------------------------------
     // 매개변수로 들어온 upDel 에 "up"이 저장되었으면
     // 즉, 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
     //----------------------------------------------------------------------------
     else if(upDel=="up"){
        //-------------------------------------------
        // name=upDel 을 가진 양식에 "up" 저장하기
        //-------------------------------------------
           // <주의> 아래 코드를 생략하면 일어나는 일
           //-----------------------------------------------------------------
           // 삭제 버튼을 누르고 취소하게 되면 name=upDel 에 "del"이 들어간다
           // 그리고 수정 버튼을 누르면 name=upDel 에 "del" 이 들어간 상태에서
           // 수정이 진행되므로 올바른 수정이 진행되지 않는다
        $("[name=upDel]").val("up");
           
        if(is_empty("[name=user_id]")){
              alert("이름을 입력해 주세요.");
              $("[name=wirter]").focus();
              return;
           }
           if(is_empty("[name=subject]")){
              alert("제목을 입력해 주세요.");
              $("[name=subject]").focus();
              return;
           }
           /* return; */
           if(is_empty("[name=content]")){
              alert("내용 입력해 주세요.");
              $("[name=content]").focus();
              return;
           }
           if(is_valid_pattern("[name=qna_pwd]", /^[0-9]{4}$/) == false){
              alert("암호는 숫자 4개를 입력해주세요");
              return;
           }
           
           if(confirm('정말 수정하시겠습니까?') == false){ return; }
     }
     //=================================================================================
     // 현재 화면에서 페이지 이동 없이 서버쪽 "${ctRoot}/qstnUpDelProc.do"를 호출하여
     // [게시판 수정 또는 삭제 적용 개수]를 받는다
     //=================================================================================
     //alert($('[name=qstnUpDelForm]').serialize());
     
     $.ajax({
        //------------------------------
        // 호출할 서버쪽 URL 주소 설정
        //------------------------------
        url : "/posbis/qstnUpDelProc.do"
        //-----------------
        // 전송 방법 설정
        //-----------------
        , type : "post"
        //---------------------------------------------
        // 서버로 보낼 파라미터명과 파라미터값을 설정
        //---------------------------------------------
        , data : $('[name=qstnUpDelForm]').serialize()
        //----------------------------------------------------------------------
        // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
        // 매개변수 upDelCnt 에는 [게시판 수정 또는 삭제 적용 개수]가 들어온다
        //----------------------------------------------------------------------
        , success: function(upDelCnt){
           if(upDel=="up"){

              if(upDelCnt==1){
                 alert("수정 성공!");
                 location.replace("/posbis/qstnForm.do");
              }else if(upDelCnt==-1){
                 alert("게시물이 삭제되어 수정할 수 없습니다!");
              }else if(upDelCnt==-2){
                 alert("비밀번호가 잘못 입력되었습니다!");
              }else{
                 alert("서버쪽 DB 연동 실패!");
              }
           }else if(upDel=="del"){
              if(upDelCnt==1){
                 alert("삭제 성공!");
                 location.replace("/posbis/qstnForm.do");
              }else if(upDelCnt==-1){
                 alert("이미 삭제된 게시물입니다!");
              }else if(upDelCnt==-2){
                 alert("비밀번호가 잘못 입력되었습니다!");
              }else if(upDelCnt==-3){
                 alert("댓글이 있어 삭제 불가능합니다!");
              }else{
                 alert("서버쪽 DB 연동 실패!");
              }
              
           }
        }
        //---------------------------------------------------
        // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
        //---------------------------------------------------
        , error : function(){
           alert("서버와 통신 실패!");
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
	
	//qna 게시판- 자주묻는 질문 보기
	 function goFAQForm(){
       //alert("전체 질문보기으로 이동");
       location.replace("/posbis/FAQForm.do");
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
</head>

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
				<li><a style="color:#fff; cursor:pointer; font-size:20; margin:-3 80 4 0">마이페이지</a>
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
				<li><a class="active" style=" cursor:pointer; font-size:20; margin:0 55 4 0">고객센터</a>
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
	<section class="page-top-section set-bg"
		data-setbg="resources/bootstrap/img/page-top-bg/qnaBg.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>Q&A</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="far fa-comments"></i> 고객센터 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-pencil"></i> Q&A 수정</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


  
  <!-------------------------------------------------------------------------------->
<main id="main">
   <section id="main-content">
   <section class="wrapper">
     
    <div class="col-lg-11" align="center">
            <section class="panel" style="width:1200">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	    <font color="#39485f">Q&A 게시판</font>
              </header>
              <div class="panel-body">
 

      <div class="container">

      <div class="container">
      <c:if test = "${!empty qstnDTO}">
    <form:form name="qstnUpDelForm" method="post" commandName="qstnDTO"
                                action="/posbis/qstnUpDelProc.do">

   
         <!----------------------------------------------------------------->
         <!--  파라미터명이 qna_no인 파라미터값을 저장할 hidden 태그 선언 
              댓글 쓸 경우 qna_no라는 파라미터명에는 엄마 글의 글 번호가 들어온다  -->
         <!----------------------------------------------------------------->
       <input type="hidden" name="qna_no" value="${(empty param.qna_no)?0:param.qna_no}"> 
       <!-- 파명만 있고 파값 없으면 DTO의 속성변수에 null값만 들어감 -->
       <!-- [입]컨트롤러 클라스 안의 특정 메소드가 단 한 줄도 실행되지 않는 이유는?
           => 파값이 저장되는 매개변수 안에 파값과 매개변수 자료형이 일치가 안 돼서 실패한 것 
           첫줄에 메세지를 넣어서 시작되는지 확인부터 -->
         
         <!----------------------------------------------------------------->
         <!-- 커스텀태그의 일종인 JSTL C코어 태그를 사용하여
             파라미터명이 qna_no인 파라미터값이 비어있으면 새글쓰기 출력하고
             파라미터명이 qna_no인 파라미터값이 있으면 댓글쓰기 출력하기   -->
         <!----------------------------------------------------------------->
         
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
   <div class="row" align="center">
          <div class="col-sm-6">
            <section class="panel" style="width:700; margin:20 0 0 203">
              <header class="panel-heading no-border" style="background-color:#7f9ed436;">
               		<font color="#39485f">문의사항 수정/삭제</font>
              </header>
              <table class="table table-bordered">
               <tr>
                  <th>이름
                  <td><form:input path="user_id" className="user_id" style="width:50%; height:35"/>
               <tr>
                  <th>제목
                  <td><form:input path="subject" className="subject" style="width:50%; height:35"/>
               
               <tr>
                  <th>내용
                  <td><form:textarea path="content" className="content" rows="13" cols="40" style="width:100%"/>
               <tr>
                  <th>비밀번호
                  <td><form:password path="qna_pwd" className="qna_pwd" style="width:50%; height:35"/>
              </table>
            </section>
          </div>
   </div>  
   
   <br>
    
          
      <!-- -------------------- -->
      <table><tr height=4><td></table>
      <!-- -------------------- -->
      <input type="hidden" name="upDel" value="up">
      <input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
      <!-- -------------------- -->
      <button class="btn btn-default" type="button"value="수정"  onClick="checkQstnUpDelForm('up')">수정</button>
       <button class="btn btn-default" type="button" value="삭제" style="margin:0 30 0 30 "  onClick="checkQstnUpDelForm('del')">삭제</button>
      <button class="btn btn-default" type="button"v value="목록보기" onClick="location.replace('/posbis/qstnForm.do')">목록보기</button>
   </form> 
   
        </form:form>
     </c:if>
     <form name="qstnForm" method="post" action="/posbis/qstnForm.do">
      <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
    </form>
   
   
      
       
       
       
      </div>

    </section><!-- #about -->
  
 
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