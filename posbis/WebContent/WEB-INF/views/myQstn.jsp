
<!-- 
JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 
****************************************************************************************
현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-9 방식으로 인코딩한다 라고 설정함
현재 이 JSP 페이지는 UTF-8 방식으로 인코딩한다
UTF-8 인코딩 방식은 한글을 포함 전세계 모든 문자열을 부호화할 수 있는 방법이다
(language="java"는 생략해도 들어감 default라서)
-->
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기-->
<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
<%@include file="/WEB-INF/views/common.jsp"  %>


<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->   
<!-- 로그인 화면 구성하는 HTML 태그 코딩하기 -->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->   
<html>
<head>
<title>문의내역확인</title>
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
 select { 
    -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
    -moz-appearance: none; 
    appearance: none;
     background: url("resources/selectImg.jpg") no-repeat 93% 50%; /* 화살표 모양의 이미지 */ 
} 
select::-ms-expand { display: none; }  
  
  </style>

   <script>
      //===============================================================
      // boay 태그 안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
      //===============================================================
      $(document).ready(function(){
         //-----------------------------------------------------------------------
         // name="rowCntPerPage"에 change 이벤트가 발생하면 실행할 코드 설정하기
         //-----------------------------------------------------------------------
         $('[name=rowCntPerPage]').change(function(){
            goSearch();
         });
         
         //--------------------------------------------------------------------------
         // 페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
         // -------------------------------------------------------------------------
         $(".pagingNumber").html(
               getPagingNumber(                        
                  "${myQstnAllCnt2}"                     // 검색 결과 총 행 개수
                  ,"${myQstnSearchDTO.selectPageNo}"  // 선택된 현재 페이지 번호
                  ,"${myQstnSearchDTO.rowCntPerPage}" // 페이지 당 출력행의 개수
                  ,"15"                               // 페이지 당 보여줄 페이지 번호 개수
                  ,"goSearch();"                      // 페이지 번호 클릭 후 실행할  자스코드
         ));
         

          inputData( "[name=selectPageNo]","${myQstnSearchDTO.selectPageNo}" );
          inputData( "[name=rowCntPerPage]","${myQstnSearchDTO.rowCntPerPage}" );
          inputData( "[name=keyword1]","${myQstnSearchDTO.keyword1}" );

   
	}); //$(document).ready(function(){
         

         
      //*******************************************
      // [게시판 목록 화면]으로 이동하는 함수 선언
      //*******************************************
      function goSearch(){

         if( is_empty("[name=myQstn] [name=keyword1]") ){
            $("[name=myQstn] [name=keyword1]").val("");
         }
         var keyword1 = $("[name=myQstn] [name=keyword1]").val();
         keyword1 = $.trim(keyword1);
         $("[name=myQstn] [name=keyword1]").val(keyword1);

         document.myQstn.submit();
      }
      
      
      
      //*********************************************
      // [모두 검색] 버튼 누르면 호출되는 함수 선언
      //*********************************************
      function goSearchAll(){

         $("[name=myQstn] [name=selectPageNo]").val("1");
         $("[name=myQstn] [name=rowCntPerPage]").val("15");
         inputData("[name=keyword1]","");
         goSearch(); 
      }
      //*********************************************
      // [게시판 입력 화면]으로 이동하는 함수 선언
      //*********************************************
      function goQstnRegForm(){
         location.replace("/posbis/qstnRegForm.do")
      }
      function goQstnForm(){
            location.replace("/posbis/qstnForm.do");
      }

  	  // goQstnContentForm 수정 
  	  // 성유진
      function goQstnContentForm(qna_no){ 
    	  var str = "qna_no=" + qna_no + "&" + $("[name = myQstn]").serialize();
          location.replace("/posbis/qstnContentForm.do?" + str + "&my=true");
      }
      // 성유진 끝
      
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

		 
		//통합 관리
		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }
			//qna 게시판- 자주 묻는 질문
		 function goFAQForm(){
		        //alert("전체 질문보기으로 이동");
		        location.replace("/posbis/FAQForm.do");
		     }

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
   <!-- ---------------------------------------------------------------------------------------------------------- -->
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
			<h2 style="font-size:65px"><strong>문의내역 확인</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-user"></i> 마이페이지 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="ti-comment-alt"></i> 문의내역 확인</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


  
