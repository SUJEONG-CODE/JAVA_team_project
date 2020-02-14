<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ include file="common.jsp"%>

<html>
<head>
<title>가게등록</title>
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
      $(document).ready(function() {
    
    
    	  $("[name=business_no]").val("128-52-98144");
          $("[name=business_name]").val("싱싱초밥");

          $("[name=addr_gu]").val("광진구");
          $("[name=addr_detail]").val("225-1");

          $("[name=business_type_name1]").val("주식류");
          
          $("[name=business_open]").val("10");
          $("[name=business_close]").val("22");
          
          $("[name=store_tel_num]").val("02-352-9854");
          $("[name=user_pwd]").val("1234");

        
        
        //  구 검색시 동 구하기 -------------------------------------------------------
        $("[name=addr_gu]").change(function(){
    
            //alert($(this).val());
            $("[name=addr_dong]").empty();
           

             $.ajax({ 
                   url : "/posbis/addrDongProc.do"
                   //,datatype:"json"
                   ,type : "post"   
                   ,data : "addr_gu=" + $(this).val() 
                  , success : function(addrDongList) {   
                         //$("[name=addr_dong]").append('<option value=''>--동 선택--</option>');   
                         
                         var str="--동 선택--";
                         
                      for(var i=0; i<addrDongList.length; i++){
                      
                        $("[name=addr_dong]").append('<option value='+addrDongList[i]+'>'+addrDongList[i]+'</option>');
                            
                         
                      }
                     if(addrDongList[0]!=str){
                        $("[name=addr_dong]").prepend("<option value='' selected>"+str+"</option>");   
                        $("[name=addr_dong]").val("능동");  
                     }
           
                }   
                    , error : function(){
                     alert("서버 접속 실패");
                  }
             }); /*  $.ajax({  */     
           
        });/* $("[name=addr_gu]").change(function(){ */

        $("[name=addr_gu]").change();
           
           
       //  업종1 검색시 업종2 구하기 -------------------------------------------------------   
         $("[name=business_type_name1]").change(function(){
           
           /*alert($(this).val())*/
          //alert($(this).val());
            $("[name=business_type_name2]").empty();
              
            $.ajax({ 
                   url : "/posbis/businessTypeName2Proc.do"
                   ,type : "post"   
                   ,data : "business_type_name1=" + $(this).val() 
                  , success : function(businessTypeList2) {
                     
                     var str="--업종2 선택--";
                   
                   
                      
                      for(var i=0; i<businessTypeList2.length; i++){
                        $("[name=business_type_name2]").append('<option value='+businessTypeList2[i]+'>'+businessTypeList2[i]+'</option>');
                            
                         
                      }
                     if(businessTypeList2[0]!=str){
                       $("[name=business_type_name2]").prepend("<option value='' selected>"+str+"</option>");   
                       $("[name=business_type_name2]").val("일식/수산물"); 
                    }
                      
                  }, error : function(){
                     alert("서버 접속 실패");
                    }
             }); /*  $.ajax({  */
           
           
           
        }); /* $("[name=business_type_name1]").change(function(){ */
        $("[name=business_type_name1]").change();

      //--------------------------------------------------open close 시간===========================
        $("[name=business_open]").change(function(){
            //alert($("[name=business_open]").find("option:selected").index());
            k=$("[name=business_open]").find("option:selected").index();
       	 	$("[name=business_close] option:eq("+k+")").remove();
        });
           
         
      });/*  $(document).ready(function() { */ 
      
      
   //*************************************************************************************   
      //사업자번호 중복확인 여부를 저장할 변수 선언
      var busiCheck = false;
      
 		function checkBusinessNo(){

	         if( is_empty(".business_no") ){
	              alert(" 사업자번호 입력해주세요.");
	              $(".business_no").val("");
	              return;
	         }
	    ////////////////////////////////////////////////////////////추가
	 		if (is_valid_pattern("[name=business_no]",
			/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/) == false) {
				alert('사업자번호는 숫자3-숫자2-숫자5 형식으로 입력해주세요.');
				busiCheck = false;
				return;
			}
		////////////////////////////////////////////////////////////	
          $.ajax({
              url : "/posbis/chekckBusinessNoProc.do"
             , type : "post"
             , data : $("[name=newBusiForm]").serialize()
             , success : function(businessnoCnt) {
                if( businessnoCnt==1 ){
                	busiCheck = false;
                   alert("이미 등록된 사업자번호 입니다.재 입력 바랍니다.");
                   location.replace('/posbis/newBusiForm.do');
                }else if(businessnoCnt == 0) {
                	busiCheck = true;
                    alert("등록가능한 사업자번호 입니다.");
 
                }else {
                      alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
                }
             }, error : function(){
                  alert("서버 접속 실패");
             	}
             
           });
     
      }  /* function checkBusinessNo(){ */

      
      function checkNewBusiForm(){
     
         //회원가입 양식 빈칸체크
        if( is_empty(".user_pwd") ){
             alert("암호 입력이 필요합니다.");
             $(".user_pwd").val("");
             return;
          }
 /*       if(is_valid_pattern("[name=user_pwd]", /^[0-9]{10}$/) == false){
            alert("암호는 숫자 10개를 입력해주세요");
            return;
      	  }*/
        if( is_empty(".business_no") ){
             alert("사업자번호 입력이 필요합니다.");
             $(".business_no").val("");
             return;
          }
        if( is_empty(".business_name") ){
             alert("상호명 입력이 필요합니다.");
             $(".business_name").val("");
             return;
          }
 
        
        if( is_empty(".addr_gu") ){
             alert("주소(구) 체크가 필요합니다.");
             $(".addr_gu").val("");
             return;
          }
        if( is_empty(".addr_dong") ){
             alert("주소(동) 체크가 필요합니다.");
             $(".addr_dong").val("");
             return;
          }
        if( is_empty(".addr_detail") ){
             alert("상세주소 입력이 필요합니다.");
             $(".addr_detail").val("");
             return;
          }
        if( is_empty(".business_type_name1") ){
             alert("업종1 체크가 필요합니다.");
             $(".business_type_name1").val("");
             return;
          }
        if( is_empty(".business_type_name2") ){
             alert("업종2 체크가 필요합니다.");
             $(".business_type_name2").val("");
             return;
          }
        if( is_empty(".store_tel_num") ){
             alert("매장번호 입력이 필요합니다.");
             $(".store_tel_num").val("");
             return;
          }

        if( busiCheck == false ){
            alert("사업자등록번호 중복확인을 해주세요");
            return;
         }
		        $.ajax({
		            url : "/posbis/chekckBusinessNoProc.do"
		           , type : "post"
		           , data : $("[name=newBusiForm]").serialize()
		           , success : function(businessnoCnt) {
		              if( businessnoCnt==1 ){
		              	busiCheck = false;
		                 alert("사업자등록번호 중복확인을 해주세요");
		              }
					  if (is_valid_pattern("[name=business_no]",
						/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/) == false) {
							alert('사업자번호는 숫자3-숫자2-숫자5 형식으로 입력해주세요.');
							busiCheck = false;
							return;
						}else if(businessnoCnt == 0) {

		                  //가게 추가 ajax
		                  $.ajax({
		                        url : "/posbis/newBusiProc.do"
		                        , type : "post"
		                        , data : $("[name=newBusiForm]").serialize()
		                        , success : function(newBusiCnt){
		      						if(newBusiCnt==1){
		      							//alert("추가 성공");
		      							location.replace("/posbis/myPageForm.do");
		      						}else if(newBusiCnt==-1){
		      							alert("비밀번호가 잘못 입력 되었습니다");
		      						}else{
		      							alert("서버쪽 DB 연동 실패");
		      						}
		      					
		      				}, error : function(){
		                              alert("서버 접속 실패");
		                        }
		                     });  
			              	
		
		              }else {
		                    alert("서버 오류 발생!! 관리자에게 문의 바랍니다.");
		              }
		           }, error : function(){
		                alert("서버 접속 실패");
		           	}
		           
		         });
      //*************************************************************************************   

      }
