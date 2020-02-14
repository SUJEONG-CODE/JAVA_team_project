<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여  common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>		<!-- 이것만 WEB-INF 경로를 사용할 수 있음. -->


<html>
<head>
<title>비교차트</title>

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
  
  
  
  <title> PremiumChart </title>
  
<!-- 	<script src="https://code.jquery.com/jquery.min.js"></script> -->

       <script type="text/javascript" src="https://www.google.com/jsapi"></script>
	   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>

	 	google.load("visualization", "1", {"packages":["corechart"]});
	 	google.charts.load('current', {'packages':['corechart']});
   	    google.setOnLoadCallback(drawChart1);
   		google.setOnLoadCallback(drawChart2);
   		google.setOnLoadCallback(drawChart3);
   		google.setOnLoadCallback(drawChart4);
   		google.charts.setOnLoadCallback(drawChart5);


   		
	  	
   		$(document).ready(function(){	
//	    	 checkBusinessNoForm();
				// name="changeBusinessNo" 에 change 이벤트가 발생하면 실행할 코드 설정.
				$('[name=changeBusinessNo]').change(function(){	
					changeChart();
					checkBusinessNoForm();
					searchHourSales();

		/* 			if($('[name=changeBusinessNo]').val()!='all'){
						changeChart();
						checkBusinessNoForm();
						searchHourSales();
					}	
		 */			
					

				});	

				$('[name=changeYear]').change(function(){		
					changeChart();
					checkBusinessNoForm();
					searchHourSales();

				});	


				$('[name=changeMonth]').change(function(){		
					searchHourSales();

				});	
				
				$('[name=changeBusinessNo]').change();
							
				
	  	});

		  	
 	     function changeChart(){
	    	 var business = $('[name=changeBusinessNo]').val();
             if(business == 'all'){        
                 $('.BusinessNoChart').hide();
                 $('.allBusinessNoChart').show();
           }
             else{
           	  $('.allBusinessNoChart').hide();
                 $('.BusinessNoChart').show();
             }
	     }  
 
     	

		// Controller에서 받아온 나의 가게 월별 매출을 담을 변수 선언.
		 var jjj = new Array();
		// Controller에서 받아온 같은 동네, 같은 업종의 다른 가게들 평균 월별 매출을 담을 변수 선언.
	     var kkk = new Array();

		// Controller에서 받아온 나의 가게 인기메뉴, 판매횟수 담을 변수 선언.
	    var myMenuName = new Array();
		var myCount = new Array();
		// Controller에서 받아온 다른 가게 인기메뉴, 판매횟수 담을 변수 선언.
		var othersMenuName = new Array();
		var othersCount = new Array();

		// Controller에서 받아온 나의 가게 상품별 판매횟수, 이름 담을 변수 선언.
		var salesMenuName = new Array();
		var salesMenuCount = new Array();

		// Controller에서 받아온 나의 가게 상품별 순이익, 이름 담을 변수 선언.
		var benefitMenuName = new Array();
		var salesBenefitMenu = new Array();

		// 가게의 개수를 담을 변수
		var busiLength = 0;
		// 다차원 배열로 선언할 변수
		var allBusinessNoSales;
		// 가게 이름을 담을 배열 변수
	    var allBusinessNoName = [];

		// 시간별 판매 개수 및 이름
	    var hourSalesMenuName = new Array();
		var hourSalesMenuCount ;

	    // 가게 open , close 시간
	    var salesOpenTime = null;
	    var salesCloseTime = null;
	    
	     
     	function checkBusinessNoForm(){
				//alert($("[name=preChartForm]").serialize());
				//alert($("[name=allBusinessNumber]").serialize()+"&changeYear="+$("[name=changeYear]").val());

			 	// 사업자 번호 선택 란이 '모두검색' 일 때.
				if($("[name=changeBusinessNo]").val() == 'all' ) {
					//alert("if ----- "+ $("[name=changeBusinessNo]").val());
					
					//alert("hidden ----- "+ $("[name=allBusinessNumber]").serialize());

					$.ajax({
						// 서버 쪽 호출 URL 주소 지정
						url : "/posbis/preChartAllProc.do"
						
						// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
						, type : "post"

						, async : false
						// 서버로 보낼 파라미터명과 파라미터 값을 설정
						// 같은 이름의 다른 값들 여럿을 보내면 DTO에서는 배열로 받을 것. (AllBusinessNoDTO 가 받음.)
						
						, data : $("[name=allBusinessNumber]").serialize()+"&changeYear="+$("[name=changeYear]").val()			
						//, data : $("[name=allBusinessNumber]").serialize()	
							
						, success : function(allBusinessNoSalesChartListDTO){
							

							var name = allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList[0].BUSINESS_NAME;
							
							if(allBusinessNoSalesChartListDTO != null){
								//alert(allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList.length/12);

								var length = allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList.length;
								busiLength = length/12
								// 다차원 배열로 가게의 갯수만큼 배열 생성
								allBusinessNoSales = Array.from(Array(busiLength), () => Array());

								// 하나의 select로 다 모았기 때문에 0부터 12까지가 아닌 12*x 개의 행이 저장되므로 i를 저렇게 저장.
								for(var j=0; j<length/12; j++){
									for(var i=(12*j); i<(12*(j+1)); i++){
										if( name == allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList[i].BUSINESS_NAME) {
											//alert("같은 가게 " +i+" ==== " + name);
											allBusinessNoSales[j][i] = allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList[i].sales_amount;
											allBusinessNoName[j] = allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList[i].business_name;
											//alert(allBusinessNoName[j]+ i +" ==== " + allBusinessNoSales[j][i]);
										}
										else{
											name = allBusinessNoSalesChartListDTO.allBusinessNoSalesMonthList[i].BUSINESS_NAME
											i--;
										}
									
	
									}
									//alert(allBusinessNoName[j]);
								}
								//alert("구글차트 시작");
								drawChart4();
							}
							else if (allBusinessNoSalesChartListDTO == null){
								alert("실패");
							}
							else {
								alert("서버 오류 발생. 관리자에게 문의 바람");
							} 
						}
						
						// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
						, error : function(request, error){
							alert("서버 접속 실패");
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							
							
						}
						
					});
					
					return;
				} 

 

				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 익명함수의 매개변수 data에는 서버가 응답한 데이터가 들어온다.
					// 현재 data라는 매개변수에는 아이디, 암호의 존재 개수가 들어온다. 1:성공, 0:아이디,암호 없음 , 그외:에러
					, success : function(preChartListDTO){
						//alert("salesMonthList : "+ preChartListDTO.salesMonthList[0].sales_amount);
						//alert("allSalesMonthList : "+ preChartListDTO.allSalesMonthList[0].sales_amount);
						// 아이디 존재 개수가 1개면 /z_spring/boardListForm.do 로 이동
						if(preChartListDTO != null){
							//alert("성공");

							var xxx= preChartListDTO.salesMonthList.length;
							// Controller에서 가져온 DTO값들을 뽑아서 변수에 저장.
							// 나의 가게 월별 매출
							for(var i = 0; i<xxx; i++){
								jjj[i] = preChartListDTO.salesMonthList[i].sales_amount;
							}

							// 다른 가게들 월별 매출 평균
							for(var i = 0; i<xxx; i++){
								kkk[i] = preChartListDTO.allSalesMonthList[i].sales_amount;
							} 
			
							// 구글차트 1 실행
							drawChart1();
							

						}
						else if (preChartListDTO == null){
							alert("실패");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
						
					}
					
				});
				


				//-----------------------------------------------------------------
				// 두번째 ajax : 우리가게, 다른가게 인기메뉴, 점포 수 구하기
				

  				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc2.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// myPopularityListDTO 안의 나의 가게 인기메뉴를 골라 class=myPopularityMenu안에 append로 입력.
					, success : function(myPopularityListDTO){
						//alert(typeof(myPopularityListDTO));


						if(myPopularityListDTO != null){
							//alert("성공2");
							$(".menu").remove();
							$(".menu2").remove();
							$(".menu3").remove();


							if(myPopularityListDTO.myPopularityMenu.length == 0){
								$('.myPopularityMenu').append('<tr class="menu2"><td align=center style="height:30">없음</td>');
							}
							else{
								// 우리가게 인기메뉴 가져와서 보여주기
								for(var i=0; i<myPopularityListDTO.myPopularityMenu.length; i++){
									myMenuName[i] = myPopularityListDTO.myPopularityMenu[i].MENU_NAME ;
									//alert("myMenuName => " + myMenuName[i]);
									myCount[i] = myPopularityListDTO.myPopularityMenu[i].SALES_COUNT ;
									//alert("myCount => " + myCount[i]);
									$('.myPopularityMenu').append('<tr class="menu2"><td align=center style="height:30">'+ myMenuName[i] +'</td>');
								}
							}
							
						
							
							if(myPopularityListDTO.othersPopularityMenu.length == 0){
								$('.othersPopularityMenu').append('<tr class="menu2"><td align=center style="height:30">없음</td>');
							}
							else{
								// 다른가게 인기메뉴 가져와서 보여주기
								for(var i=0; i<myPopularityListDTO.othersPopularityMenu.length; i++){
									othersMenuName[i] = myPopularityListDTO.othersPopularityMenu[i].MENU_NAME ;
									//alert("othersMenuName => " + othersMenuName[i]);
									othersCount[i] = myPopularityListDTO.othersPopularityMenu[i].SALES_COUNT ;
									//alert("othersCount => " + othersCount[i]);
									$('.othersPopularityMenu').append('<tr class="menu2"><td align=center style="height:30">'+ othersMenuName[i] +'</td>');	
										
								}
							}

							var storeCount = myPopularityListDTO.storeCount;
							//alert("storeCount => " + storeCount)
							$('.store_count').append('<td align=center class="menu3" style="height:30">'+ storeCount +'</td>');

							
						}
						else if (myPopularityListDTO == null){
							alert("실패2");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패2");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
					}
					
				});	



  				//-----------------------------------------------------------------
				// 세번째 ajax : 상품별 판매 횟수, 순수익 비율 구하기
				

  				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc3.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()				
						// 위 코드는 아래로도 가능. 
						// data : "admin_id="+admin_id+"&pwd="+pwd
						// data : { 'admin_id':admin_id, 'pwd':pwd}
					
					// myPopularityListDTO 안의 나의 가게 인기메뉴를 골라 class=myPopularityMenu안에 append로 입력.
					, success : function(mySalesRatioDTO){
						//alert(typeof(myPopularityListDTO));
						$(".ct1").remove();
						

						if(mySalesRatioDTO != null){
							//alert("성공3");
							//alert(mySalesRatioDTO.menuSalesCount[0].MENU_NAME);
							//alert(mySalesRatioDTO.menuSalesCount.length);

							if(mySalesRatioDTO.menuSalesCount.length != 0){
								// 우리가게 상품별 판매 횟수, 이름 구하기
								for(var i=0; i<mySalesRatioDTO.menuSalesCount.length; i++){
									salesMenuName[i] = mySalesRatioDTO.menuSalesCount[i].MENU_NAME ;
									//("myMenuName => " + myMenuName[i]);
									salesMenuCount[i] = mySalesRatioDTO.menuSalesCount[i].SALES_COUNT ;
									
								} 
	
	
								// 우리가게 상품별 순이익, 이름 구하기
								for(var i=0; i<mySalesRatioDTO.salesBenefit.length; i++){
									benefitMenuName[i] = mySalesRatioDTO.salesBenefit[i].MENU_NAME ;
									//("myMenuName => " + myMenuName[i]);
									salesBenefitMenu[i] = mySalesRatioDTO.salesBenefit[i].SALES_INCOME ;
									
								} 
								/* <td class="ct1"> */
								$("[name=chart2]").append('<div class="ct1" id="chart_div2_1" style="display:inline; width: 50%; height: 60%; float:left"></div><div class="ct1" id="chart_div2_2" style="display:inline; width: 50%; height: 60%; float:right"></div>');
								$("[name=chart3]").append('<div class="ct1" id="chart_div3" style=" width: 70%; height: 60%;"></div>');
								drawChart2();
								drawChart3();
							}
							else{
								
								$("[name=chart2]").append('<div align=center style="height:30" class="ct1">없음</div>');
								$("[name=chart3]").append('<div align=center style="height:30" class="ct1">없음</div>');

							}
							
						}
						else if (mySalesRatioDTO == null){
							alert("실패3");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패3");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
					}
					
				});		

				
			}	


			function searchHourSales(){

				//-----------------------------------------------------------------
				// 네번째 ajax : 시간대별 판매 개수 구하기 (상품별 구분)
  				
  				$.ajax({
					// 서버 쪽 호출 URL 주소 지정
					url : "/posbis/preChartProc4.do"
					
					// form 태그 안의 데이터 즉, 파라미터값을 보내는 방법 지정
					, type : "post"

					, async : false
					// 서버로 보낼 파라미터명과 파라미터 값을 설정
					, data : $("[name=preChartForm]").serialize()+"&changeMonth="+$("[name=changeMonth]").val()				
					
					, success : function(preChartHourSalesDTO){

						var hourlength = preChartHourSalesDTO.hourSalesCount.length;

						//alert(preChartHourSalesDTO.salesOpenTime);
						//alert(preChartHourSalesDTO.salesCloseTime);

						hourSalesMenuName.length = 0;
												
						$(".ct2").remove();					

						if(preChartHourSalesDTO != null){

							if(hourlength != 0){								
								//alert(preChartHourSalesDTO.hourSalesCount.length);
								
								salesOpenTime = preChartHourSalesDTO.salesOpenTime;
								salesCloseTime = preChartHourSalesDTO.salesCloseTime;
								//alert(salesOpenTime);
								//alert(salesCloseTime);
								
								// 다차원 배열로 가게의 갯수만큼 배열 생성
								hourSalesMenuCount = Array.from(Array(hourlength), () => Array());

								//alert("시간대별 시작");
								for(var i=0; i<preChartHourSalesDTO.hourSalesCount.length; i++){
									hourSalesMenuName[i] = preChartHourSalesDTO.hourSalesCount[i].hour_menu_name;
									//alert(hourSalesMenuName[i] + " == " +preChartHourSalesDTO.hourSalesCount[i].hour15);
								}

								// 하나의 select로 다 모았기 때문에 0부터 12까지가 아닌 12*x 개의 행이 저장되므로 i를 저렇게 저장.
								for(var i=0; i<hourlength; i++){
									//alert("dkdkdkdkdkdk");
									for(var j=0; j<24; j++){
										//alert("dkdkdkdkdkdk2");
										if(j==0){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour00; }
										else if(j==1){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour01 }
										else if(j==2){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour02 }
										else if(j==3){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour03 }
										else if(j==4){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour04 }
										else if(j==5){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour05 }
										else if(j==6){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour06 }
										else if(j==7){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour07 }
										else if(j==8){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour08 }
										else if(j==9){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour09 }
										else if(j==10){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour10 }
										else if(j==11){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour11 }
										else if(j==12){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour12 }
										else if(j==13){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour13 }
										else if(j==14){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour14 }
										else if(j==15){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour15 }
										else if(j==16){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour16 }
										else if(j==17){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour17 }
										else if(j==18){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour18 }
										else if(j==19){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour19 }
										else if(j==20){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour20 }
										else if(j==21){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour21 }
										else if(j==22){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour22 }
										else if(j==23){ hourSalesMenuCount[i][j] = preChartHourSalesDTO.hourSalesCount[i].hour23 }

										//alert("j== " + j + " ==== " + hourSalesMenuCount[i][j])
										
									}
									
								}
								

								$("[name=chart5]").append('<div class="ct2" id="chart_div5" style=" width: 100%; height: 100%; position:relative; z-indx:1"></div>');
								drawChart5();

							}
							else{								
								$("[name=chart5]").append('<div align=center style="height:30" class="ct2">없음</div>');
							}
							
						}
						
						else if (mySalesRatioDTO == null){
							alert("실패3");
						}
						else {
							alert("서버 오류 발생. 관리자에게 문의 바람");
						} 
					}
					
					// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
					, error : function(request, error){
						alert("서버 접속 실패3");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);							
					}
					
				});		

			}



