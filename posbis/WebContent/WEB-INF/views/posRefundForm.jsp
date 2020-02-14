<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
 
<head>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> 
 

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>매출관리</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
    <link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
	<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/simple-line-icons/css/simple-line-icons.css">  




<script>

$(document).ready(function(){

		//--------------------------------------------------------------
		// name="rowCntPerPage" 에 change 이벤트가 발생하면 실행할 코드 설정하기.
		//--------------------------------------------------------------
		$('[name=rowCntPerPage]').change(function(){
			goSearch();	
		});
		
		//================================================================
			// 페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기.
		//================================================================
		$(".pagingNumber").html(
			getPagingNumber(
				"${posSalesAllCnt}"				//검색 결과 총 행 개수
				,"${posSearchDTO.selectPageNo}"	//선택된 현재 페이지 번호
				,"${posSearchDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
				,"10"								//페이지당 보여줄 페이지번호 개수
				,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
			)		
		);
 
		
		// 클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기.
		// 검색 후에 검색한 조건들 웹페이지에 표시해주기.
	 
		inputData( "[name=selectPageNo]", "${posSearchDTO.selectPageNo}" );
		inputData( "[name=rowCntPerPage]", "${posSearchDTO.rowCntPerPage}" );
		
 
	});
	
function goSearch(){
	 
		document.posRefundForm.submit();
}


 
//=====  오늘 날짜 시간 출력 ==============================================================================================
//------------------------------------



function showTime() {
	var today = new Date();
	//----------------------------
	var amPm = "오후";
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var date = today.getDate();
	var hour = today.getHours();
	var minute = today.getMinutes();
	var second = today.getSeconds();
	var week = [ "일", "월", "화", "수", "목", "금", "토" ][today.getDay()]; //*************

	//var wee = new Array("일","월","화","수","목","금","토")[today.getDay()];//위에 한줄이랑 같은거

	//var arr= new Array("일","월","화","수","목","금","토");   //위에 한줄이랑 같은거
	//var week =arr[today.getDay()];

	if (month < 10) {
		month = "0" + month;
	}
	if (date < 10) {
		date = "0" + date;
	}
	if (hour < 12) {
		amPm = "오전";
	}
	if (hour > 12) {
		hour = hour - 12;
	}
	if (hour < 10) {
		hour = "0" + hour;
	}
	if (minute < 10) {
		minute = "0" + minute;
	}
	if (second < 10) {
		second = "0" + second;
	}
	//id="nowTime"가 있는 태그영역 내부에 시간 문자열 삽입
	document.getElementById("nowTime").innerHTML = year + "년 " + month
			+ "월 " + date + "일 (" + week + ")<br>" + amPm + " " + hour + "시 "
			+ minute + "분 " + second + "초";
}