//*************************************************************************************   
//취소 클릭     
    function goMainForm(){
         location.replace("/posbis/homePageForm.do");
      }
    
  //--------------------------------------------------------------------------------------------------
    
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
//************************************************************************
//--------------------------------------------------------------------------------------------------
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
			<h2 style="font-size:65px"><strong>가게등록</strong></h2>
			<div style=" color:#fff; width:40%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-user"></i>마이페이지 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-settings"></i>내정보 보기 ></span><span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-plus-circle"></i>가게등록</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


<!--==========================
  사업자 번호 추가
============================-->

   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-7" align="center" style="margin:0 0 0 410; ">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">사업자 번호 추가</font>
              </header> 
  
 	<div class="panel-body">
      <FORM class="newBusiForm form-horizontal" method="post" name="newBusiForm"
         action="/posbis/newBusiForm.do">

		<input type="hidden" name="user_id" value="${user_id}">  
            <div class="form-group">
             <label class="col-sm-2 control-label" style="margin:0 20 0 30">사업자 번호</label>
             <div class="col-sm-6">
                     <input type="text" name="business_no" class="business_no form-control" placeholder="(10자리, 000-00-0000)" maxlength="12" required/>
             </div>
					<a class="btn btn-default"onclick="checkBusinessNo();" title="Bootstrap 3 themes generator" name="checkOverlapBusinessNo" class="checkOverlapBusinessNo" style="margin:0 17 0 0">사업자 번호 중복확인</a>
         	</div>
			
			 <div class="form-group">
			 	<label class="col-sm-2 control-label" style="margin:0 20 0 30">상호명</label>
      		<div class="col-sm-6">
	  				<input type="text" name="business_name" class="business_name form-control" placeholder="상호명"/> 
            </div>
            </div>
            
        <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin:0 20 0 30">주소</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 addr_gu" name="addr_gu">
                                              <option>--구 선택--</option>
                                              <c:forEach items="${addrListGu}" var="addrGu">
													<option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
											  </c:forEach>
                       </select>
                       
                       <select class="form-control m-bot15 addr_dong" name="addr_dong" >
                                              <option>--동 선택--</option>
 
                       </select>
                    </div>
                  </div>
			 <div class="form-group">
			  	<label class="col-sm-2 control-label" style="margin:0 20 0 30">상세주소</label>
			 <div class="col-sm-6">
			 	<input type="text" size=50 name="addr_detail"
                     class="addr_detail form-control" />
			 </div>
			 </div>
			 
			  <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin:0 20 0 30">업종</label>
                    <div class="col-lg-6">
                       <select class="form-control m-bot15 business_type_name1" name="business_type_name1">
                                              <option>--선택--</option>
                                              <c:forEach items="${businessTypeList1}" var="busiType1">
													<option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
													</option>
											 </c:forEach>
                       </select>
                  <select name="business_type_name2" class="business_type_name2 form-control"
                     onchange="getbusiListname2();">
                        <option value="">--선택--</option>

                  </select> 
                  <!--********************************************************************** -->
				</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-2 control-label" style="margin:0 20 0 30">OPEN시간</label>
					<div class="col-lg-6">
						<select class="form-control m-bot15 question_code"
							name="business_open">
							<option value=''>---OPEN시간을 선택해주세요---</option>
							<option value="00">00 시</option>
							<option value="01">01 시</option>
							<option value="02">02 시</option>
							<option value="03">03 시</option>
							<option value="04">04 시</option>
							<option value="05">05 시</option>
							<option value="06">06 시</option>
							<option value="07">07 시</option>
							<option value="08">08 시</option>
							<option value="09">09 시</option>
							<option value="10">10 시</option>
							<option value="11">11 시</option>
							<option value="12">12 시</option>
							<option value="13">13 시</option>
							<option value="14">14 시</option>
							<option value="15">15 시</option>
							<option value="16">16 시</option>
							<option value="17">17 시</option>
							<option value="18">18 시</option>
							<option value="19">19 시</option>
							<option value="20">20 시</option>
							<option value="21">21 시</option>
							<option value="22">22 시</option>
							<option value="23">23 시</option>
						</select> 
						<font name="checkQuestion" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label" style="margin:0 20 0 30">CLOSE시간</label>
					<div class="col-lg-6">
						<select class="form-control m-bot15 question_code"
							name="business_close">
							<option value=''>---CLOSE시간을 선택해주세요---</option>
							<option value="00">00 시</option>
							<option value="01">01 시</option>
							<option value="02">02 시</option>
							<option value="03">03 시</option>
							<option value="04">04 시</option>
							<option value="05">05 시</option>
							<option value="06">06 시</option>
							<option value="07">07 시</option>
							<option value="08">08 시</option>
							<option value="09">09 시</option>
							<option value="10">10 시</option>
							<option value="11">11 시</option>
							<option value="12">12 시</option>
							<option value="13">13 시</option>
							<option value="14">14 시</option>
							<option value="15">15 시</option>
							<option value="16">16 시</option>
							<option value="17">17 시</option>
							<option value="18">18 시</option>
							<option value="19">19 시</option>
							<option value="20">20 시</option>
							<option value="21">21 시</option>
							<option value="22">22 시</option>
							<option value="23">23 시</option>
						</select> 
						<font name="checkQuestion" size="2" color="red" style="float:left; margin:-10 0 0 0"></font>

					</div>
				</div>
				

				<div class="form-group">
                    <label class="col-sm-2 control-label" style="margin:0 20 0 30">매장번호</label>
                    <div class="col-sm-6">
                    <input type="text" size="12" name="store_tel_num"
                     class="store_tel_num form-control" />
                </div>
                </div>
                
 
               <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin:0 20 0 30">비밀번호</label>
                    <div class="col-sm-6">
                   <input type="password" name="user_pwd" class="user_pwd form-control"
                     placeholder="PASSWORD"  maxlength="10" required /> 
                     <span style="float:left; font-size:13;"><font color="gray">*사용자 확인을 위해 비밀번호를 입력하세요 </font></span>
                     
              	</div>
              	</div>
         
 

         <div style="height: 20;"></div>

		<div style="float:center">
		<button class="btn btn-default" type="button" value="저장" onClick="checkNewBusiForm();" >저장 </button> 
 	 	<button class="btn btn-default" type="reset" value="다시작성"  >다시작성 </button> 
	 	<button class="btn btn-default" type="button" value="취소" onClick="goMyPageForm();" >취소 </button>
 
            </div>
         <!--  <input type="hidden" name=u_no value=""> -->

      </form>
 
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
 