<!--==========================
    Q&A 게시판
    ============================-->

  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">문의내역 확인</font>
              </header>   
              <div class="panel-body">   
          <div class="container">
          <form name="myQstn" method="post" action="/posbis/myQstn.do">
          <div  class="form-group">	
          <br>

         <!-- 키워드 검색 입력 양식 표현 -->
         [키워드] : <input type="text" name="keyword1" class="keyword1" style="margin:20 0 0 0; height:35">
         
         <!-------------------------------->
         <!-------- 버튼 표현하기 --------->
         <!-------------------------------->


         <button type="button" class="btn btn-default"style="margin:0 21 0 30" onClick="goSearch();">검      색</button>
         <button type="button" class="btn btn-default"style="" onClick="goSearchAll();">모두  검색</button>&nbsp;&nbsp;
         <a href="javascript:goQstnRegForm();">[문의하기]</a>&nbsp;&nbsp;

         <br>
         
          <!--------------------------------------------------->
         <!-- 어제 또는 오늘 게시판 글을 검색하는 조건 표현 -->
         <!--------------------------------------------------->
   <!--       [등록일]:
         <input type="checkbox" name="date" class="date" value="오늘">오늘
         <input type="checkbox" name="date" class="date" value="어제">어제
         <input type="checkbox" name="date" class="date" value="이번달" >이번 달
         <input type="checkbox" name="date" class="date" value="이번달이외">이번 달 이외 &nbsp;&nbsp;&nbsp;
         [조회수]:
         <input type="checkbox" name="readCnt" class="readCnt" value="조회수100이상">조회수 100 이상 &nbsp;&nbsp;&nbsp; -->
         <!------------------------------------------------------------>
         <!----- 선택한 페이지 번호가 저장되는 입력 양식 표현하기 ----->
         <!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할을 한다 -->
         <!------------------------------------------------------------>
         <input type="hidden" name="selectPageNo"></div></br>
         <!-- 개발시에는 hidden을 text로 잠시 바꿔놓고 개발하면 눈에 보이니까 아주 편하다 -->
       <div class="col-sm-12">
         <table align=right >
         <tr>
            <td align=right>

              [총 개수] : ${myQstnAllCnt2}&nbsp;&nbsp;&nbsp;

               <select name="rowCntPerPage" style="width:50px;height:30px;">
                 	<option value="10">&nbsp;10&nbsp;
					<option value="15">&nbsp;15&nbsp;
					<option value="20">&nbsp;20&nbsp;
					<option value="25">&nbsp;25&nbsp;
					<option value="30">&nbsp;30&nbsp;
               </select> 행보기
      </table>
      </form>
      </div></br>
         
   <!-- 페이징 처리 -->
   <div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
   
   <table><tr height=10><td></table>
   
   <div class="col-sm-10-1" align="center">
      
        <table class="table table-striped table-advance table-hover">
            <tr >
              <th align=center style="background-color:#7f9ed436;"><font color="#39485f">번호</th>
              <th style="background-color:#7f9ed436;"><font color="#39485f">제목</font></th>
              <th style="background-color:#7f9ed436;"><font color="#39485f">글쓴이</font></th>
              <th style="background-color:#7f9ed436;"><font color="#39485f">등록일</font></th>
              <th style="background-color:#7f9ed436;"><font color="#39485f">조회수</font></th>
              <c:forEach items="${myQstnList2}" var="myQstn" varStatus="loopTagStatus">
               <tr style="cursor:pointer" 
               onClick="goQstnContentForm(${myQstn.qna_no});">
              <td align=center>
			     ${myQstnAllCnt2-(myqstnSearchDTO.selectPageNo*myqstnSearchDTO.rowCntPerPage
			     							-myqstnSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}

              <td> 
                 <c:if test="${myQstn.print_level>0}">
                    <c:forEach begin="0" end="${myQstn.print_level}">
                         &nbsp;&nbsp;
                    </c:forEach>
                    ㄴ
                 </c:if> 
                 ${myQstn.subject}
               <!-- 각 행의 유저 아이디 출력 -->
               <td align=center>${myQstn.user_id}            
               <!-- 각 행의 등록일 출력 -->
               <td align=center>${myQstn.qna_date}
               <!-- 각 행의 조회수 출력 -->
               <td align=center>${myQstn.readcount}
         </c:forEach> 
  	 </table><br>
              
         <!-- 만약에 검색된 게시판 총 개수가 0개면 "검색 결과 없습니다" 출력하기 -->
            <c:if test="${empty myQstnList2}">
                검색 결과가 없습니다
            </c:if>
      <br><br>  

            </div>
 
          </div>
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
 