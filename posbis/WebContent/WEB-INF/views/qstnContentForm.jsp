<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A 상세보기</title>

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


<!-- ------------------------------------------------------------------ -->
<!-- 만약에 상세보기할 게시판 글이 없으면 경고 후 이전 화면으로 이동하기-->
<!-- ------------------------------------------------------------------ -->
<c:if test="${empty qstnDTO}">
	<script>
		alert("게시판 글이 삭제되었습니다.");
		location.replace("/posbis/qstnForm.do")
 
	</script>
</c:if>


<title>게시판 상세 보기</title>
<script>


	// 성유진 
	// 들어온 경로에 따라 목록보기 클릭시 내글보기 또는 모든글보기로 이동하는 함수 선언
	var my = getParameters("my");
	function getParameters(paramName) {
	    // 리턴값을 위한 변수 선언
	    var returnValue;
	
	    // 현재 URL 가져오기
	    var url = location.href;
	
	    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
	
	    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	    for (var i = 0; i < parameters.length; i++) {
	        var varName = parameters[i].split('=')[0];
	        if (varName.toUpperCase() == paramName.toUpperCase()) {
	            returnValue = parameters[i].split('=')[1];
	            return decodeURIComponent(returnValue);
	        }
		}
	}// 성유진 끝
	
	  

	  
      // 게시판 수정 화면으로 이동하는 함수 선언
      function goQstnUpDelForm(){
         // name=qstnUpDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
         document.qstnUpDelForm.submit();
      }
      
      // 게시판 답글 화면으로 이동하는 함수 선언
      function goQstnRegForm(){
               
         $.ajax({
              // 접속할 서버 쪽 URL 주소 설정
              url : "/posbis/qstnMasterRegProc.do"
              // 전송 방법 설정
              , type : "post"
              // 서버로 보낼 파라미터명과 파라미터값을 설정
              , data : $("[name=qstnContentForm]").serialize()
              // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
              // 매개변수 masterCnt 에는 입력 행의 개수가 들어온다.
              , success : function(masterCnt){
                 // 관리자 계정의 개수가 1개면(=insert가 한번 성공했다는 뜻)
                 if(masterCnt == 1){
                    document.qstnRegForm.submit();
                 }
                 // 관리자 계정의 개수 1개가 아니면 경고하기
                 else{
                    alert("관리자의 권한이 필요합니다.");
                    return;
                 }
              }
              // 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
              , error : function(){
                 alert("서버 접속 실패");
              }
		});
     }
      
      function goQstnForm(){
        location.replace("/posbis/qstnForm.do");
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
		 
		//통합 관리
		 function goHomePageForm(){
		    //alert("통합 관리으로 이동");
		    location.replace("/posbis/homePageForm.do");
		 }

		// 조건에 따른 목록 보기 함수 
 
		function goListForm(){
			if (my == "true") {
				location.replace("/posbis/myQstn.do");		
				}else {
				location.replace("/posbis/qstnForm.do");	
				}
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
	         <i class="fab fa-wpforms"></i> Q&A 상세보기</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


	<!--==========================
   글 상세보기
    ============================-->


  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center" style="width:1200; margin:0 0 0 350;">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">Q&A게시판</font>
              </header>
              
					<div class="panel-body" >


						<div class="container">


							<form class=qstnContentForm name="qstnContentForm" method="post"
								action="/posbis/qstnRegForm.do">
								<input type="hidden" name="qna_no" value="${qstnDTO.qna_no}">
								<div class="row">
									<div class="col-sm-6" style="margin:20 0 10 203;">
										<section class="panel" style="width:700">
											<header class="panel-heading no-border" style="background-color:#7f9ed436;"> 
												<font color="#39485f">글 상세보기 </font>
											</header>
											<table class="table table-bordered" >
												<tr align=center>
													<th width=60>글번호</th>
													<td width=150>${qstnDTO.qna_no}
													<th width=60>조회수</th>
													<td width=150>${qstnDTO.readcount}
												</tr>
												<tr align=center>
													<th width=60>작성자
													<td width=150>${qstnDTO.user_id}
													<th width=60>작성일
													<td width=150>${qstnDTO.qna_date}
												</tr>
												<tr>
													<th>글제목
													<td width=150 colspan=3>${qstnDTO.subject}
												</tr>
												<tr>
													<th>글내용
													<td width=150 colspan=3><textarea name="content"
															rows="13" cols="45" style="border: 0" readonly>${qstnDTO.content}</textarea>
											</table>
										</section>
									</div>

								</div>

								<div style="float: center">
									<c:if test="${userMaster=='t'}">
		                              <button class="btn btn-default" type="button" value="답글쓰기" onClick="goQstnRegForm();">답글쓰기</button>
		                              <button class="btn btn-default" type="button" value="수정/삭제" onClick="goQstnUpDelForm();">수정/삭제</button>
		                           </c:if>
		                           <c:if test="${user_id==qstnDTO.user_id and userMaster=='f'}">
		                              <button class="btn btn-default" type="button" value="수정/삭제" onClick="goQstnUpDelForm();">수정/삭제</button>
		                           </c:if>
									<!-- onClick 시 함수 변경 성유진-->
									<button class="btn btn-default" type="button" value="목록보기"
										onClick="goListForm();">목록보기</button>
										<!-- onClick 시 함수 변경 성유진 끝-->
								</div>
								<input type="hidden" name="user_id" value="${user_id}">
							</form>

							<!--       <input type="button" value="답글쓰기" onClick="goQstnRegForm();">&nbsp;
      <input type="button" value="수정/삭제" onClick="goQstnUpDelForm();">&nbsp;
      <input type="button" value="목록보기" onClick="document.qstnForm.submit();">
    
       <input type="text" name="user_id" value="master40">
   </form>  -->


							<form name="qstnForm" method="post" action="/posbis/qstnForm.do">

							</form>

							<!--**************************************************-->
							<!--  수정/삭제 화면으로 이동하기 위한 form 태그 선언 -->
							<!--**************************************************-->
							<form name="qstnUpDelForm" method="post"
								action="/posbis/qstnUpDelForm.do">
								<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
								<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 떄문 -->
								<input type="hidden" name="qna_no" value="${param.qna_no}">
								<input type="hidden" name="selectPageNo"
									value="${param.selectPageNo}"> <input type="hidden"
									name="rowCntPerPage" value="${param.rowCntPerPage}">
							</form>
							<!--**************************************************************************-->
							<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 지정한 hidden 태그 출력하고 -->
							<!-- [게시판 목록] 화면으로 이동하는 form 태그 선언 ---------------------------->
							<!--**************************************************************************-->
							<form name="qstnRegForm" method="post"
								action="/posbis/qstnRegForm.do">
								<!-- 게시판 상세보기 화면을 구성하는 글의 [고유번호]를 hidden 태그에 저장 -->
								<!-- 댓글을 달려면 주인 글의 고유번호를 알아야 하기 때문 -->
								<input type="hidden" name="qna_no" value="${param.qna_no}">
							</form>
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
 