//------------ 내가게와 동일한 위치, 업종을 가진 가게들의 평균 월매출을 보여주는 그래프 ----------------------------     	
			
     		function drawChart1() {
     		
			/* var data = new google.visualization.DataTable();
			data.addRows([
				[1,30], [2,50], [3,45], [4,60], [5,77]
				, [8,70], [9,50], [10,87], [11,68], [12,60]
			]); */


			// 문자로 저장된 값들을 숫자로 변환.
			//	alert("jjj[0]====> " + jjj[0]);
				for(var i=0; i<jjj.length; i++){
					jjj[i] *=1;
				}
 
			//	alert("kkk[0] ====> " + kkk[0]);
				for(var i=0; i<kkk.length; i++){
					kkk[i] *=1;
				} 
				
			// 구글 차트 데이터 입력
			   var data1 = google.visualization.arrayToDataTable([
			   	 ['Month', '나의 가게', '주변 가게'],
		         ['1월',  jjj[0],      kkk[0] ],
		         ['2월',  jjj[1],      kkk[1] ],
		         ['3월',  jjj[2],      kkk[2] ],
		         ['4월',  jjj[3],      kkk[3] ],
		         ['5월',  jjj[4],      kkk[4] ],
		         ['6월',  jjj[5],      kkk[5] ],
		         ['7월',  jjj[6],      kkk[6] ],
		         ['8월',  jjj[7],      kkk[7] ],
		         ['9월',  jjj[8],      kkk[8] ],
		         ['10월',  jjj[9],     kkk[9] ],
		         ['11월',  jjj[10],    kkk[10] ],
		         ['12월',  jjj[11],    kkk[11] ],
		       ]);
	       
		
			   var options1 = {
		                  title: '[월 매출]'
		           		 , width: "100%"
		            	 , height: "100%"
		                 , curveType : 'function'
		                 , fontSize : 20
		                 , series: {
		                         0: { lineWidth: 2, color: '#7966E3',  },
		                         1: { lineWidth: 2, color: '#74A2F2', lineDashStyle: [4, 4] }
		                      }
		                   , pointSize: 6
		                   , dataOpacity: 0.3
		                   , animation: { //차트가 뿌려질때 실행될 애니메이션 효과
		                       startup: true,
		                       duration: 1500,
		                       easing: 'out' }
		              
		             };
		
		
		       var chart1 = new google.visualization.LineChart(document.getElementById('chart_div1'));
		       chart1.draw(data1, options1);

		       
		     }
		


