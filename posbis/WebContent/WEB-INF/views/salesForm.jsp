<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%> 

<!DOCTYPE html>
<html>
<head>
<title>매출 관리</title>

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

<!-- 구글차트 수입 -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
 <script>         
      	$(document).ready(function(){
		 
						
			//name="rowCntPerPage"에 change 이벤트가 발생하면 실행할 코드 설정하기
			$('[name=rowCntPerPage]').change(function(){
				goSearch();
			});
			//==============================================================================================
			//페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기
			$(".pagingNumber").html(
				getPagingNumber(
					"${salesListAllCnt}"				//검색 결과 총 행 개수
					,"${salesSearchDTO.selectPageNo}"	//선택된 현재 페이지번호
					,"${salesSearchDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
					,"10"								//페이지 당 보여줄 페이지번호 개수
					,"goSearch();"						//페이지번호 클릭 후 실행할 자스코드
				)
			);

//=====================================================================================================
			//클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기
			
			//inputData("[name=user_id]","${salesSearchDTO.user_id}");
			inputData("[name=selectPageNo]","${salesSearchDTO.selectPageNo}");
			inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","${salesSearchDTO.keyword}");
			inputData("[name=sales_date]","${salesSearchDTO.sales_date}");
			inputData("[name=sales_date_t1]","${salesSearchDTO.sales_date_t1}");
			inputData("[name=sales_date_t2]","${salesSearchDTO.sales_date_t2}");

			inputData("[name=sort]","${salesSearchDTO.sort}");
			<c:if test="${!empty businessNoList}">
				inputData("[name=chooseAllBusinessNo]","${salesSearchDTO.chooseAllBusinessNo}");
				<c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
					inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
				</c:forEach>
	
				//==============================================================================================
				if($("[name=chooseBusinessNo]:checked").length==0){
					$("[name=chooseBusinessNo]").prop("checked",true);
					$("[name=chooseAllBusinessNo]").prop("checked",true);
					
			 		document.salesForm.submit();
					SalesSearchDTO.setChooseBusinessNo($("[name=salesForm] [name=chooseBusinessNo]").val());
				} 
				
				if($("[name=chooseBusinessNo]:not(:checked)").length==0){
					$("[name=chooseAllBusinessNo]").prop("checked",true);
				} 
	
				var allbusi = $("[name=chooseAllBusinessNo]");
	            allbusi.change(function() {
	                $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
	             });
	             $("[name=chooseBusinessNo]").change(function(){
	                if( $("[name=chooseBusinessNo]:not(:checked)").length>0){
	                   allbusi.prop("checked",false);
	                }
	                else{
	                   allbusi.prop("checked",true);
	                }
	             });
             </c:if>
 			//==============================================================================================


    	  $(".sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum + "원");
	      });
    	  $(".menu_price").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
  	  	  $(".sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
  	  	  $(".sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	      
    	  $(".sumSales").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });

//=====================================================================================================

	});

      	function numberWithCommas(number) {
    	    var parts = number.toString().split(".");
    	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	    return parts.join(".");
    	}
    	
