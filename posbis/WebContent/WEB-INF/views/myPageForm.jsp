<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보</title>
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
 
 
<script>

function goInfoUpdateForm(){
    //alert("goInfoUpdateForm.jsp로 이동");
    var str = "business_no=" + business_no;
    location.replace("/posbis/infoUpdateForm.do?"+str);
    
    
 }


      $(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){			
					checkBusinessNoForm();
					
				});	

				$('[name=changeBusinessNo]').change();
							
				
	  	});
	  	var b_no;

      function checkBusinessNoForm(){
			$.ajax({
				url : "/posbis/myPageProc.do"
				, type : "post"
				, async : false
				, data : $("[name=myPageForm]").serialize()					
				, success : function(myPageDTO){
						$(".uid").empty();
						$(".uName").empty();
						$(".email").empty();
						$(".businessNo").empty();
						$(".businessName").empty();
						$(".addr").empty();
						$(".businessType").empty();
						$(".storeNum").empty();
						$(".businessOpen").empty();
						$(".businessClose").empty();
						business_no = myPageDTO.myInfo[0].business_no;

					if(myPageDTO != null){
						var info = myPageDTO.myInfo[0];
						$('.uid').append(info.user_id);
						$('.uName').append(info.user_name);						
						$('.email').append(info.email);
						$('.businessNo').append(info.business_no);
						$('.businessName').append(info.business_name);
						$('.addr').append(info.store_addr);						
						$('.businessType').append(info.business_type );
						$('.businessOpen').append(info.business_open + " 시");
						$('.businessClose').append(info.business_close + " 시");
						$('.storeNum').append(info.store_tel_num);							
					}
					else if (myPageDTO == null){alert("실패");}
					else {alert("서버 오류 발생. 관리자에게 문의 바람");} 
				}
				, error : function(request, error){
					alert("서버 접속 실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);				
				}				
			});
      }



      function gowithdrawalForm(){
         //alert("withdrawalForm.jsp로 이동")
         location.replace("/posbis/withdrawalForm.do")
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
		//qna 게시판- 자주 묻는 질문
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


//=============================================김수민============================================================

		function delBusi(){
			var userPwd = prompt('해당 가게를 삭제하기 위해 본인 확인이 필요합니다.','사용자 비밀번호를 입력해주세요.');
			$("[name=myPageForm] [name=user_pwd]").val(userPwd+'');
			if(userPwd==null){ alert("삭제를 취소했습니다."); }
			else{
		         $.ajax({
	                url : "/posbis/delBusiProc.do"
	                , type : "post"
	                , data : $("[name=myPageForm]").serialize()
	                , success : function(deleteBusiCnt){
							if(deleteBusiCnt==1){
								alert("삭제 성공");
								location.replace("/posbis/myPageForm.do");
							}else if(deleteBusiCnt==-1){
								alert("비밀번호가 잘못 입력 되었습니다");
							}else{
								alert("서버쪽 DB 연동 실패");
								alert(deleteBusiCnt);
							}
						
					}, error : function(){
	                      alert("서버 접속 실패");
	                }
	             });
			}	
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
			<h2 style="font-size:65px"><strong>내정보 보기</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-user"></i> 마이페이지 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-settings"></i> 내정보 보기</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


     <!--==========================
     내 정보 보기
    ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">내정보 보기</font>
              </header>
			<div class="panel-body"> 
            <!------------------ 메인으로 보여줄 div -------------------->
               <form name="myPageForm" method="post" action="/posbis/myPageForm.do" class="form-horizontal"> 
            
               			<!-- 수민수민 -->
					 <input type="hidden" name="user_pwd" class="user_pwd">
					 <input type="hidden" name="user_id" class="user_id" value=${user_id}>
					 	<!-- ======== -->

					 	   <div class="form-group" style="width:60%; margin:50 0 0 -42">
				             <label class="col-sm-2 control-label" style="padding:0 0 0 0">사업자 번호</label>
				             <div class="col-sm-6">
									<select class="form-control addr_gu" name="changeBusinessNo" align="center">
								 		<c:forEach items="${businessNoList}" var="businessNoList">											
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
												</option>
										</c:forEach>
									</select> 				            
							 </div>
							
							 		<div >
									 	<button  class="btn btn-default" type="button" value="가게정보 삭제" onClick="delBusi();">가게정보 삭제</button>
									 	&nbsp;&nbsp;&nbsp;&nbsp;
										<button  class="btn btn-default" type="button" value="가게 추가"  onclick="location.replace('/posbis/newBusiForm.do');">가게 추가</button>
									</div> 
							</div> 
		 	

								 
				</form><br><br>

               <!-- 회원정보 form 태그 -->
               <form class="cusForm" name = "cusForm" method="post" action=""><center>

                  <!-- 내정보 보기 -->
         
  <!-- page start-->
   
          <div class="col-sm-6" style="margin:20 0 0 145">
            <section class="panel" >
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	<font color="#39485f">개인정보</font>
              </header>
              
              <table class="table table-hover" > 
              
                     
                     <tr >
                        <th width="10%"> ID
                        <td width="20%" name=uid class=uid>

                      <tr >
                         <th>  회원명
                        <td  name=uName class=uName>
                     
                      <tr >
                         <th>  이메일
                        <td   name=email class=email>


                  	 <tr >
                         <th>  사업자번호
                        <td  name=businessNo class=businessNo>

                        <tr >
                         <th>  상호명
                        <td   name=businessName class=businessName>

                        <tr >
                        <th>  가게주소
                        <td   name=addr class=addr>
                        
                       <tr >
                         <th> 업종
                        <td name=businessType class=businessType>
                        
                        <tr >
                         <th> OPEN시간
                        <td name=businessOpen class=businessOpen>
                        
                        <tr >
                         <th> CLOSE시간
                        <td name=businessClose class=businessClose>
 
                       <tr >
                         <th>  매장번호
                        <td  name=storeNum class=storeNum>
                  </table> 
                   </section>
                   <br>
                   <!-- <button  class="btn btn-default" type="button" value="메인으로" onClick="goMainForm();" >메인으로</button> -->
                   <button  class="btn btn-default" type="button" value="정보수정" onClick="goInfoUpdateForm();" >정보수정</button>
                    &nbsp;&nbsp;
                   <button  class="btn btn-default" type="button" value="회원탈퇴" onClick="gowithdrawalForm();" >회원탈퇴</button>
             </div>   
          
          &nbsp;&nbsp;
          
 			<div >
	            <div>
					<img src="resources/bootstrap/img/myinfo.png" class="img-fluid" alt="" style="width:450; height:500">
              	</div>
            </div>
            
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            
          </div>
         
               
                   </section>

            <br>
            <br>
            <br>
  
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
 