//--------------내가게의 인기 메뉴와 개수를 보여주는 그래프 --------------------------
  	
		 
		     function drawChart2() {


					for(var i=0; i<salesMenuCount.length; i++){
						salesMenuCount[i] *=1;
					}
					
			       var data2 = google.visualization.arrayToDataTable([
			    	   ['메뉴',                 '개수(개)',       { role: 'style' },   { role: 'annotation' } ],
	                     [salesMenuName[0],     salesMenuCount[0],  'color: #433886;',      salesMenuCount[0]   ],
	                     [salesMenuName[1],     salesMenuCount[1],  'color: #6454c6;',      salesMenuCount[1]   ],
	                     [salesMenuName[2],     salesMenuCount[2],  'color: #7966e3;',      salesMenuCount[2]   ],
	                     [salesMenuName[3],     salesMenuCount[3],  'color: #b2a9e7;',      salesMenuCount[3]   ],
				        
				       ]);
			
			       var options2_1 = {
	                        title: '[상품별 매출(%) TOP4]'
	                 	   , width: "100%"
	                       , height: "100%"
		                   , legend: { position: "right" }
	                       , fontSize : 20
	                       , colors: ['#7966E3', '#74A2F2', '#949FB1', '#4D5360']
	                       , is3D: true 
	                   };

	                var options2_2 = {
	                          title: '[상품별 매출(개수) TOP4]'
	                    	, width: "100%"
	                        , height: "100%"
	                        , fontSize : 20
	                        , tooltip:{textStyle : {fontSize:12}, showColorCode : true}
	                        , legend: { position: "none" }
	                        , bar: {groupWidth: "33%"}
	                        , isStacked: false
	                        , animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                                startup: true,
	                                duration: 4500,
	                                easing: 'out' }
	                         , annotations: {
	                                       textStyle: {
	                                                   fontSize : 25
	                                                   , bold: true
	                                                   , italic: true
	                                                   , color: '#white'
	                                                   ,  auraColor: '#black'
	                                                   ,  opacity: 0.8	                        
	                                                }
	                                       }                           
	                      };
			       
			       var chart2_1 = new google.visualization.PieChart(document.getElementById('chart_div2_1'));
			       chart2_1.draw(data2, options2_1);

			       var chart2_2 = new google.visualization.BarChart(document.getElementById('chart_div2_2'));
			       chart2_2.draw(data2, options2_2);
		     }	


		     