//=====================================================================================================
    	
         // 검색 함수
         function goSearch(){
 			//만약 키워드가 공백 또는 길이가 없다면 길이없는 데이터로 세팅하기
 			//공백 상태에서 서버로 전송되면 공백을 가지고 DB를 검색한다.
 			//이 현상을 막기 위해 공백 또는 길이가 없다면 길이없는 데이터로 통일해서 세팅한다.
 			if(is_empty("[name=salesForm] [name=keyword]")){
 				$("[name=salesForm] [name=keyword]").val("");
 			}
 			//키워드 앞뒤에 공백이 있으면 제거하고 다시 넣어주기
 			var keyword = $("[name=salesForm] [name=keyword]").val();
 			keyword = $.trim(keyword);
 			$("[name=salesForm] [name=keyword]").val(keyword);

 			if(!is_empty("[name=salesForm] [name=sales_date_t1]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			}
  			if(!is_empty("[name=salesForm] [name=sales_date_t2]")){
 				$("[name=salesForm] [name=sales_date]").val("");
 			} 
 			//name=salesForm을 가진 form 태그의 action 값의 URL로 웹서버에 접속하기
  			$.ajax({
				// 서버 쪽 호출 URL 주소 지정
				url : "/posbis/salesProc.do"
				
				// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
				, type : "post"

				// 서버로 보낼 파라미터명과 파라미터 값을 설정
				, data : $("[name=salesForm]").serialize()				
				
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
				// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
				, success : function(salesDTO){
					if(salesDTO != null){
									//alert("성공");
									//alert( $("[name=salesForm]").serialize() );
									//$("body").remove(".right");
									$("body").load("/posbis/salesForm.do",$("[name=salesForm]").serialize());

					}
					else if (salesDTO == null){
						alert("실패");
					}
					else {
						alert("서버 오류 발생. 관리자에게 문의 바람");
					} 
				}
				
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				, error : function(request, error){
					alert("서버 접속 실패");
					alert($("[name=salesForm]").serialize());
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
				}
				
			});
 			
         }

//=====================================================================================================
       
//=====================================================================================================

		function goSearchAll(){
			inputData("[name=selectPageNo]","1");
			inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=keyword]","");
			$('[name=sales_date]').prop("checked",false);
			inputData("[name=sales_date_t1]","");
			inputData("[name=sales_date_t2]","");
			<c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
				inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
			</c:forEach>
			goSearch();
		}

		function showMenuSales(){
			
			document.menuSalesForm.submit();
		}
		
		 function dateChange(){
			 var minDate = new Date($('.sales_date_t1').val());
			 var selectDate = new Date($('.sales_date_t2').val());
			  if(minDate>selectDate){
					alert("올바른 기간으로 선택해주세요");
					$('.sales_date_t1').val("");
					$('.sales_date_t2').val("");
			}
		 }

		// 검색조건 초기화
         function goKeywordReset(){
            document.salesForm.reset();  
            inputData("[name=selectPageNo]" ,"1");
            inputData("[name=rowCntPerPage]","${salesSearchDTO.rowCntPerPage}");
			inputData("[name=sort]","s.sales_date desc");
            if($("[name=chooseBusinessNo]:checked").length==0){
                $("[name=chooseBusinessNo]").prop("checked",true);
                $("[name=chooseAllBusinessNo]").prop("checked",true);
            }
             <c:forEach items="${salesSearchDTO.chooseBusinessNo}" var="chooseBusinessNo">
                inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
             </c:forEach>
         }
       //기간선택 초기화(전체 기간)
         function allDate(){
            $('[name=sales_date]').prop("checked",false);
          inputData("[name=sales_date_t1]","");
          inputData("[name=sales_date_t2]","");
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
			//qna 게시판- 내가 쓴글 보기
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

			
		
	         google.charts.load('current', {packages: ['corechart', 'bar']});
	         google.charts.setOnLoadCallback(drawBasic);
	
	         function drawBasic() {

                 if(${salesList[0].sales_count >0}){
	               var data = google.visualization.arrayToDataTable([
	                 ['총매출', '매출이익(원)', { role: 'annotation' },
	                          '매출원가(원)', { role: 'annotation' } ],
	                 
	                 ['총매출', ${salesSum.sum_sales_income},  ${salesSum.sum_sales_income},
	                          ${salesSum.sum_sales_amount - salesSum.sum_sales_income}, ${salesSum.sum_sales_amount - salesSum.sum_sales_income}]
	               ]);
	
	               var options = {
	                       fontSize : 22,
	                      width: "100%",
	                      height: "100%",
	                      legend: { position: 'top', maxLines: 3 },
	                      bar:  { groupWidth: '40%' },
	                      isStacked: 'percent',
	                       colors: ['#74a2f2', '#9abbf4']
	                        ,animation: {
	                             startup: true,
	                             duration: 1200,
	                             easing: 'out' }
	                        ,annotations: {
	                           textStyle: {
	                               fontSize : 25
	                               , color: 'none'
	                               , bold: true
	                               , italic: true
	                               , opacity: 0.7
	                           }
	                           }
	                 };
	
	               var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	
	               chart.draw(data, options);
                 }
	         }
            
	         $(window).resize(function(){
	                drawBasic();
	             });

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
			<h2 style="font-size:65px"><strong>매출관리</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-warehouse"></i> 매장관리 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="fas fa-won-sign"></i> 매출관리</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->



  <!--=============================
      매출관리
    ============================-->
   <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">매출관리</font>
              </header>
              
               
			<div class="panel-body"> 
			<div class="container" style="max-width:1400">
				 <form name = "salesForm" method="post" action="/posbis/salesForm.do">
					<div  class="form-group">
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						 
            					  
       			<div style="float:right"> <a href="javascript:;" onclick="showMenuSales();" >[ 메뉴별 매출관리 ]로 이동 &nbsp;&nbsp;&nbsp;</a></div><br><br> 
   <div style="border:1px solid #d2d2d2;">
      <Br>
<table>
	<tr>
		<td>
		
			<table><tr><td style="color:#330066">
               [ 사업자 번호 ]&nbsp; : &nbsp;
      <c:if test="${!empty businessNoList}">
                  <td><input type = "checkbox" name="chooseAllBusinessNo" id="chooseAllBusinessNo"> <label for="chooseAllBusinessNo">모두선택</label>
               <tr><td>
            <c:forEach items="${businessNoList}" var="businessNoList" varStatus="status">
              <td><input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}" id="${businessNoList.business_no}">
                             <label for="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})</label>
                    <c:if test="${(status.index+1)%2!=0}">
                     <c:if test="${!status.last }">
                        <td width="40">
                     </c:if>
                    </c:if>
                    <c:if test="${(status.index+1)%2==0}">
                     <c:if test="${!status.last }">
                        <tr><td>
                     </c:if>
                  </c:if>   
            </c:forEach>
        </c:if>
      <c:if test="${empty businessNoList}">
         등록된 가게가 없습니다.
        </c:if>
            </table>
            
            
            
		<br><br> 
 	<tr>
		<td style="color:#330066">
				   
				[ 기간&nbsp;&nbsp;&nbsp;설정 ]&nbsp; : &nbsp;<input type="date" name="sales_date_t1" class="sales_date_t1" onchange="dateChange();" style="height:35; text-align:center">
				 ~ <input type="date" name="sales_date_t2" class="sales_date_t2" onchange="dateChange();" style="height:35; text-align:center">
						      
		<br><br>
	<tr>
		<td >					      
				
				              <span style="color:#330066"> [ 기간&nbsp;&nbsp;&nbsp;선택 ]&nbsp; : &nbsp;</span>
				               <input type = "radio" name="sales_date" class="sales_date" value="1" id="sales_date_today" ><label for="sales_date_today">금일매출</label>&nbsp;
				               <input type = "radio" name="sales_date" class="sales_date" value="2" id="sales_date_week"><label for="sales_date_week">최근 일주일매출</label>&nbsp;
				               <input type = "radio" name="sales_date" class="sales_date" value="3" id="sales_date_month"><label for="sales_date_month">이번달매출</label>&nbsp;&nbsp;
				              <a href="javascript:allDate();"><u><font size="4">전체 기간</font></u></a><br>
		<br>  					      
	<tr>
		<td style="color:#330066">		               
				             [ 키&nbsp;&nbsp;&nbsp;워&nbsp;&nbsp;&nbsp;드 ]&nbsp; : &nbsp;<input type = "text" name="keyword" class="keyword" style="height:35">&nbsp;
				            <!--  <input type="button" value="검   색" onClick="goSearch();">&nbsp;
              				 <input type="button" value="모두 검색" onClick="goSearchAll();"></span></span>&nbsp;&nbsp; -->
              				 <br><br>
                  			 <button type="button" class="btn btn-default"style="margin:0 20 0 220" onClick="goSearch();">검      색</button>&nbsp;
                 			 <button type="button" class="btn btn-default"style="margin:0 20 0 0" onClick="goSearchAll();">모두  검색</button>&nbsp;
              				 <a href="javascript:goKeywordReset();"><u>검색조건 초기화</u></a>
              				
              			</table> 
              	<br>
   </div> 
 <!-- =========================================================================================================================================================================== -->
 
 
 
						
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
						<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
						<input type="hidden" name="selectPageNo"> 
						<input type="hidden" name="sort" value=“s.sales_date desc”> 
						<input type="hidden" name="user_id" value="${user_id}">  
						
					</div>	



				
<!--************************************************************************************************************************-->
            <div class="col-sm-12" align="center">
              <div id="chart_div" style="width:60%; height:22%;padding:20 0 10 0"></div>
              <table class="table table-striped table-advance table-hover" id="select">
                <thead>
                  <tr >
                  <td align=center class="sumSales" style="padding:0 0 30 0">
                  [거래 건수]: ${salesListAllCnt}&nbsp;&nbsp;
                    [판매 수량] : ${salesSum.sum_sales_count} &nbsp;&nbsp;
                  [총 매출] : ${salesSum.sum_sales_amount}원&nbsp;&nbsp;
                  [매출이익] : ${salesSum.sum_sales_income}원

            <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
            <!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
                  <tr><br> 
                  <td align=right>
			            <br><select name="rowCntPerPage" style="width:50px;height:30px;">
			               <option value="10">&nbsp;10&nbsp;
			               <option value="15">&nbsp;15&nbsp;
			               <option value="20">&nbsp;20&nbsp;
			               <option value="25">&nbsp;25&nbsp;
			               <option value="30">&nbsp;30&nbsp;
			            </select> 행보기
			   </table>
			</form>
   	<form name="menuSalesForm" method="post" action="/posbis/menuSalesForm.do">
					</form>      
			
            <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
      <div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
      <br>
      	<table class="table table-striped table-advance table-hover " id="sales">
            <thead>
                <tr style="background-color:#7f9ed436;">
             <th><font color="#39485f">NO</font>
                <c:choose>
				<c:when test="${param.sort=='b.business_name desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name asc'); goSearch();"><font color="#656565">상호명 ▼</font>
				</c:when>
				<c:when test="${param.sort=='b.business_name asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name desc'); goSearch();"><font color="#656565">상호명 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('b.business_name asc'); goSearch();"><font color="#656565">상호명</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='s.menu_name desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name asc'); goSearch();"><font color="#656565">메뉴 ▼</font>
				</c:when>
				<c:when test="${param.sort=='s.menu_name asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name desc'); goSearch();"><font color="#656565">메뉴 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.menu_name asc'); goSearch();"><font color="#656565">메뉴</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='3 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 asc'); goSearch();"><font color="#656565">가격 ▼</font>
				</c:when>
				<c:when test="${param.sort=='3 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 desc'); goSearch();"><font color="#656565">가격 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('3 asc'); goSearch();"><font color="#656565">가격</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='4 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();"><font color="#656565">수량 ▼</font>
				</c:when>
				<c:when test="${param.sort=='4 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 desc'); goSearch();"><font color="#656565">수량 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('4 asc'); goSearch();"><font color="#656565">수량</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='5 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();"><font color="#656565">총매출 ▼</font>
				</c:when>
				<c:when test="${param.sort=='5 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 desc'); goSearch();"><font color="#656565">총매출 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('5 asc'); goSearch();"><font color="#656565">총매출</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='6 desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();"><font color="#656565">순매출 ▼</font>
				</c:when>
				<c:when test="${param.sort=='6 asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 desc'); goSearch();"><font color="#656565">순매출 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('6 asc'); goSearch();"><font color="#656565">순매출</font>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${param.sort=='s.sales_date desc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.sales_date asc'); goSearch();"><font color="#656565">판매일 ▼</font>
				</c:when>
				<c:when test="${param.sort=='s.sales_date asc'}">
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.sales_date desc'); goSearch();"><font color="#656565">판매일 ▲</font>
				</c:when>
				<c:otherwise>
					<th style="cursor:pointer"
							onClick="$('[name=sort]').val('s.sales_date asc'); goSearch();"><font color="#656565">판매일</font>
				</c:otherwise>
				</c:choose>
                 
 
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${salesList}" var="sales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
                  <tr>
                    <td align=center width="4%">
	               <%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
	               	${salesSearchDTO.selectPageNo*salesSearchDTO.rowCntPerPage-salesSearchDTO.rowCntPerPage+1
	                                                               +loopTagStatus.index}  
	               <!-- 각 행의 상호명 출력 -->
	               	<td align=center width="9%" >${sales.business_name}
	               <!-- 각 행의 메뉴 이름 출력 -->
              	 	<td align=center width="12%" >${sales.menu_name}
	               <!-- 각 행의 메뉴 가격 출력 -->
	               	<td align=right width="7%"  class="menu_price">${sales.menu_price}
	               <!-- 각 행의 판매 수량 출력 -->
	               	<td align=center width="6%"  class="sales_count">${sales.sales_count}
	               <!-- 각 행의 총매출 출력 -->
	               	<td align=right  width="7%"  class="sales_amount">${sales.sales_amount}
	               <!-- 각 행의 순매출 출력 -->
	               	<td align=right  width="7%"  class="sales_income">${sales.sales_income}
	               <!-- 각 행의 판매 날짜 출력 -->
	               	<td align=center width="18%"  >${sales.sales_date}
	               
	               
                  </tr>
                 </c:forEach>
                 </tbody>

              </table><br>
         <c:if test="${empty salesList}">
		매출 내역이 없습니다.
		</c:if> 
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
 