//1초마다 showTime() 함수 호출하는 함수 선언
//-----------------------------------
function startTime() {
	showTime();
	//1초마다 showTime() 함수 호출
	//----------------------------
	//window.setInterval( "showTime()", 1000 );  //1000=1초 //밑에거랑 같아
	window.setInterval(function() {
		showTime();
	}, 1000); //익명함수
}
//===== / 오늘 날짜 시간 출력 끝==============================================================================================
 
	
 //월매출 콤마 넣기 함수
	function numberWithCommas(number) {
	    var parts = number.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    return parts.join(".");
	}

	//콤마풀기
	function uncomma(str) {
	    var str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}


	var levelNum= 0;
	
	$(document).on('click','.detailbutton',function() {
		
		$(".refundTableList").find("tbody").empty();
		/* $(".allPrice").find(".allPriceDetail").empty(); */
		
		var levelNum= 0;
 
			var detaildata= $(this).parent().parent().find('td').find("input[type=hidden]")
			var business_no=$(this).parent().parent().find("input[type=hidden]").val();
			var sales_date=$(this).parent().parent().find('td').find("input[type=hidden]").eq(1).val();
 
		 	
			var business_noReal="business_no="+business_no+"&"+"sales_date="+sales_date
			
	 		$.ajax({
				
				url : "/posbis/posDetailRegProc.do"	
				, type : "post"				
				, data : business_noReal				
				, success : function(data){
					if (data[0]!=null){
				 
						
						var tableObj=$(".refundTableList").find("tbody")
						
						var total=0;
						
					  	  for(var i=0; i<data.length; i++){
					  	 
					  		var menu_name=data[i].menu_name
							var sales_count=data[i].sales_count
							var menu_price=data[i].menu_price
							var business_no=data[i].business_no
							var sales_date=data[i].sales_date
					 
							var refundList=tableObj.append("<tr><td>"+(++levelNum)+"<td>"+menu_name+"<td class=perPrice>"+menu_price+"<td>"+sales_count+"<input type=hidden name=business_no value="+business_no+">"+"<input type=hidden name=sales_date value="+sales_date+">"+"<input type=hidden name=sales_count value="+sales_count+">")
							
					  	  }  
					  	for(var i=0; i<tableObj.find("tr").length; i++){
					  		
					  		$(".perPrice").each(function() {
					             var num = $(this).text();
					             var commaNum = uncomma(num);
					             $(this).text(commaNum);
					     	});
							
				 
					  		var price=tableObj.find("tr").eq(i).find("td").eq(2).text()
					  		var cnt=tableObj.find("tr").eq(i).find("td").eq(3).text()
				 
					  		
					  		var perPriceCnt=price*cnt
					  		total+=perPriceCnt
					  		$(".allPriceDetail").text(total); 	

					  		var num = $(".allPriceDetail").text();
					  		var commaNum = numberWithCommas(num);
					  		$(".allPriceDetail").text(commaNum+" 원");  
					  		
					  		
					  		$(".perPrice").each(function() {
					             var num = $(this).text();
					             var commaNum = numberWithCommas(num);
					             $(this).text(commaNum);
					     	});
						}
			 
					}else{
						
						alert("관리자 문의");
					}
				 
				},
				error : function(request, status, error) {
					alert("서버 접속 실패");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error);
				}
			});  

	});
 
 
	var sales_cnt1=new Array();// 배열개수 선언 개수
	var sales_date1=new Array();// 배열개수 선언 판매시간
	var sales_busi_no1=new Array();// 배열개수 선언 사업자 번호
	
	var trObj=$(".refundTableList").find("tbody").find("tr")
 
	$(document).on('click','.refundButton',function() {
		
		if(confirm("결제 취소 하시겠습니까?") == true){
			var refundTrdate=$(".refundTableList").find("tbody").find("tr").find("[name=sales_date]").val()
	 
 
				for(var i=0; i<trObj.length; i++){
					
				 
					sales_cnt1[i]=trObj.find("[name=sales_count]").val()
					sales_date1[i]=trObj.find("[name=sales_date]").val()
					sales_busi_no1[i]=trObj.find("[name=business_no]").val()
					
					trObj.find("[name=sales_count]").val(sales_cnt1[i])
					trObj.find("[name=sales_date]").val(sales_date1[i])
					trObj.find("[name=business_no]").val(sales_busi_no1[i])
				};
					
				 $.ajax({
						url : "/posbis/posDeleteRegProc.do"
						, type : "post"				
						, data : $('[name=posMenuRefundForm]').serialize()				
						, success : function(deleteRegCnt){			
							if(deleteRegCnt>0){
					 
								alert("환불이완료되었습니다.");
								
			 
								location.replace("/posbis/posRefundForm.do"); 
								
							}
							else{
								alert("결제 실패! 관리자에게 문의 바랍니다.");
							}
						}
						, error : function(){
							alert("서버 접속에 실패하였습니다.");
						}
					 
				 });
			 
		}else{
			
			 alert("취소되었습니다."); 
			location.replace("/posbis/posRefundForm.do"); 
			
			
		}
	
	});
			
 
	function goPosRefundForm(){
		
		//alert("매출로 이동");
		location.replace("/posbis/posRefundForm.do");
	
	}

	
	function goPosPayForm(){
		
		//alert("결제로 이동");
		location.replace("/posbis/posPayForm.do");
	
	}


	// 로그아웃
    function goPosLogoutForm(){
 	   location.replace("/posbis/posLogoutForm.do");
		}
	
	
</script>

