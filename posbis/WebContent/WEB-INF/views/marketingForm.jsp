<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>마케팅 전략</title>
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


  
  </style>
  
</head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>      
   <script>  
   
	   $(document).ready(function(){
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기
			inputData("[name=changeBusinessNo]","${marketingDTO.changeBusinessNo}");
			inputData("[name=dataArea]","${marketingDTO.dataArea}");

			//처음 페이지 로딩 시 제일 처음으로 나오는 사업자번호 자동 선택
			//폼으로 접속하고 DTO에 값 세팅
		   if($("[name=changeBusinessNo]").val() ==""){ 
				$("[name=changeBusinessNo]").find('option:eq(1)').prop("selected",true);
				//$("#dataAreaType").prop("checked",true);
				document.marketingForm.submit();
				marketingDTO.setChangeBusinessNo($("[name=marketingForm] [name=changeBusinessNo]").val());
				marketingDTO.setDataArea($("[name=marketingForm] [name=dataArea]").val());
			}

			
		   /* $("#menuSet").load("/posbis/marketingForm.do #menuSet",$("[name=marketingForm]").serialize());
		   reSearch(); */

		   
			//사업자번호 셀렉트 박스에 change 이벤트 발생 시 실행할 함수
		   $('[name=changeBusinessNo]').change(function(){		
			   
			   $("#menuSet").load("/posbis/marketingForm.do #menuSet",$("[name=marketingForm]").serialize());
			   reSearch();
									
			});

			//검색영역 라디오 버튼에 change 이벤트 발생 시 실행할 함수
		   $('[name=dataArea]').change(function(){		
			   
			   $("#menuSet").load("/posbis/marketingForm.do #menuSet",$("[name=marketingForm]").serialize());
			   reSearch();
									
			});


			$('[name=changeBusinessNo]').change();

			

			//창 크기 조절 시 차트그리기 재실행
		   $(window).resize(function(){
	             reSearch();
	          });
		   
	});
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

	      	//검색조건에 change 이벤트가 일어나면 실행되는 함수
	      	//베스트 3위 테이블에 load 메소드를 사용하여 재로딩
	      	//ajax로 proc에 접속해서 차트 다시 띄우기
		     function reSearch(){
					//alert($("[name=marketingForm]").serialize());
					//alert($("[name=marketingForm] [name=dataArea]").val()  );
				
					
					
					$.ajax({
						// 서버 쪽 호출 URL 주소 지정
						url : "/posbis/marketingProc.do"
						
						// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
						, type : "post"

						// 서버로 보낼 파라미터명과 파라미터 값을 설정
						, data : $("[name=marketingForm]").serialize()	
						
						//비동기 방식으로 차트 재실행
						, success : function(setMenuDTO){
							//alert($("[name=marketingForm]").serialize());
								//alert("성공");
								$("#piechart").remove();
								$("#reDraw").append('<div id="piechart" style="width: 100%; height: 60%;"></div>');
								
							if(setMenuDTO != null){
								if(setMenuDTO.setMenuList.length == 0){
								    $("#piechart").append("<h3>선택하신 조건에 적합한 세트메뉴 추천 데이터가 없습니다.</h3>")
								}else{
									google.charts.load('current', {'packages':['corechart']});
									google.charts.setOnLoadCallback(drawChart);
									
							function drawChart() {

									var setMenuName = new Array() ;
									var setMenuCnt = new Array();

										for(var i=0; i<setMenuDTO.setMenuList.length; i++){
											setMenuName[i] = setMenuDTO.setMenuList[i].SET_MENU ;
											setMenuCnt[i] = setMenuDTO.setMenuList[i].SALES_CNT ;
										}

									  var data = google.visualization.arrayToDataTable([]);
									        
								        data.addColumn('string', '세트메뉴');
								        data.addColumn('number', '판매건수');
								        data.addColumn({'type': 'string', 'role': 'tooltip' , 'p': {'html': true}});
								        
									   for(var j=0; j<setMenuDTO.setMenuList.length; j++ ){
											data.addRows(1);
											data.setCell(j,0,setMenuName[j]);
											data.setCell(j,1,setMenuCnt[j]);
										}

									   var sumCnt=0;
										for(var i=0; i<setMenuDTO.setMenuList.length; i++){
											sumCnt=sumCnt + parseInt(setMenuCnt[i])
										}
										//alert(sumCnt);
									//선택한 조건이 동일 업종일 때
									//tooltip으로 메뉴이름 보여주기	
					                  if(setMenuDTO.dataArea=="allStore"){
					                	  for(var j=0; j<setMenuDTO.setMenuList.length; j++ ){
												data.setCell(j,2,setMenuName[j]+' '+ (parseFloat(setMenuCnt[j]/sumCnt)*100).toFixed(1) +'%');
											}
					                  }

									//선택한 조건이 우리 가게일 때
									//tooltip으로 메뉴이름, 판매건수 보여주기	
					                  if(setMenuDTO.dataArea=="myStore"){
					                	   for(var j=0; j<setMenuDTO.setMenuList.length; j++ ){
												data.setCell(j,2,setMenuName[j] +' '+ (parseFloat(setMenuCnt[j]/sumCnt)*100).toFixed(1) +'%'+', '+ setMenuCnt[j] + '건');
											}
					                  }
					                  
									  var options = {
										    title: '세트메뉴 추천 TOP 5 \n\n'
								   			,titleTextStyle: {
								    	        fontSize: 25,
								    	        bold: true
								    	        
								    	    }
									 		,fontSize : 22
											,colors: ['#6454c6','#74A2F2', '#b2a9e7', '#7966E3','#433886']
						                    ,width: "100%"
						                    ,height: "100%"
					                        ,pieSliceText: 'percentage'          
						                    ,legend: 'labeled'
										};
					                  
									  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
									  data.sort([{column: 1, desc: true}]);
									  chart.draw(data, options);
									}
								}
							}
							else if (setMenuDTO == null){
								alert("실패 !");
							}
							else {
								alert("서버 오류 발생. 관리자에게 문의 바람");
							} 
						}
						// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
						, error : function(request, error){
							alert("서버 접속 실패");
							alert($("[name=marketingForm]").serialize());
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
						}
						
					});

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
				<li><a class="active" style="cursor:pointer; font-size:20; margin:-3 80 4 0">업계동향</a>
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
	<section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/chartBg.jpg">
		<div class="container"  style="margin: -25px 0 0 250px;">
			<h2 style="font-size:65px"><strong>마케팅 전략</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-location-pin"></i> 업계동향 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="icon-eyeglass"></i> 마케팅 전략</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">마케팅 전략</font>
              </header>
              
               
			<div class="panel-body"> 
			<div class="container" style="max-width:1400">
			<br>
  			<h1 style="font-size:40">[세트메뉴 추천]</h1>
            	 
          	<form name="marketingForm" method="post" action="/posbis/marketingForm.do"> 
						<input type="hidden" name="user_id" value="${user_id}">  
			<table border=0 width=30% height="10%" align="right" >
				<tr>
					<td align=left>
						사업자번호 : &nbsp;
						<select name="changeBusinessNo" style="width:200px; height:30px; text-align-last:center">	<!-- 중요! -->
									<option value="" style="display:none""></option>
					 		<c:forEach items="${businessNoList}" var="businessNoList">
									<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
									</option>
							</c:forEach>
						</select> 
				<tr>
					<td align=left>
						<input type="radio" name="dataArea" value="allStore" id="dataAreaType" checked><label for="dataAreaType">동일 업종</label>
						&nbsp;
						<input type="radio" name="dataArea" value="myStore" id="dataAreaMy"><label for="dataAreaMy">우리 가게</label>
					</table>
				</form>
		<input type="hidden" name="user_id" value="${user_id}">  

			<table id="menuSet" align="center" width="100%" >
			
			<c:if test="${!empty setMenuList}">
				<tr>
					<td colspan="5">
						<table><tr><td>
						<img src="resources/business_type_img/${setMenuList[0].BUSI_CODE}.jpg" class="img-fluid" alt="" width="100%" height="100%" style="margin:0 0 4 0">
						<td valign="bottom">
						<h4 style="margin:0 0 25 10"><strong style="font-size:35">${setMenuList[0].BUSI_TYPE1} > ${setMenuList[0].BUSI_TYPE2}</strong></h4>
						</table>
				<tr style="text-align:center; height:10px">
	         	<tr style="text-align:center; height:40px" >
		         	<td valign= "bottom" style="background-color:#f8f9fa; width:32%;">
                        <strong style="font-size:32">1위</strong>
			         <td style="width:2% ;">
						<!-- 여백 -->
					</td>
			         <td valign= "bottom" style="background-color:#f8f9fa; width:32%">
			         	<strong style="font-size:32">2위</strong>    
			         <td style="width:2% ;">
			       		<!-- 여백 -->
			         </td>
			         <td valign= "bottom" style="background-color:#f8f9fa; width:32%">
			         	<strong style="font-size:32">3위</strong>
	         	<tr style="text-align:center; height:220px" >
	         		<c:set var="rank1" value="0"></c:set>
		         	<td style="background-color:#f8f9fa; width:32%;">
                         <!-- ========================================================================== -->
		 	      	<c:set var="result1" value=""></c:set>
	 	 	         <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
		 	            <c:if test="${setMenu.RANKING==1}">  
		 	            	<c:set var="result1" value="${result1}\n${setMenu.SET_MENU}"/>
		 	             </c:if>
		 	         </c:forEach>
	         		<!-- ========================================================================== -->   
		         		<c:set var="loop_index" value="0"></c:set>
                          <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
                          	<a href="javascript:;" onclick="alert('${result1}')" >
                          		
                             <c:if test="${setMenu.RANKING!=1}">
                                <c:set var="loop_index" value="${loop_index + 1}" />
                             </c:if>
                             
                             <c:if test="${setMenu.RANKING==1}">   
                             <c:set var="rank1" value="${rank1 + 1}" />   
                              <h5>
                              		<c:if test="${(loopTagStatus.index-loop_index+1)<=3}">
                              			<strong style="font-size:30">${setMenu.SET_MENU}</strong>
                                    </c:if>
                                    <c:if test="${(loopTagStatus.index-loop_index+1)==4}">
                                         <strong>...</strong>
                                    </c:if>   
                             </h5>
                             </c:if>
                             </a>
                          </c:forEach>
                          <c:if test="${rank1==0}">
                             <h5>
                             	<strong style="font-size:30"> 없음</strong>
                             </h5>
                          </c:if>
			         </td>         
			         <td style="width:2% ;">
						<!-- 여백 -->
			         </td>  
			         <c:set var="rank2" value="0"></c:set>
			         <td style="background-color:#f8f9fa; width:32%">
			         <!-- ========================================================================== -->
			 	      	<c:set var="result2" value=""></c:set>
		 	 	         <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
			 	            <c:if test="${setMenu.RANKING==2}">  
			 	            	<c:set var="result2" value="${result2}\n${setMenu.SET_MENU}"/>
			 	             </c:if>
			 	         </c:forEach>
		         		<!-- ========================================================================== -->
                         <c:set var="loop_index" value="0"></c:set>
                          <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
                          	<a href="javascript:;" onclick="alert('${result2}')" >
                             <c:if test="${setMenu.RANKING!=2}">
                                <c:set var="loop_index" value="${loop_index + 1}" />
                             </c:if>
                             <c:if test="${setMenu.RANKING==2}">   
                             <c:set var="rank2" value="${rank2 + 1}" />   
                              <h5>
                              		<c:if test="${(loopTagStatus.index-loop_index+1)<=3}">
                              			<strong style="font-size:30">${setMenu.SET_MENU}</strong>
                                    </c:if>
                                    <c:if test="${(loopTagStatus.index-loop_index+1)==4}">
                                         <strong>...</strong>
                                    </c:if>   
                             </h5>
                             </c:if>
                             </a>
                          </c:forEach>
                          <c:if test="${rank2==0}">
                             <h5>
                             	<strong style="font-size:30"> 없음</strong>
                             </h5>
                          </c:if>
			         </td>	         
			         <td style="width:2% ;">
			       		<!-- 여백 -->
			         </td>
			         <c:set var="rank3" value="0"></c:set>
			         <td style="background-color:#f8f9fa; width:32%">
			         	<!-- ========================================================================== -->
			 	      	<c:set var="result3" value=""></c:set>
		 	 	         <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
			 	            <c:if test="${setMenu.RANKING==3}">  
			 	            	<c:set var="result3" value="${result3}\n${setMenu.SET_MENU}"/>
			 	             </c:if>
			 	         </c:forEach>
		         		<!-- ========================================================================== -->	
 
						<c:set var="loop_index" value="0"></c:set>
                          <c:forEach items="${setMenuList}" var="setMenu" varStatus="loopTagStatus" >
                          	<a href="javascript:;" onclick="alert('${result3}')" >
                             <c:if test="${setMenu.RANKING!=3}">
                                <c:set var="loop_index" value="${loop_index + 1}" />
                             </c:if>
                             <c:if test="${setMenu.RANKING==3}">   
                             <c:set var="rank3" value="${rank3 + 1}" />   
                              <h5>
                              		<c:if test="${(loopTagStatus.index-loop_index+1)<=3}">
                              			<strong style="font-size:30">${setMenu.SET_MENU}</strong>
                                    </c:if>
                                    <c:if test="${(loopTagStatus.index-loop_index+1)==4}">
                                         <strong>...</strong>
                                    </c:if>   
                             </h5>
                             </c:if>
                             </a>
                          </c:forEach>
                          <c:if test="${rank3==0}">
                             <h5>
                             	<strong style="font-size:30"> 없음</strong>
                             </h5>
                          </c:if>
			         </td>
		         </tr>
		    
		         </c:if>
		     </table>
			<table>
			
		    <!-- 여백용 테이블 --> 
			<table><tr><td height="100px"></table>
			
		    	<div id="reDraw" style="width:100%"> <div id="piechart" style="width: 100%; height: 60%;"></div> </div>
		     </table>
		    <!-- 여백용 테이블 --> 
			<table><tr><td height="130px"></table>

		</div>
		</div>
</section>
<br><br><br>
</section>
 
</main>

	<!-- Why Section2 end -->  


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
 