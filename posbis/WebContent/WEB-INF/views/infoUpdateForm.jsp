<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ include file="common.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
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

   <head>
 
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
   <script src="jquery-1.11.0.min.js"></script>
  <script>



	   $(document).ready(function() {

		  /*  $(".help").hover(
	            function(){

	               $(this).append("<div class='helpA'>");
	               $(".helpA").append("<br>&nbsp;일반<br>");
	               $(".helpA").append("&nbsp;&nbsp;- 비용: 무료<br>");
	               $(".helpA").append("&nbsp;&nbsp;- 서비스: 점포에서 사용하는 POS의 정보를 사이트에서 원격으로 확인 가능");
	               $(".helpA").append("<br><br>&nbsp;프리미엄<br>");
	               $(".helpA").append("&nbsp;&nbsp;- 비용: 월 10,000원 (부가세 별도)<br>");
	               $(".helpA").append("&nbsp;&nbsp;- 서비스: 지역별/상품별 매출현황 비교, 위치기반 메뉴 추천");
	               $(".helpA").append("</div>");
	            }
	            ,function(){
	               $(this).find(".helpA").remove();
	            }
	         ); */
		   
	 

		   $(".newPwd").keyup(function(){
	           $('font[name=check]').text('');
	        });
	         $(".checkPwd").keyup(function(){
	            if($(".newPwd").val()!=$(".checkPwd").val()){
	               $('font[name=check]').text('');   
	               $('font[name=check]').html('&nbsp;암호틀림');   
	            }else{
	               $('font[name=check]').text('');   
	               $('font[name=check]').html('&nbsp;암호맞음');
	            }
	         });

	     	// 라디오 버튼의 value 값 1과 2 중에서 저장된 유저의 rank_code 값에 따라 라디오 버튼 체크	
		 	   var st = ${myNStoreInfo[0].rank_code};
		 	   $('input:radio[name=rank_code]:input[value=' + st + ']').attr("checked", true);
		 	   if(st=='1'){
		 		  $('#label1').addClass("active");
			 	}
		 	   else if(st=='2'){
		 		  $('#label2').addClass("active");
			 	}

	       
	       
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
	                   }
	         
	              }   
	                  , error : function(){
	                   alert("서버 접속 실패");
	                }
	           }); /*  $.ajax({  */     
	         
	      });/* $("[name=addr_gu]").change(function(){ */
	         
	         
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
	                  }
	                    
	                }, error : function(){
	                   alert("서버 접속 실패");
	                  }
	           }); /*  $.ajax({  */
	         
	         
	         
	      });   /* $("[name=business_type_name1]").change(function(){ */



	      $("[name=business_open]").change(function(){
	            //alert($("[name=business_open]").find("option:selected").index());
	            k=$("[name=business_open]").find("option:selected").index();
	       	 	$("[name=business_close] option:eq("+k+")").remove();
	        });
			
	    });/*  $(document).ready(function() { */ 
	    

	    	
 


	    
	 // 회원정보 수정 데이터 저장 (저장 버튼 눌렀을 때 실행되는 함수)	
	      function checkUserRegForm(){
	    	  //alert($("[name=infoUpdateForm]").serialize());
	    	  
	    	  if( is_empty(".user_pwd") ){
	              alert("암호 입력이 필요합니다.");
	              $(".user_pwd").val("");
	              return;
	           }
	         if(is_valid_pattern("[name=user_pwd]", /^[0-9]{1,10}$/) == false){
	             alert("암호는 숫자 10개 이하로 입력해주세요");
	             return;
	  			}
			 if($("[name=newPwd]") == ""){
	        	 if(is_valid_pattern("[name=newPwd]", /^[0-9]{10}$/) == false){
	           	  alert("새로운 암호는 숫자 10개를 입력해주세요");
	           	  return;
	  			}
			 }

	         if($(".newPwd").val()!=$(".checkPwd").val()){
	        	 alert("비밀번호를 확인해 주세요");
	             return;	
	        	}
	         
	         if( is_empty(".user_name") ){
	              alert("이름 입력이 필요합니다.");
	              $(".user_name").val("");
	              return;
	           }
	         if( is_empty(".birth") ){
	              alert("생년월일 입력이 필요합니다.");
	              $(".birth").val("");
	              return;
	           }

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
	              alert("주소(동) 체크가 필요하니다.");
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
	      
	         if( is_empty(".rank_code") ){
	              alert("회원등급 체크가 필요합니다.");
	              $(".rank_code").val("");
	              return;
	           } 
	         

	       //생년월일 유효성 검사 함수 ============================================

	     		if (is_valid_pattern("[name=birth]", /^[0-9]{8}$/) == false) {
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			$(".bitrhAvailability").val('false');
	     			return;
	     		}

	     		var year= Number($("[name=birth]").val().substr(0,4));
	     		var month= Number($("[name=birth]").val().substr(4,2));
	     		var day= Number($("[name=birth]").val().substr(6,2));
	     		var today = new Date();
	     		var yearNow = today.getFullYear();

	     		if(1900>year || year>yearNow){
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			return;
	     		}
	     		else if(year>(yearNow-14)){
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			return;
	     		}
	     		else if(month<1 || month>12){
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			return;
	     		}
	     		else if(day<1 || day>31){
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			return;
	     		}
	     		else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	     			$('font[name=birth]').text('');
	     			alert('생년월일을 다시 확인해주세요.');
	     			return;
	     		}
	     		else if (month == 2) {
	     			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	     			if (day>29 || (day==29 && !isleap)) {
	     					$('font[name=checkBirth]').text('');
	    	     			alert('생년월일을 다시 확인해주세요.');
	     					return;
	     			}
	     		}


	     	//생년월일 유효성 검사 함수  끝============================================
	      
	         if( is_valid_pattern("[name=email]", /^([0-9a-zA-Z]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/)==false ){
	             alert("이메일 형식을 벗어납니다.");
	             return;
	          }
	  
	          if( is_valid_pattern(".business_no", /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/)==false ){
	             alert("사업자번호 형식을 벗어납니다.");
	             return;
	          }  


	          if($("input[name=user_pwd]").val()!=${user_pwd}){
		             alert("비밀번호가 틀렸습니다.");
		             //alert(${user_pwd});
		             return;
		      } 

	    	  $.ajax({ 
	              url : "/posbis/infoUpdateProc.do"
	              ,type : "post"   
	              ,data : $("[name=infoUpdateForm]").serialize()
	             , success : function(updateSuccess) {
	                

					if(updateSuccess == 1){
						alert("프리미엄 등급으로 변경되었습니다.\n 카드가 등록 되어 있지 않아 카드 등록페이지로 이동합니다.");
						location.replace("/posbis/payFormLogin.do");
						//location.replace("/posbis/mainForm.do");
						
					}
					else if (updateSuccess == 2){
						alert("프리미엄 등급으로 변경되었습니다.\n 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 3){
						alert("서버 오류 발생. 관리자에게 문의 바람1");
					}
					else if (updateSuccess == 4){
						alert("일반 등급으로 변경되었습니다.\n 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 5){
						alert("일반 등급으로 변경되었습니다.\n 등록된 카드는 삭제됩니다. 로그인을 다시 해주세요.");
						location.replace("/posbis/mainForm.do");
					}
					else if (updateSuccess == 6){
						alert("회원정보가 수정되었습니다.");
						location.replace("/posbis/myPageForm.do");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람2");
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
	<section class="page-top-section set-bg"
		data-setbg="resources/bootstrap/img/page-top-bg/mypageBg.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>회원정보 수정</strong></h2>
			<div style=" color:#fff; width:40%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-user"></i> 마이페이지 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-settings"></i> 내정보보기 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-wrench"></i> 회원정보 수정 </span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

   <!--==========================
      회원가입 수정
    ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-6" align="center" style="margin:0 0 0 460">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	  <font color="#39485f">회원정보수정</font>
              </header>  
              
 
			<div class="panel-body"> 
			
      <div class="container">
      <form class="infoUpdateForm" method="post" name="infoUpdateForm" action="/posbis/infoUpdateForm.do">
      <div  class="form-group" style="border-bottom:insert;">

		<section class="panel">
		    <header class="panel-heading" style="background-color:#7f9ed436;">
		      	<font color="#39485f">대표자 정보</font>
		    </header>
		
			  <table class="table table-hover">
			
				 <tr>
				  <td> 아이디 </td>
				  <td>
				     <input type = "text" name="user_id" class="user_id form-control" readonly value="${myNStoreInfo[0].user_id}"/>	
				  </td>			  
				</tr>
				
				  <tr>
				   <td> 현재 비밀번호 </td>
				   <td> <input type = "password" name="user_pwd" class="user_pwd form-control" /> </td>
				 </tr>
				
				<tr>
				 <td> 새 비밀번호 </td>
				 <td> <input type = "password" name="newPwd" class="newPwd form-control" /> </td>
				</tr>
				
				<tr>
				 <td> 새 비밀번호 확인 </td>
				  <td> <input type = "password"  name="checkPwd" class="checkPwd form-control"/><font name="check" size="2" color="red"></font> </td>
				</tr>
				
				<tr>
				 <td> 성명 </td>
				 <td> <input type = "text" name="user_name" class="user_name form-control" value="${myNStoreInfo[0].user_name}"/> </td>
				</tr>
				
				<tr>
				 <td> 생년월일 </td>
				 <td> 
				      <input type="text" class="birth form-control" id="birth" name="birth"  maxlength="8" readonly value="${myNStoreInfo[0].birth}" ></td>			 
				</tr>		
				
				<tr>
				 <td> 이메일 </td>
				 <td>
				  <input type = "text" name="email" class="email form-control" value="${myNStoreInfo[0].email}"/>
				   </td>
				</tr>
				
			</table>
			
		</section>
	</div>  
		 

 <br><br><br>
 
 
  <div  class="form-group" style="border-bottom:insert;">
  <section class="panel">
    <header class="panel-heading" style="background-color:#7f9ed436;">
       	<font color="#39485f">사업장 정보</font>
     </header>

     <table class="table table-hover">  
  <tr>
   <td  width="243"> 사업자 번호 </td>
      <td> <input type = "text" name="business_no" class="business_no form-control" readonly value="${myNStoreInfo[0].business_no}"/> </td>
   
   </tr>

  <tr>
   <td> 상호명 </td>
   <td> <input type = "text" name="business_name" class="business_name form-control" value="${myNStoreInfo[0].business_name}"/> </td>
  </tr>

  <tr>
   <td> 주소 </td>
   <td>
    <select name="addr_gu" class="addr_gu form-control">
        <!--  onchange="getAddrDong()" -->
        	<option value="${myNStoreInfo[0].addr_gu}">${myNStoreInfo[0].addr_gu}</option>
           <c:forEach items="${addrListGu}" var="addrGu">
              <option value="${addrGu.addr_gu}">${addrGu.addr_gu}</option>
           </c:forEach></select> 
     <br>
     <select name="addr_dong" class="addr_dong form-control">
                 <option value="${myNStoreInfo[0].addr_dong}" selected>${myNStoreInfo[0].addr_dong}</option>
       
         
     </select>
  </td>
  </tr>
  
  <tr>
   <td> 상세주소 </td>
   <td>
    <input type = "text" size=50 name="addr_detail" class="addr_detail form-control" value="${myNStoreInfo[0].addr_detail}"/>
   </td>
  </tr>

  <tr>
   <td> 업종 </td>
   <td>
    <select name="business_type_name1" class="business_type_name1 form-control">
          <option value="${myNStoreInfo[0].business_type_name1}">${myNStoreInfo[0].business_type_name1}</option>
          <c:forEach items="${businessTypeList1}" var="busiType1">
             <option value="${busiType1.business_type_name1}">${busiType1.business_type_name1}
             </option>
          </c:forEach>
          
    </select> <br><select name="business_type_name2" class="business_type_name2 form-control" onchange="getbusiListname2();">
           <option value="${myNStoreInfo[0].business_type_name2}">${myNStoreInfo[0].business_type_name2}</option>
 
    </select>
  </td>
  </tr>

  <tr>
   <td> 매장 번호 </td>
   <td>
    <input type = "text" size = "12" name="store_tel_num" class="store_tel_num form-control" value="${myNStoreInfo[0].store_tel_num}"/>
    <!-- <span>&nbsp;&nbsp;*숫자만 입력하세요</span> -->
   </td>
  </tr>
  
  <tr>
   <td> OPEN시간 </td>
   <td>
    <select name="business_open" class="business_type_name1 form-control">
          <option value='${myNStoreInfo[0].business_open}'>${myNStoreInfo[0].business_open} 시</option>
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
  </td>
  </tr>
  
  <tr>
   <td> CLOSE시간 </td>
   <td>
    <select name="business_close" class="business_type_name1 form-control">
          <option value='${myNStoreInfo[0].business_close}'>${myNStoreInfo[0].business_close} 시</option>
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
  </td>
  </tr>
  
  
  
 <tr>
       <td >회원등급</td>
       <td>
       		<br>
       		<div class="btn-group" data-toggle="buttons">
	       		<label class="btn btn-default " id="label1"> 
					<input type="radio" class="rank_code" name="rank_code" id="option1"	value="1"> 일반
				</label> 
				<label class="btn btn-default" id="label2"> 
					<input type="radio"	class="rank_code" name="rank_code" id="option2" value="2"> 프리미엄
				</label> 
			</div>
             &nbsp;&nbsp; 
             <br><br>
                                  <div  style="text-align:left; font-size:18">
                                     [회원등급별 혜택]
                                  </div>
                                  
                                  <div  style="text-align:left; font-size:12">
                                     &nbsp;● 일반<br>
                                    &nbsp;&nbsp;&nbsp;- 비용: 무료<br>
                                    &nbsp;&nbsp;&nbsp;- 서비스: 점포에서 사용하는 POS의 정보를 사이트에서 원격으로 확인 가능<br>
                                    &nbsp;● 프리미엄<br>
                                    &nbsp;&nbsp;&nbsp;- 비용: 월 10,000원 (부가세 별도)<br>
                                    &nbsp;&nbsp;&nbsp;- 서비스: 지역별/상품별 매출현황 비교, 위치기반 메뉴 추천
                                  </div>
       </td>
  </tr>
    

</table>
</section>
</div>

<br>

  	<div style="float:center">
    	<button class="btn btn-default" type="button" value="저장" onClick="checkUserRegForm();" >저장 </button> 		
		<button class="btn btn-default" type="reset" value="다시작성"  >다시작성 </button> 
		<button class="btn btn-default" type="button" value="취소" onClick="goMyPageForm();" >취소 </button>
	</div>

</form>
 <br>
 </div>
  <br>
 </div>
 </div>
 </section>
 </div>
 <br>
 <br>
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
 