</head>
<body onLoad ="startTime()">
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- 상단, 가게이름, 사업자번호, 현재시간 표시 -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="">${business_name}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown connection">
  							<a class="nav-link">
  								<div id="businessNo" align="right" style=line-height:1.5>
  									사업자번호<br>${business_no}</font>
  								</div>
  							</a>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link"><div id="nowTime" align="right" padding="0" style=line-height:1.5>nowDate</div></a>
                        </li>
                        <!-- 로그아웃 -->
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" style="cursor:pointer"  onClick="goPosLogoutForm();"><div><center><i class="icon-logout"></i></center>[로그아웃]</div></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- 상단, 가게이름, 사업자번호, 현재시간 표시 끝 -->
        <!-- ============================================================== -->
        
        
        
        <!-- ============================================================== -->
        <!-- left menulist -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column" >
                            <li class="nav-divider" style="font-size:25"> Menu</li>
                            <li class="nav-item " style="cursor:pointer">
                                <a class="nav-link"  onClick="goPosPayForm();" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1">
                                <i class="fa fa-fw fas fa-calculator" style="font-size:25"></i><span style="cursor:pointer; font-size:25">결제관리</span>
                				</a>
                            </li>
                            <li class="nav-item " style="cursor:pointer">
                                <a class="nav-link active"  onClick="goPosRefundForm();" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2">
                                <i class="fa fa-fw fas fa-won-sign" style="font-size:25"></i><span style="cursor:pointer; font-size:25">매출관리</span>
                				</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        
        
        
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- 주화면 상단 navi  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <ol class="breadcrumb" style="padding: 2 0 12 15;">
								<li class="breadcrumb-item">MENU</li>
								<li class="breadcrumb-item active" aria-current="page"><i class="fa fa-fw fas fa-won-sign"></i>매출관리</li>
                            </ol>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- 주화면 상단 navi 끝 -->
                    <!-- ============================================================== -->

                    <!-- ============================================================== -->
                    <!-- ================ 메뉴 ======================================== -->
                    <!-- ============================================================== -->
                    <div class="row">
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8" style=" max-width: 60%">
					    <div class="card"  style="height:100%;">
	                          <h5 class="card-header">판매 LIST</h5>
	                          	<div class="sidebar-nav-fixed" >
	                          	<div class="card-body">
								<form name="posRefundForm" method="post" action="/posbis/posRefundForm.do">
                        		<input type="hidden" name="selectPageNo" >
			
                        		<table align="right">
									<tr>
										<td>
								 
											[총 개수] : ${posSalesAllCnt}&nbsp; 
									 
											<select name="rowCntPerPage">
												<option value="10">10
												<option value="15">15
												<option value="20">20
												<option value="25">25
												<option value="30">30	
											</select> 행보기
								</table><br><br>  
 
	                          	<input type="hidden" name="selectPageNo">
	                          		<table class="table table-striped table-bordered first tablelist" name="tablelist">
	                              		<thead align="center">
		                                	<tr>
		                                      <th width="5%">no</th>
		                                      <th width="38%">판매일</th>
		                                      <th width="17%">판매개수</th>
		                                      <th width="17%">비고</th>
		                                	</tr>
	                             		</thead>
	                              		<tbody align="center" name="perMenuList">
	                              		 <c:forEach items="${posSalesList}" var="posSales" varStatus="loopTagStatus">
	                              		
	                              		<tr>
	                              		<input type='hidden' name='business_no' value='${business_no}'>
	                              		<td align=center >${posSales.RNUM}<input type='hidden' name='no' value='${posSales.RNUM}'>
	                              		<td align=center class="sales_date" >${posSales.sales_date}<input type='hidden' name='sales_date' value='${posSales.sales_date}'>
	                              		<td align=center >${posSales.sales_count}<input type='hidden' name='sales_count' value='${posSales.sales_count}'>
	                              		<td align=center ><input type='button' class='detailbutton'  value='상세보기' style='height:35'>
	                              		</tr>
	                              		</c:forEach>
										</tbody>
	                          		</table>
                         		</form>
                         		<c:if test="${empty posSalesList}">
									검색 결과가 없습니다.
								</c:if>  
								<br>
                         			<div align="center">&nbsp;<span class="pagingNumber" style="font-size:20"></span>&nbsp;</div>
                         			<br>
                         			
	                         	</div>
	                      		</div>
	                  	</div> 
	                </div>
                    <!-- ============================================================== -->
                    <!-- 메뉴목록 끝  -->
                    <!-- ============================================================== -->
                    
                    
                    <!-- ============================================================== -->
                    <!-- 결제목록 -->
                    <!-- ============================================================== -->
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12" style="height:868; min-width:40%">                    
						<div class="card" style="height:76%">
                  			<h5 class="card-header">결제 목록</h5>
                  				<div class="card-body">
                      			<div class="table-responsive">
                        		<form name="posMenuRefundForm" method="post" action="/posbis/posSalesRegProc.do">
                        
	                          		<table class="table table-striped table-bordered first refundTableList" name="refundTableList">
	                              		<thead align="center">
		                                	<tr>
		                                      <th width="5%">no</th>
		                                      <th width="38%">메뉴이름</th>
		                                      <th width="30%">가격(원)</th>
		                                      <th width="10%">수량</th>
		                                	</tr>
	                             		</thead>
	                              		<tbody align="center" name="perMenuList">
										</tbody>
	                          		</table>
                         		</form>
                      		</div>
                  			</div>
						</div>
						
						<!-- ============================================================== -->
	                	<!-- 총합계  -->
	                	<!-- ============================================================== -->
						<div class="card border-3 border-top border-top-primary" style="height:20%">
	                        <div class="card-body allPrice">
	                            <h2 style="font-size:35">TOTAL</h2>
	                            <h1><span class=allPriceDetail style="float:left;font-size:35;margint:5 0 0 35"></span></h1>
	                            <div><input type="button" value="결제취소" style="WIDTH: 110; HEIGHT: 60pt; float:right; font-size:25" class='refundButton'></div>
	                            <div class="metric-value d-inline-block">
	                            </div>
	                        </div>
	                    </div>
	                    
	                    
	                    <!-- ============================================================== -->
		                <!-- 총합계 끝  -->
		                <!-- ============================================================== -->	
					
					</div>					
                    <!-- ============================================================== -->
                    <!-- 결제목록 끝  -->
                    <!-- ============================================================== -->
                </div>
                </div>
            </div>
    	</div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    
    
    
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="resources/pos/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/pos/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="resources/pos/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="resources/pos/assets/libs/js/main-js.js"></script>

</body>
 
</html>