//------------- 가게의 총매출과 순이익을 보여주는 그래프 ---------------------------
  	    	
			 
		     function drawChart3() {

/*
				   var data2 = google.visualization.DataTable();
				   alert("왜 안나오냐고!!!");
				   data2.addColumn('string', 'Topping');
			       data2.addColumn('number', 'Slices');
			       data2.addRows([
			         ['Mushrooms', 3],
			         ['Onions', 1],
			         ['Olives', 1],
			         ['Zucchini', 1],
			         ['Pepperoni', 2]
			       ]);
*/
					
					var sum = 0;
					for(var i=0; i<salesBenefitMenu.length; i++){
		    	 		salesBenefitMenu[i] *=1;
		    	 		sum = sum + salesBenefitMenu[i];
					}
					//alert(sum);

			       var data3 = google.visualization.arrayToDataTable([
			    	   ['메뉴',             '총매출 (원)', { role: 'annotation' },     '메뉴별 매출 (원)',       { role: 'style' },  { role: 'annotation' }  ],
	                     [benefitMenuName[0],     sum,             sum,              salesBenefitMenu[0],     'opacity: 0.5',      salesBenefitMenu[0]   ],
	                     [benefitMenuName[1],     sum,             sum,              salesBenefitMenu[1],     'opacity: 0.5',      salesBenefitMenu[1]   ],
	                     [benefitMenuName[2],     sum,             sum,              salesBenefitMenu[2],     'opacity: 0.5',      salesBenefitMenu[2]   ],
	                     [benefitMenuName[3],     sum,             sum,              salesBenefitMenu[3],     'opacity: 0.5',      salesBenefitMenu[3]   ],
				       ]);
			
			       var options3 = {
	                     title: '[상품별 매출 TOP4]'
	              		, width: "100%"
	                	, height: "100%"
	                    , legend: { position: 'top' }
	                    , fontSize : 20
	                    , colors: ['#7966E3', '#74A2F2']
	                    , animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                          startup: true,
	                          duration: 3000,
	                          easing: 'out', 
		                          
	                     }
	                 
	                };
			       
			       var chart3 = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
			       chart3.draw(data3, options3);
		     }

			    $(window).resize(function(){
		    		drawChart1();
		    		drawChart2();
		    		drawChart3();
			    });



			  //------------ 내가 가진 가게들 전부의 월 매출을 보여주는 그래프 ----------------------------     	
		 		function drawChart4() {
					for(var i=0; i<allBusinessNoName.length; i++){
						for(var j=(12*i); j<(12*(i+1)); j++ ){
							allBusinessNoSales[i][j] *=1;
						}
					} 

					var data4 = new google.visualization.DataTable();
					data4.addColumn('string', 'Month');
				    for(var i=0; i<allBusinessNoName.length; i++){	
						data4.addColumn('number' , allBusinessNoName[i]);
					}
					
					for(var j=0; j<12; j++ ){
						data4.addRows(1);
						var k = 0;
						data4.setCell(j,k,(j+1)+'월');	
						for(var t=0; t<allBusinessNoName.length; t++){
							k++;
							data4.setCell(j,k,allBusinessNoSales[t][j+(12*t)]);
						}
					}

	              	var options4 = {
	                  title: '[월 매출]'
	      		     , width: "100%"
	    		     , height: "100%"
	                 , fontSize : 20
	                 , curveType : 'function'
	                 , series: {
	                         0: { lineWidth: 2, color: '#7966E3'   },
	                         1: { lineWidth: 2, color: '#74A2F2'   }
	                      }
	                   , pointSize: 6
	                   , dataOpacity: 0.3
	                   , animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                       startup: true,
	                       duration: 1500,
	                       easing: 'out' }
	                };
			
			       var chart4 = new google.visualization.LineChart(document.getElementById('allChart_div'));
			       chart4.draw(data4, options4);      
			     }
				

			    $(window).resize(function(){
		    		drawChart4();
			    });




			    

			  //------------ 월별 시간대별 판매 개수 차트 (상품 별) ----------------------------     	

		 		function drawChart5() {
		 		
					//alert(hourSalesMenuName.length);
					//alert(allBusinessNoSales[0].length);

					for(var i=0; i<hourSalesMenuName.length; i++){
						for(var j=0; j<23; j++ ){
							hourSalesMenuCount[i][j] *=1;
							//alert(hourSalesMenuName[i] +' = ' + hourSalesMenuCount[i][j]);
						}
					} 


				// 구글 차트 데이터 입력

				   var data5 = new google.visualization.DataTable();


					data5.addColumn('string', 'Hours');
				    for(var i=0; i<hourSalesMenuName.length; i++){
						
						data5.addColumn('number' , hourSalesMenuName[i]);
						//alert(allBusinessNoName[i]);
					}

				    salesOpenTime = salesOpenTime*1;
					salesCloseTime = salesCloseTime*1;

					//alert(salesOpenTime +" ===== " + salesCloseTime);
				    
					if(salesCloseTime > salesOpenTime){
						  var jero = 0;
							for(var j=salesOpenTime; j<salesCloseTime+1; j++ ){
								data5.addRows(1);
								
								var k = 0;
								//var sales[j] = allBusinessNoSales[i][j];
								//alert(allBusinessNoSales[i][j]);
								data5.setCell(jero,k,(j)+'시');
								//alert((j+1)+'월')			
								for(var t=0; t<hourSalesMenuName.length; t++){
									k++;
									data5.setCell(jero,k,hourSalesMenuCount[t][j]);
									
								}
								jero++;
								
								
							}
					    } else {
					    	var jero = 0;
					    	for(var j=salesOpenTime; j<24; j++ ){
								data5.addRows(1);
								var k = 0;
								//var sales[j] = allBusinessNoSales[i][j];
								//alert(allBusinessNoSales[i][j]);
								data5.setCell(jero,k,(j)+'시');
								//alert((j+1)+'월')			
								for(var t=0; t<hourSalesMenuName.length; t++){
									k++;
									data5.setCell(jero,k,hourSalesMenuCount[t][j]);								
								}
								jero++;
							}
					    	for(var j=0; j<salesCloseTime+1; j++ ){
								data5.addRows(1);
								var k = 0;
								//var sales[j] = allBusinessNoSales[i][j];
								//alert(allBusinessNoSales[i][j]);
								data5.setCell(jero,k,(j)+'시');
								//alert((j+1)+'월')			
								for(var t=0; t<hourSalesMenuName.length; t++){
									k++;
									data5.setCell(jero,k,hourSalesMenuCount[t][j]);								
								}
								jero++;
							}
					    	

					    		
						}	


		              var options5 = {
		                  title: '(월별) 시간대 판매 개수 (개)'
		      		     , width: "100%"
		    		     , height: "100%"
		                 , fontSize : 18
		                 , isStacked: true
		                 
		              
		                   };
			
			
			       var chart5 = new google.visualization.SteppedAreaChart(document.getElementById('chart_div5'));
			       chart5.draw(data5, options5);

			       
			     }
				

			    $(window).resize(function(){
		    		drawChart5();
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
			
			//qna 게시판- 자주 묻는 질문
			 function goFAQForm(){
			        //alert("전체 질문보기으로 이동");
			        location.replace("/posbis/FAQForm.do");
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
			<h2 style="font-size:65px"><strong>비교차트</strong></h2>
			<div style=" color:#fff; width:30%">
			<nav class="site-breadcrumb">
	            <span class="sb-item active" style="font-size:20px">
	         <i class="icon-location-pin"></i> 업계동향 > </span><span class="sb-item active" style="font-size:20px">
	         <i class="ti-stats-up"></i> 비교차트</span>
	         </nav>
			</div>
		</div>
	</section>
	<!-- Page top Section end -->

 


  
   <!--==========================
	 분석 차트
  ============================--> 
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                	   <font color="#39485f">비교차트</font>
              </header>
              
              <div class="panel-body">
 

      <div class="container" style="max-width:85%">
      
 		<!-- 모든 사업자번호 뽑아서 보낼 form 태그 -->
          <form name="allBusinessNumber" method="post" action="/posbis/preChartForm.do"> 
          	<c:forEach items="${businessNoList}" var="businessNoList">					
					<input type="hidden" name="allBusinessNo"   value="${businessNoList.business_no}"> 
			</c:forEach>
			
          </form>
          
        
            <!------------------ 메인으로 보여줄 div -------------------->

            	 
	            	<form name="preChartForm" method="post" action="/posbis/preChartForm.do"> 
	
						<table border=0 width=1000  >
							<tr >
								<div align=right style="padding:0 0 15 0">
									사업자번호 : &nbsp;
									<select name="changeBusinessNo" style="width:200px;height:35px; text-align-last: center">	<!-- 중요! -->
										<!-- ************************************************************************************** -->
										<!-- 사용자 정의 태그인 JSTL C코어 태그 중 <forEach> 태그를 사용하여 ModelAndView 객체에    -->
										<!-- "boardList" 라는 키값으로 저장된 List<Mpa<Stirng,String>> 객체의 데이터를 출력하기.    -->
										<!-- ************************************************************************************** -->
										<%-- <c:forEach> 태그의 속성 설명 --%>
										<%-- 	
											<c:forEach 
												items="${ModelAndView 객체에 저장한 객체의 키값명으로 주로 List객체의 키값명이 삽입됨}" 
												var="items 속성에 설정한 List 객체 안의 i번째 데이터가 저장될 지역변수명" 
												varStatus="loopTagStatus"
											> 
												
											- items는 키값명과 일치 시켜야하고 var는 지역변수기 때문에 내맘대로 이름을 주어도 됨.	
											- LoopTagStatus 라는 일련번호를 생성해주는 객체가 있는데 이것의 메위주를 loopTagStatus 변수명에 담음.	
													
											* EL 태그를 사용하는 이 방법을 사용할 시 List가 DTO가 되어도 코딩의 변화 없이 잘 돌아간다.
											* 어느 부분이 틀리면 그 부분만 나오지 않고 다른 부분은 화면에 나옴.
										--%> 
								<!-- ------------------------------------------------------------------------------------------------------------------- -->
								 		<option value="all">모두검색
								 		<c:forEach items="${businessNoList}" var="businessNoList">
											
												<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
												</option>
										</c:forEach>
										
									</select> 
									
								<tr><div>
									
								<tr>
								<div align=right>
									연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도&nbsp;&nbsp; : &nbsp;
									<select name="changeYear" style="width:200px;height:35px; text-align-last: center;">	
										<option value="2020" selected>2020 년
										<option value="2019">2019 년
									</select>
									
									
							</table>
						</form>
		


				
				</div>

				<c:set var="changeBusinessNo" value="${all}" />
					<%-- <c:if test="${changeBusinessNo eq 'all'}"> --%>
					<!-- <div class="panel-body"> -->
			 			<div class="allBusinessNoChart" style="display:inline; width:100%;">

				         <h1>[가게별 월 매출]</h1><br>
				        <%--  ${changeBusinessNo} --%>

				         <div id="allChart_div" name="allChart_div" style="width: 90%; height: 60%; margin: 0 auto;"></div>
		
		
				 		<br>    
				         </div>
					<%-- </c:if> --%>
					
					<%-- <c:if test="${changeBusinessNo ne 'all'}"> --%>
					<!--  <div class="panel-body"> -->
					<div class="BusinessNoChart" style="display:inline; width:100%;">


				         <h1>[월 매출]</h1><br>
				        <%--  ${changeBusinessNo} --%>

				        <!--  <div id="chart_div1" style="width: 900px; height: 500px;"></div> -->
						<div id="chart_div1" style="width: 90%; height: 60%; margin: 0 auto;"></div>
		
				 		<br>    
				         
				          <div>
				         <table>
				         	<tr style="text-align:center">
					         	<td >
						         우리가게 인기메뉴<br>
						         </td>
						         				         
						         <td style="padding:0 45 0 45; height:40">
						         다른 가게 인기메뉴<br>
						         </td>
						         
						         <td>
						         같은 동네, 같은 업종 의 점포수
						         </td>
					         </tr>
					         
					         <tr style="text-align:center">
					         	<td>
					         	<table border=1 width=200 class="myPopularityMenu"  ></table>
					         	</td>
					         	
					         	<td style="padding:0 45 0 45">
					         	<table border=1 width=200 class="othersPopularityMenu" ></table>
					         	</td>
					         	
					         	<td>
					         	<table border=1 width=200 >
						         	<tr class="store_count">		
						         </table>
					         	</td>
					         
					         </tr>
					     </table>    
				         </div>
				         				         
				         <br><br>
				        <!--  <br><br>
				         우리가게 인기메뉴<br>
				    	 <div id="chart_div2" style="width: 300px; height: 200px;"></div> -->
	   				</div>
	   				
	   				 <div class="BusinessNoChart">


				         <br><br><br>

					    
					    
					    <!-- <table class="columns"> -->
	                     
	                     <div name="chart2" style="display:inline; width:95%;">
                            <!-- <td><div id="chart_div2_1" style="width: 600px; height: 350px;"></div></td>
                            <td><div id="chart_div2_2" style="width: 600px; height: 350px;"></div></td> -->
                        </div>
                        <table><tr><td>&nbsp;</table>
                        <br>
                        <div name="chart3" style=" width:90%; margin:0 -90 0 0">
                            <!-- <td><div id="chart_div3" style="width: 700px; height: 350px;"></div></td> -->
                        </div>
                        
                        <br><br>
                        
                        
                        <table style="margin: 0 0 -1px 1020px;"><tr><td>

							<select name="changeMonth" style="width:200px;height:35px; text-align-last: center; float:right">	
								<option value="01" selected>01 월
								<option value="02" >02 월
								<option value="03" >03 월
								<option value="04" >04 월
								<option value="05" >05 월
								<option value="06" >06 월
								<option value="07" >07 월
								<option value="08" >08 월
								<option value="09" >09 월
								<option value="10" >10 월
								<option value="11" >11 월
								<option value="12" >12 월
							</select>

						</table>
						
                        
                        <div name="chart5" style=" width:100%; height:500; margin:0 0 0 -31">
                            <!-- <div id="chart_div5" style="width: 110%; height: 500px;"></div> -->
                        </div>


	          		<br>
	          		<br>
	   				</div>
	   				<%-- </c:if> --%>
	         	
	         	
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
 