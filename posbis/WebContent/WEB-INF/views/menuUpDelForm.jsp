<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>메뉴 수정/삭제</title>
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


 <script>
  
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
 
      <script>
      
      $(document).ready(function(){
			
			var main ='<c:out value="${menuDTO.main_category_name}"/>';
			var mid = '<c:out value="${menuDTO.mid_category_name}"/>';
			var sub = '<c:out value="${menuDTO.sub_category_name}"/>';
			var mcn = "";"WebContent/WEB-INF/views/menuUpDelForm2.jsp"
			var scn = "";
			
			if( main != ""){
				mcn = main; 
			}
			if( mid != ""){
				scn = mid;
			}
					
				$.ajax({
					url : "/posbis/middleProc.do"
					,type : "post"
					,data : "main_category_name=" + mcn
					, success : function(menuCategory2) {
						for(var i=0; i<menuCategory2.length; i++){
						$("[name=mid_category_name]").append('<option value='+menuCategory2[i]+'>'+menuCategory2[i]+'</option>');
						inputData("[name=mid_category_name]", "${menuDTO.mid_category_name}");
						}
					} //success
					, error : function(){
						alert("서버 접속 실패");
					} //error
				});
				
				$.ajax({
					url : "/posbis/subProc.do"
					,type : "post"
					,data : "mid_category_name=" + scn
					, success : function(menuCategory3) {
						for(var i=0; i<menuCategory3.length; i++){
							$("[name=sub_category_name]").append('<option ${scn eq menuCategory3[i] ? 'selected' :''} value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
							inputData("[name=sub_category_name]", "${menuDTO.sub_category_name}");
						}
					} //success
					, error : function(){
						alert("서버 접속 실패");
					} //error
				}); // $.ajax

				
				$("[name=main_category_name]").change(function(){
	   				//alert($(this).val());
	   				$("[name=mid_category_name]").empty();
	   			$.ajax({
	      
	      			url : "/posbis/middleProc.do"
	      			,type : "post"
	      			,data : "main_category_name=" + $(this).val()
	      			, success : function(menuCategory2) {
	         			var str="--중분류--";
	         			for(var i=0; i<menuCategory2.length; i++){
	            			$("[name=mid_category_name]").append("<option value="+menuCategory2[i]+">"+menuCategory2[i]+"</option>");
	      				}
	         			if(menuCategory2[0]!=str){
	            			$("[name=mid_category_name]").prepend("<option value='' selected>"+str+"</option>");
	         			}
	      			} //success
	      			, error : function(){
	          			alert("서버 접속 실패");
	      			} //error
	      
	   			}); // $.ajax({
	   
			}); //$("[name=main_category_name]").change(function(){

	   
			$("[name=mid_category_name]").change(function(){
	   			//alert($(this).val());
	   			$("[name=sub_category_name]").empty();
	   
		  			 $.ajax({
		      
		      			url : "/posbis/subProc.do"
		      			,type : "post"
		      			,data : "mid_category_name=" + $(this).val()
		      			, success : function(menuCategory3) {
		         			var str="--소분류--";
		         			for(var i=0; i<menuCategory3.length; i++){
		            			$("[name=sub_category_name]").append('<option value='+menuCategory3[i]+'>'+menuCategory3[i]+'</option>');
		         			}
		         			if(menuCategory3[0]!=str){
		            			$("[name=sub_category_name]").prepend("<option value='' selected>"+str+"</option>");
		         			}
		      			} //success
		      			, error : function(){
		          			alert("서버 접속 실패");
		      			} //error
		      
		   			}); // $.ajax({
		           
		        }); //$("[name=main_category_name]").change(function(){ 

		     }); //$(document).ready(function(){
		     
		         // 메뉴관리 페이지로 이동
		         function goMenuForm(){
		            location.replace( "/posbis/menuForm.do" );
		         }
				// 메뉴판 수정/삭제 유효성 체크 함수 선언
				function checkMenuUpDelForm(upDel){

					 // 삭제 버튼 눌렀을 경우
		               if(upDel=='del'){
		                  $("[name=upDel]").val("del");
		                  $("[name=menu_price]").val(${menuDTO.menu_price});
		                  $("[name=menu_cost]").val(${menuDTO.menu_cost});
		                  if(confirm("메뉴를 삭제 하시겠습니까?")==false) {return;}
						
					}else if(upDel=="up"){
						if(is_empty("[name=main_category_name]")){
							alert("대분류를 선택해주세요");
							$("[name=middle_category]").focus();
							return;
						}
						
						if(is_empty("[name=mid_category_name]")){
							alert("중분류를 선택해주세요");
							$("[name=sub_category]").focus();
							return;
						}
						
						if(is_empty("[name=sub_category_name]")){
							alert("소분류를 선택해주세요.");
							$("[name=menu_name]").focus();
							return;
							
						}
						if(is_empty("[name=menu_name]")){
							alert("메뉴이름을 입력해주세요.");
							$("[name=menu_price]").focus();
							return;
						}
						
						if(is_empty("[name=menu_price]")){
							alert("메뉴가격을 입력해주세요.");
							$("[name=menu_cost]").focus();
							return;
						}

						if(is_valid_pattern($("[name=menu_price]"), /^[0-9]{1,15}$/)==false){
			          		alert("메뉴가격은 숫자로 입력해주세요."); 
			          		$("[name=menu_price]").val("");
			          		$("[name=menu_price]").focus();
			          	 	return;
						}
						
						if(is_empty("[name=menu_cost]")){
							alert("메뉴원가를 입력해주세요.");
							return;
						}

						if(is_valid_pattern($("[name=menu_cost]"), /^[0-9]{1,15}$/)==false){
			          		alert("메뉴원가는 숫자로 입력해주세요."); 
			          		$("[name=menu_cost]").val("");
			          		$("[name=menu_cost]").focus();
			          	 	return;
						}

						if(confirm("메뉴수정 하시겠습니까?")==false) {return;}
					}
					$.ajax({
						//--------------------------
						// 서버 쪽 호출 URL 주소 지정
						//--------------------------
						url : "/posbis/menuUpDelProc.do"
						//--------------------------
						// 전송 방법 설정
						//--------------------------
						, type : "post"
						//--------------------------
						// 서버로 보낼 파라미터명과 파라미터값을 설정
						//--------------------------
						, data : $('[name=menuUpDelForm]').serialize()
						//--------------------------
						// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
						// 매개변수upDelCnt 에는 입력 행의 개수가 들어온다.
						//--------------------------
						, success : function(upDelCnt){
							if(upDel=="up"){
								if(upDelCnt==1){
								alert("메뉴 수정이 완료되었습니다.");
								location.replace("/posbis/menuForm.do");
								}else{
									alert("서버쪽 DB 연동 실패!");
								}
							}else if(upDel=="del"){
								if(upDelCnt==1){
								alert("메뉴가 삭제되었습니다.");
								location.replace("/posbis/menuForm.do");
								}else{
									alert("서버쪽 DB 연동 실패!");
								}
							}
						}
						//--------------------------
						// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
						//--------------------------
						, error : function(){
							alert("서버와 통신 실패");
						}
					}); //$.ajax({
					
				} //function checkBoardUpDelForm(upDel){

					
				 
      
      
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
				
				<li><a class="active" style="cursor:pointer; font-size:20; margin:-3 80 4 0">매장관리</a>
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
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/storeBg.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>메뉴수정</strong></h2>
			<div style=" color:#fff; width:40%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-warehouse"></i> 매장관리 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-utensils"></i> 메뉴관리 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="ti-eraser"></i> 메뉴수정</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->


    <!--==========================
      	메뉴 수정
    ============================-->
 
  <main id="main">
 
 
    <section id="main-content">
      <section class="wrapper">
 
      <div class="row">
      
          <div class="col-lg-8" style="margin:0 0 0 330; ">
            <section class="panel" >
              <header class="panel-heading" style="text-align:center;background-color:#7f9ed436;">
                 <font color="#39485f">[메뉴수정]</font>
              </header>
              <div class="panel-body"> 
                  <form name = "menuUpDelForm" method="post" action="/posbis/menuUpDelProc.do"class="form-validate form-horizontal" id="feedback_form" >
                    <div class="form-group" > 
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 125">메뉴사용여부 <span class="required">*</span></label>
 
				 <div class="col-lg-6">
				<c:choose >
					<c:when test="${menuDTO.menu_using == 'Y'}">
						<input type ="radio" id="menu_using_y" name="menu_using" value="Y" checked ><label for="menu_using_y">사용</label>
						<input type ="radio" id="menu_using_n" name="menu_using" value="N"><label for="menu_using_n">미사용</label>
					</c:when>
					<c:otherwise>
						<input type ="radio" id="menu_using_y" name="menu_using" value="Y"><label for="menu_using_y">사용</label>
						<input type ="radio" id="menu_using_n" name="menu_using" value="N" checked><label for="menu_using_n">미사용</label>
					</c:otherwise>
				</c:choose>
			</div>
</div>
                  <div class="form-group"> 
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 125">분류 <span class="required">*</span></label>
                     <div class="col-lg-2">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                        
                        <select name="main_category_name" class="main_category_name form-control">
					<c:forEach items="${menuCategory1}" var="menucate">
						<option value="${menucate.main_category_name}"
						<c:if test="${menuDTO.main_category_name == menucate.main_category_name}">
							selected
						</c:if>
						>${menucate.main_category_name}</option>
					</c:forEach>
				</select>
                      </div>
                      <div class="col-lg-2">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                      <select name="mid_category_name" class="mid_category_name form-control">
				</select>
                      </div>
                      <div class="col-lg-2">
                     <!--    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
                    <select name="sub_category_name" class="sub_category_name form-control">
				</select>
                      </div>
                  </div>
                   
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 125">메뉴이름 <span class="required">*</span></label>
                    <div class="col-lg-6">
					<input type="text" size="40" maxlength="50" name="menu_name" value="${menuDTO.menu_name}" class="form-control"> </div> 
                  </div>
                  
                   <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 125">메뉴가격 <span class="required">*</span></label>
                    <div class="col-lg-6">
						<input type="text" size="40" maxlength="50" name="menu_price" value="${menuDTO.menu_price}" class="form-control"> </div>원
                  </div>
                  
                  <div class="form-group">
                    <label for="cname" class="control-label col-lg-2" style="margin:0 0 0 125">메뉴원가 <span class="required">*</span></label>
                    <div class="col-lg-6">
						<input type="text" size="40" maxlength="50" name="menu_cost" value="${menuDTO.menu_cost}" class="form-control"> </div>원
                  </div>
                  
       <!------------------------------------------------------------->
			<table><tr height=4><td></table>
			<input type ="hidden" name="upDel" value="up">
			<input type ="hidden" name="menu_no" value="${param.menu_no}">
			<%-- <div>
			${menuDTO.main_category_name}
			${menuDTO.mid_category_name}
			${menuDTO.sub_category_name}
			${menuDTO.menu_name}
			${menuDTO.menu_price}
			${menuDTO.menu_cost}
			${menuDTO.menu_no}
			${menuDTO.menu_using}
			
			</div> --%>
			<!------------------------------------------------------------->
	<!-- 		<div style="float:right"> 
			<input type="button" value="메뉴수정" onClick="checkMenuUpDelForm('up')">
			<input type="button" value="메뉴삭제" onClick="checkMenuUpDelForm('del')">
			<input type="reset" value="목록보기" onClick="document.menuForm.submit();">
			</div>
			 -->
			<div style="margin:0 0 0 420"> 
                   <button class="btn btn-default" type="button" value="메뉴수정" onClick="checkMenuUpDelForm('up')">메뉴수정 </button>
                   <button class="btn btn-default" type="button" value="메뉴삭제" onClick="checkMenuUpDelForm('del')">메뉴삭제 </button>
                
                <button class="btn btn-default" type="reset" value="목록보기"   onClick="document.menuForm.submit();">목록보기 </button>
             
            </div>
			<!------------------------------------------------------------->
		</form>
		
		<form name="menuForm" method="post" action="/posbis/menuForm.do" >
			<input type="hidden" name="selectPageNo" value="${param.selectPageNo}" >
		    <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}" >
		    <input type="hidden" name="keyword" value="${param.keyword}" >
		</form>

              </div>
            </section>
          </div>
    </div>
 </section>
</section>
<br><br>
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