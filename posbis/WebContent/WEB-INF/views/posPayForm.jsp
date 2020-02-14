<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
 
<head>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> 
	
	
    <title>${business_name}</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제하기</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
    <link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
	<link rel="stylesheet" href="resources/pos/assets/vendor/fonts/simple-line-icons/css/simple-line-icons.css">  



<script>

		
	$(document).ready(function(){
	   
	   
	   //월매출 콤마 넣기
	    $(".price").each(function() {
         var num = $(this).text();
         var commaNum = numberWithCommas(num);
         $(this).text(commaNum);
 		 });
		 
		
	   });


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
	
		//전역변수 선언 클릭수 추가
		var sales_count = 1;
		var levelNum= 0;
		var flag=false;
		
 
		function goMenuNameForm() { 
			 
			 /* var unnum = $(".allPrice").find("span").text();
	         var uncommaNum = uncomma(unnum);
	         $(".allPrice").find("span").text(uncommaNum ); */

			if($("[name=tablelist] [name=perMenuList]").find("tr").eq(0).text()!="" && $(".sales_count").val()==""){
				$("[name=menu_name]").prop( "checked",false );
				return;
			};

			
			$.ajax({
						url : "/posbis/posPerMenuProc.do",
						type : "post",
						data : $("[name=menuNameform]").serialize(),
						success : function(data) {
							if (data.length == 1) {
						 
								 	var menu_name=data[0].menu_name;
								 	var menu_no=data[0].menu_no;
									var menu_price=data[0].menu_price;
									var category=data[0].menu_category_code;

									if($("[name=tablelist] [name=perMenuList]").find("tr").length==0){
										levelNum=0;
									}else if($("[name=tablelist] [name=perMenuList]").find("tr").length>0){
										levelNum=$("[name=tablelist] [name=perMenuList]").find("tr").last().find("td").eq(0).text();
									}
									
		
									for(var i=0; i<=$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
 											if(menu_name==$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(1).text()){
 	 												/* alert("같은메뉴"); */
													flag=true;
													break;
 	 										}else{
 	 	 											/* alert("다른메뉴"); */
 	 	 											$("[name=menu_name]").prop( "checked",false );
 	 												flag=false;
 	 	 									}
									}

									if(flag==false){
										
									  /*   $(".perPrice").each(function() {
									         var unnum = $("perPrice").find("span").text();
									         var uncommaNum = uncomma(unnum);
									         $(".perPrice").find("span").text(uncommaNum);
									    } */
									    
									    
									    
										var appendTr = "<tr><td>"+(++levelNum)
										appendTr += "<td>"+menu_name+"<input type='hidden' value='"+menu_name+"'name='menu_name'>" //메뉴이름
										appendTr += "<td class=perPrice><span>"+menu_price+"<input type='hidden' value='"+menu_price+"'name='menu_price'></span>" //메뉴 가격 
										appendTr += "<td><input type='text' name='"+menu_name+"' value="+sales_count+" class='sales_count' '"+menu_name+"' size=3 style='height:35px; text-align:center'><input type='hidden' name='sales_count' class='sales_countCNT' value="+sales_count+">"  //메뉴 개수
								
										appendTr += "<td style='width:100'><div style=float:left; ><input type=button class=count_updateButton1 name=count_update value='+' style='height:35px; width:35; font-size:30'></div>&nbsp;<div style=float:right;><input type=button class=count_updateButton2 name=count_update value='-' style='height:35px; width:35; font-size:40'></div><td><input type=button name=menu_deleteBtn  value='삭제' style='height:35px'></tr>"
										$("[name=tablelist] [name=perMenuList]").append(appendTr)
										
				 
								    	
										
										var perPrice=$("[name=tablelist] [name=perMenuList]").find("tr").eq(0).find("td").eq(2).text();
										
										if($(".allPrice").text()==""){
											$(".allPrice").append("<span name='"+category+"'>"+perPrice+"<span>");
											
											 var num = $(".allPrice").find("span").text();
									         var commaNum = numberWithCommas(num);
									         // 처음으로 메뉴 선택했을 때 total값 (원 붙이기)
									         $(".allPrice").find("span").text(commaNum + " 원");  
									         
									    //////////////////////////////////////////////////////     
									         $(".perPrice").each(function() {
									             var num = $(this).text();
									             var commaNum = numberWithCommas(num);
									             $(this).text(commaNum );
									     		 });
 
									         //////////////////////////////////////////////////////  
											return;
											} 		

										
										var total=0;	 
										for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
											
											$(".perPrice").each(function() {
									             var num = $(this).text();
									             var commaNum = uncomma(num);
									             $(this).text(commaNum);
									     	});
											
											
 
											var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
											var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
										
												var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
												var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
  											
  											var perPriceCnt=perPriceCheck*perCntCheck
											 total=total+perPriceCnt;
											 // 다른 메뉴를 선택했을 때 처음 total값 (원 붙이기)
  											$(".allPrice").find("span").text(total + " 원");
 
											 
											}
										
										//콤마넣기
										  var num = $(".allPrice").find("span").text();
								         var commaNum = numberWithCommas(num);
								         $(".allPrice").find("span").text(commaNum);
								         
								         $(".perPrice").each(function() {
								             var num = $(this).text();
								             var commaNum = numberWithCommas(num);
								             $(this).text(commaNum );
								     		 });
								 	 
									 
 
										$("[name=menu_name]").prop( "checked",false );
										
										
						
									}else{
										var menuN = "[name='"+menu_name+"']";
						 
										var toStr=$("[name=tablelist] [name=perMenuList]").find("tr").find(menuN).val();
						 
										var toStrfinal= parseInt(toStr, 10);
										$("[name=tablelist] [name=perMenuList]").find("tr").find(menuN).val(toStrfinal+1);
										var toStrfinal=$("[name=tablelist] [name=perMenuList]").find("tr").find(menuN).val()
										
										
										//////input hidden을 위한 업데이트
										var toStr1CNT=$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_countCNT").val();
										var toStrfinal1CNT= parseInt(toStr1CNT, 10);
										$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_countCNT").val(toStrfinal1CNT+1);

										
										$("[name=menu_name]").prop( "checked",false );
										
								
																	 
								    
										
										var total=0;	 
										for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
											

											$(".perPrice").each(function() {
									             var num = $(this).text();
									             var commaNum = uncomma(num);
									             $(this).text(commaNum);
									     	});
											
											
											/* $(".allPrice").append("<span name='"+menu_price+"'>"+menu_price+"</span>"); */
											var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
											var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
										
												var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
												var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
  											
  											var perPriceCnt=perPriceCheck*perCntCheck
 
  											
											 total=total+perPriceCnt;
											 // 메뉴 여러번 선택해도 total 값에 원이 붙음.
  											$(".allPrice").find("span").text(total+ " 원");
 
  											//콤마넣기
  											  var num = $(".allPrice").find("span").text();
  									         var commaNum = numberWithCommas(num);
  									         $(".allPrice").find("span").text(commaNum);
									    
  									         
  									       $(".perPrice").each(function() {
  								             var num = $(this).text();
  								             var commaNum = numberWithCommas(num);
  								             $(this).text(commaNum);
  								     		 });
  								 	 
											 
											}
										 
									}
							} else {
								alert("검색 실패");
								$("[name=menu_name]").prop( "checked",false );
							}
						},
						error : function(request, status, error) {
							alert("서버 접속 실패");
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}

					});
			
 

		}
 
	 	//////////////////////////////////////////////////////////////////////////////////////////////////
	
		//+버튼 누를시
			var total=0;
		 
	 	$(document).on('click','.count_updateButton1',function() {
	 		
	 	
	 		
	 		var unnum = $(".allPrice").find("span").text();
	         var uncommaNum = uncomma(unnum);
	         $(".allPrice").find("span").text(uncommaNum);
	         
	         
 
	 		if($(this).parent().parent().find(".count_updateButton1").val()=="+"){
	 			
	 			var toStr1 =$(this).parent().parent().parent().find(".sales_count").val();
				var toStrfinal1= parseInt(toStr1, 10);
				$(this).parent().parent().parent().find(".sales_count").val(toStrfinal1+1);
				
 
				//////input hidden을 위한 업데이트
				var toStr1CNT=$(this).parent().parent().parent().find(".sales_countCNT").val();
				var toStrfinal1CNT= parseInt(toStr1CNT, 10);
				$(this).parent().parent().parent().find(".sales_countCNT").val(toStrfinal1CNT+1);
				
 
	 		}
	 		
			var total=0;	
			$(".allPrice").find("span").text(total);
 
	 		
			 //총합 계산
			for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
				
				$(".perPrice").each(function() {
		             var num = $(this).text();
		             var commaNum = uncomma(num);
		             $(this).text(commaNum);
		     	});
				
		 		
				
				/* $(".allPrice").append("<span name='"+menu_price+"'>"+menu_price+"</span>"); */
				var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
				var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
			
					var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
					var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
					
					var perPriceCnt=perPriceCheck*perCntCheck

					
				 total=total+perPriceCnt;
					$(".allPrice").find("span").text(total);
				}	
			 
			//콤마넣기
			  var num = $(".allPrice").find("span").text();
	         var commaNum = numberWithCommas(num);
	         $(".allPrice").find("span").text(commaNum+ " 원");
	         
	         
	         $(".perPrice").each(function() {
		             var num = $(this).text();
		             var commaNum = numberWithCommas(num);
		             $(this).text(commaNum);
		     });
			
	 		 
	 		
		}); 
		
	 	//////////////////////////////////////////////////////////////////////////////////////////////////
	
		
	 	//-버튼 누를시
	 	
		$(document).on('click','.count_updateButton2',function() {
			
			var unnum = $(".allPrice").find("span").text();
	         var uncommaNum = uncomma(unnum);
	         $(".allPrice").find("span").text(uncommaNum);
	         
	         

 
	 		if($(this).parent().parent().find(".count_updateButton2").val()=="-"){
	 			var toStr2 =$(this).parent().parent().parent().find(".sales_count").val();
				var toStrfinal2= parseInt(toStr2, 10);
				$(this).parent().parent().parent().find(".sales_count").val(toStrfinal2-1);
			 
				
				//////input hidden을 위한 업데이트
				var toStr2CNT=$(this).parent().parent().parent().find(".sales_countCNT").val();
				var toStrfinal2CNT= parseInt(toStr2CNT, 10);
				$(this).parent().parent().parent().find(".sales_countCNT").val(toStrfinal2CNT-1);
	 
 
	 	 	} 
			
			//0일때 삭제 안내후 총합
			if($(this).parent().parent().parent().find(".sales_count").val()=="0"){
 
				
				$(this).parent().parent().parent().remove();
				
				var toStrperPrice=$(this).parent().parent().eq(0).find("td").eq(2).text()
				var toStrperCnt= $(this).parent().parent().eq(0).find(".sales_count").val()
				var perPrice= parseInt(toStrperPrice, 10);//가격
				var perCnt= parseInt(toStrperCnt, 10); //개수

				var toStrallPrice=$(".allPrice").find("span").text()
				var allPrice= parseInt(toStrallPrice, 10);

	 
				
				$(".allPrice").find("span").text(toStrallPrice-(perPrice*perCnt));
				
				//콤마넣기
				  var num = $(".allPrice").find("span").text();
		         var commaNum = numberWithCommas(num);
		         $(".allPrice").find("span").text(commaNum);


				//순서번호 재 정렬
				 for(var i=0; i<=$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){ 
						var idx=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).index();
						$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(0).text(idx+1);
				 }

				 
				
				
				
			}
			
			//총합 계산
 
			var total=0;		
			$(".allPrice").find("span").text(total);
 
			
			for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
				
				$(".perPrice").each(function() {
		             var num = $(this).text();
		             var commaNum = uncomma(num);
		             $(this).text(commaNum);
		     	});
				
				
				/* $(".allPrice").append("<span name='"+menu_price+"'>"+menu_price+"</span>"); */
				var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
				var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
			
					var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
					var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
					
					var perPriceCnt=perPriceCheck*perCntCheck

					
				 total=total+perPriceCnt;
					$(".allPrice").find("span").text(total);
				}	
			
			//콤마넣기
			  var num = $(".allPrice").find("span").text();
	         var commaNum = numberWithCommas(num);
	         $(".allPrice").find("span").text(commaNum+ " 원");
	         
	         $(".perPrice").each(function() {
	             var num = $(this).text();
	             var commaNum = numberWithCommas(num);
	             $(this).text(commaNum);
	     });
			
			
			
		}); 
 
	 	
	 	//////////////////////////////////////////////////////////////////////////////////////////////////
	

 	$(document).on('change','.sales_count',function() {
 
			if (is_valid_pattern($(this).parent().parent().find(".sales_count"),/^[0-9]{1,5}$/) == false) {							
					alert("숫자입력해주세요");
				 
					$(this).parent().parent().find(".sales_count").val("").focus();
				}else{
				
					var total=0;	 
					for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
  
						var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
						var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
					
							var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
							var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
							
							var perPriceCnt=perPriceCheck*perCntCheck

							
						 total=total+perPriceCnt;
							$(".allPrice").find("span").text(total);
								var toStr1CNT=$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_count").val();
								var toStrfinal1CNT= parseInt(toStr1CNT, 10);
								$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_count").val(toStrfinal1CNT);
								
							//////input hidden을 위한 업데이트
							
								var toStrfinal1CNT=$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_count").val();
								$("[name=tablelist] [name=perMenuList]").find("tr").find(".sales_countCNT").val(toStrfinal1CNT);
						 
								
							 
						}				
				}
			

 
 	});
 	
 	
 	
 	
 	//////////////////////////////////////////////////////////////////////////////////////////////////

		$(document).on("click","[name=menu_deleteBtn]",function(){
			 
			

	         
	         $(this).parent().parent().remove(); 
	 

	         var toStrperPrice=$(this).parent().parent().eq(0).find("td").eq(2).text()
	         var toStrperCnt= $(this).parent().parent().eq(0).find(".sales_count").val()
	         var perPrice= parseInt(toStrperPrice, 10);//가격
	         var perCnt= parseInt(toStrperCnt, 10); //개수

	         var toStrallPrice=$(".allPrice").find("span").text()
	         var allPrice= parseInt(toStrallPrice, 10);

	 
	         
	         $(".allPrice").find("span").text(toStrallPrice-(perPrice*perCnt));


	         //콤마넣기
	           var num = $(".allPrice").find("span").text();
	            var commaNum = numberWithCommas(num);
	            $(".allPrice").find("span").text(commaNum);
	         
	          for(var i=0; i<=$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){ 
	               var idx=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).index();
	               $("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(0).text(idx+1);
	          }


	            
	         //총합 계산
	          
	            var total=0;      
	            $(".allPrice").find("span").text(total);
	    
	            
	            for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
	               
	               $(".perPrice").each(function() {
	                      var num = $(this).text();
	                      var commaNum = uncomma(num);
	                      $(this).text(commaNum);
	                 });
	               
	               
	               /* $(".allPrice").append("<span name='"+menu_price+"'>"+menu_price+"</span>"); */
	               var toStrperPriceCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find("td").eq(2).text();
	               var toStrperCntCheck=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_count").val()
	            
	                  var perPriceCheck= parseInt(toStrperPriceCheck, 10);//가격
	                  var perCntCheck= parseInt(toStrperCntCheck, 10); //개수 */
	                  
	                  var perPriceCnt=perPriceCheck*perCntCheck

	                  
	                total=total+perPriceCnt;
	                  $(".allPrice").find("span").text(total);
	               }   
	            
	            //콤마넣기
	              var num = $(".allPrice").find("span").text();
	               var commaNum = numberWithCommas(num);
	               // 삭제 버튼 눌러도 total에 원붙음
	               $(".allPrice").find("span").text(commaNum+ " 원");
	               
	               $(".perPrice").each(function() {
	                   var num = $(this).text();
	                   var commaNum = numberWithCommas(num);
	                   $(this).text(commaNum);
	           });

	            

		});
 	
 	//////////////////////////////////////////////////////////////////////////////////////////////////

	  var sales_count1=new Array();// 배열개수 선언 
 
		function salesRegForm(){
		  
		  if(confirm("결제 하시겠습니까?") == true){
		  
			 	for(var i=0; i<$("[name=tablelist] [name=perMenuList]").find("tr").length; i++){
			 		sales_count1[i]=$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_countCNT").val(); 		
			 		$("[name=tablelist] [name=perMenuList]").find("tr").eq(i).find(".sales_countCNT").val(sales_count1[i])
				};
				 
				
				
			 $.ajax({
			
				url : "/posbis/posSalesRegProc.do"
					
				, type : "post"				
				, data : $('[name=posMenuForm]').serialize()				
				, success : function(salesRegCnt){			
					if(salesRegCnt>0){
						alert("결제가 완료되었습니다.");
						location.replace("/posbis/posPayForm.do");
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
			  
			 alert("취소되었습니다"); 
			 location.replace("/posbis/posPayForm.do"); 
		  }
			
		} //function salesRegForm(){ 
			
			
		 
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
                    
                    	<!-- 사업자 번호 -->
                        <li class="nav-item dropdown connection">
  							<a class="nav-link">
  								<div id="businessNo" align="right" style=line-height:1.5>
  									사업자번호<br>${business_no}</font>
  								</div>
  							</a>
                        </li>
                        
                        <!-- 시간 -->
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" ><div id="nowTime" align="right" padding="0" style=line-height:1.5>nowDate</div></a>
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
                                <a class="nav-link active"  onClick="goPosPayForm();" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1">
                                <i class="fa fa-fw fas fa-calculator" style="font-size:25"></i><span style="cursor:pointer; font-size:25">결제관리</span>
                				</a>
                            </li>
                            <li class="nav-item " style="cursor:pointer">
                                <a class="nav-link"  onClick="goPosRefundForm();" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2">
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
								<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">MENU</a></li>
								<li class="breadcrumb-item active" aria-current="page"><i class="fa fa-fw fas fa-calculator""></i>결제하기</li>
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
               <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="height:800">
                   <div class="card"  style="height:100%;">
                             <h5 class="card-header">메뉴 LIST</h5>
                                <div class="sidebar-nav-fixed" style="overflow: auto;">
                                <div class="card-body">
                        <form id="form" data-parsley-validate="" novalidate="" name="menuNameform" method="post"  action="/posbis/menuNameform.do" >
                           <c:forEach items="${posMenuList}" var="posMenu">
                                    <div style="margin: 18px; float: left;">
                                 <label for="${posMenu.MENU_NO}" class="btn btn-primary2"> 
                                 <input type="checkbox"  class="btn btn-primary2" autocomplete="off" value="${posMenu.MENU_NAME}" name="menu_name" id="${posMenu.MENU_NO}" style="display:none" onClick="goMenuNameForm();">
                                 <h2>${posMenu.MENU_NAME}</h2><span class="price" style="font-size:25px">${posMenu.MENU_PRICE}원</span>
                                 </label>
                              </div>
                                    </c:forEach>
                                </form>
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
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12" style="height:800">                    
						<div class="card" style="height:76%">
                  			<h5 class="card-header">결제 목록</h5>
                  				<div class="card-body">
                      			<div class="table-responsive">
                        		<form name="posMenuForm" method="post" action="/posbis/posSalesRegProc.do">
	                          		<table class="table table-striped table-bordered first tablelist" name="tablelist">
	                              		<thead align="center">
		                                	<tr>
		                                      <th width="5%">no</th>
		                                      <th width="38%">메뉴이름</th>
		                                      <th width="17%">가격(원)</th>
		                                      <th width="40%" colspan="3">수량</th>
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
	                        <div class="card-body">
	                            <h2>TOTAL</h2>
	                            <h1><div class=allPrice style="float:left"></div></h1>
	                            <div><input type="button" value="결제" style="WIDTH: 60pt; HEIGHT: 60pt; float:right; font-size:30" onClick="salesRegForm();"></div>
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