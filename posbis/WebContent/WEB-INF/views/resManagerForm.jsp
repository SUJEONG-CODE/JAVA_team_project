<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 관리</title>
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

<!-- 예약관리 부트스트랩 -->
<link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
<link href='resources/pos/assets/vendor/full-calendar/css/fullcalendar.css' rel='stylesheet' />
<link href='resources/pos/assets/vendor/full-calendar/css/fullcalendar.print.css' rel='stylesheet' media='print' />

<!-- ------------------------------------------------------------------------------- -->


<!--    <link rel="shortcut icon" href="img/favicon.png">
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


<style type="text/css">

/* 핍업 css */
#popup{overflow:hidden; height:auto; display:block; border-radius:3px; box-shadow:0px 1px 1px #333; width: 410px; z-index:100; position:absolute;  top:20%; left:10%;}
#popup h4{background: #6993DA; font-size: 19px; height: 36px;  padding: 8px 0 2px 15px; color: #FFF; font-weight:normal; margin: 0;}
#popup h4 a.close{float:right; padding-right:8px; color:#FFF; font-family:verdana}
  .popCont{display:block; background: #FFF; border:2px solid #659fd5; padding:10px 10px 0px 10px;  }
  .popCont li{height:24px; width:100%; display:inline-block; margin:0; border-top:1px solid #eaeaea;  font-size:12px; }
  .popCont li:last-child{border-bottom:1px solid #eaeaea; padding-bottom:3px;}
  .popCont strong{float:left; width:30%; background: #aaa; color:#FFF; padding:7px 0; text-align:center; border-right:1px solid #eaeaea; }
  .popCont span{display:block; float:left; padding:7px 0  7px 8px;} 

#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 


.window{
    display: none;
    position:fixed;  
    width:fit-content;
    height:fit-content;
    background-color:#6993DA;
    z-index:10000;   
 }

/* 핍업 css */

</style>

  
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

.fc-event{ cursor: pointer; }


label {
	font-size:25;
}
  
  </style>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

         <script>

       //**************수민*************
			var prevObj = null;
		//*******************************
      
 var selectDate;        

           $(document).ready(function(){

        	   // (추가)팝업창 이동가능하도록 적용
          	 $(".window").draggable();


          	<c:if test="${!empty businessNoList}">
				// 사업자 번호 입력양식에 넣어주기
	        	   inputData("[name=chooseAllBusinessNo]","${reservationDTO.chooseAllBusinessNo}");
	               <c:forEach items="${reservationDTO.chooseBusinessNo}" var="chooseBusinessNo">
	                  inputData("[name=chooseBusinessNo]","${chooseBusinessNo}");
	               </c:forEach>
	
	               
	               // 사업자번호 체크시
	               if($("[name=chooseBusinessNo]:checked").length==0){
	                  $("[name=chooseBusinessNo]").prop("checked",true);
	                  $("[name=chooseAllBusinessNo]").prop("checked",true);
	                   document.resForm.submit();
	                   reservationDTO.setChooseBusinessNo($("[name=resForm] [name=chooseBusinessNo]").val());
	                   resCntDTO.setChooseBusinessNo($("[name=resForm] [name=chooseBusinessNo]").val());
	                   resMangerDTO.setChooseBusinessNo($("[name=resForm] [name=chooseBusinessNo]").val());
	               }
	               if($("[name=chooseBusinessNo]:not(:checked)").length==0){
	                  $("[name=chooseAllBusinessNo]").prop("checked",true);
	               } 
	               var allbusi = $("[name=chooseAllBusinessNo]");
	               allbusi.change(function() {
	                  $("[name=chooseBusinessNo]").prop( "checked", allbusi.is(":checked") );
	               });
	
	               $("[name=chooseBusinessNo]").change(function(){
	                  if ($("[name=chooseBusinessNo]:not(:checked)").length > 0){
	                     allbusi.prop("checked",false);
	                  }else{
	                     allbusi.prop("checked",true);
	                  }
	               });// 사업자번호 체크시 끝
               </c:if>

               // (수정됨)달 체크
               $("[name=res_month]").click(function() {
              	   
                  	var res_month = $('[name=res_month]').find("option:selected").val();
                  	var res_year = $('[name=res_year]').find("option:selected").val();
                  	$("[name=res_day]").find("option").remove();
                  	 
                  	
                  	if(res_month=="02" &&(res_year%4==0 && res_year%100!=0 || res_year%400==0)){       		     
   	            	   for(var i=1; i<=29; i++){
   		                  var d = (i<10)?"0"+i:i;
   		             
   		                  $("[name=res_day]").append("<option value="+d+">"+d);
   		              }
   	               }else if(res_month=="02"){ 	 
  	                    for(var i=1; i<=28; i++){
  	                     var d = (i<10)?"0"+i:i;
  	                    
  	                     $("[name=res_day]").append("<option value="+d+">"+d);
  	                  }
  	               }else if(res_month=="01"||res_month=="03"||res_month=="05"||res_month=="07"||res_month=="08"||res_month=="10"||res_month=="12"){ 
  	            	   for(var i=1; i<=31; i++){
  	                       var d = (i<10)?"0"+i:i;
  	                    
  	                       $("[name=res_day]").append("<option value="+d+">"+d);
  	            	   }
  	               }else{
  	            	 
  	                  for(var i=1; i<=30; i++){
  	                     var d = (i<10)?"0"+i:i;
  	                  
  	                     $("[name=res_day]").append("<option value="+d+">"+d);
  	                  }
  	               }
                 
                });//달 체크 끝 


                // (추가)연락처 입력 창 자동 커서이동  
                $('[name=phone1]').keyup (function () {
                    var charLimit = $(this).attr("maxlength");
                    if (this.value.length >= charLimit) {
                        $(this).next().focus();
                        return false;
                    }
                });
                
                $('[name=phone2]').keyup (function () {
                    var charLimit = $(this).attr("maxlength");
                    if (this.value.length >= charLimit) {
                        $(this).next().focus();
                        return false;
                    }
                });
                //커서이동 끝
                
             
               // 팝업창 띄운 후 검은 막 띄우기
               $(".openMask").click(function(e){
                   e.preventDefault();
                   wrapWindowByMask();
               });

               
              // 팝업창 닫기 버튼을 눌렀을 때
               $(".window .close").click(function (e) {  
                   e.preventDefault();

                   // (수정) 닫으면 내용 리셋
                   $("form").each(function() {  
                       if(this.id == "res_reset") this.reset();
                       $("#mask, .window").hide();
                   });
                   $('.window').val('');
                // (수정) 닫으면 내용 리셋 끝
               });       
        
               //팝업창 외에 뒤에있는 검은색 배경 눌렀을 때 
               $("#mask").click(function () {  
                   $(this).hide();

                   // (수정) 닫으면 내용 리셋
                   $("form").each(function() {  
                       if(this.id == "res_reset") this.reset();
                       $("#mask, .window").hide();
                   });
                   $('.window').val('');
                   // (수정) 닫으면 내용 리셋
               });
                  

   			// (수정)작동 이상없을 시 삭제 예정 
   			
            /* // 선택한 사업자 번호를 popup_business_no로 넣어준다
            $('#select_business_no').change(function(){
               //alert(this.value);
               $('#select_business_no').val(this.value);
               $('#popup_business_no').val(this.value);
               fn_get_events(0);
            }); */

	
            function makeTodaybtnActive(){
		         $('#calendar button.fc-today-button').removeAttr('disabled');
		         $('#calendar button.fc-today-button').removeClass('fc-state-disabled');
		       }
            
            

            $('#calendar').fullCalendar({

            	eventRender: function(event, element) {
                    makeTodaybtnActive();
                },      //today 활성화
            
             //달력에서 월, 일자에 따른 예약건수 캘린더에 입력 넣기
                 dayClick: function(date) {
                    console.log('Clicked on: ' + date.format());
                 },
                 eventClick: function(calEvent, jsEvent, view){ 
                  console.log('click', calEvent.start);
                  //alert(calEvent.start);
                  selectDate = calEvent.start;
                  goResList(calEvent.start);

                  //========================수민========================
	  				if(prevObj) {
                     prevObj.css('background-color', '#5969FF');
                     prevObj.css('font-weight', '400');
                     $(this).css('background-color', '#191970');
                     $(this).css('font-weight', '900');
      
                  } else {
                     $(this).css('background-color', '#191970');
                     $(this).css('font-weight', '900');
                  }
      
                  prevObj = $(this);


			//=====================================================
                }
            });

            
            // 전달 버튼을 클릭하였을 경우
              $("button.fc-prev-button").click(function() {
                  var date = $("#calendar").fullCalendar("getDate");
                  convertDate(date);
                  var date2 = parseInt(convertDate(date));
               console.log(date2);
               fn_get_events(date2);
               chartDraw();
              });

              // 다음달 버튼을 클릭하였을 경우
              $("button.fc-next-button").click(function() {
                  var date = $("#calendar").fullCalendar("getDate");
                  convertDate(date);
                  var date2 = parseInt(convertDate(date));
               //console.log(date2);
               fn_get_events(date2);
               chartDraw();
              });

              // today 버튼을 클릭하였을 경우
              $("button.fc-today-button").click(function() {
                  var today = new Date();
                  var date = $("#calendar").fullCalendar("getDate");
                  convertDate(date);
                  var date2 = parseInt(convertDate(date));
               //console.log(date2);
               fn_get_events(date2);
               chartDraw();
               goResList(today);
              });


  			
              lookUp();
              
           }); //$(document).ready(function(){ 끝


			// 조회 버튼 클릭 시
           function lookUp(){
               //alert("조회");
               chartDraw();
	               var date = $("#calendar").fullCalendar("getDate");
	               convertDate(date);
	             var date2 = parseInt(convertDate(date));
	            //console.log(date2);
	            fn_get_events(date2);
	            //alert("date = " + convertDate(date))
	            
	            goResList(date2);
           }
           
           
              // 받은 날짜값을 date 형태로 형변환
              function convertDate(date) {
                  var date = new Date(date);
                  //console.log(date.yyyymmdd());
                  return date.yyyymmdd();
              }
              
              Date.prototype.yyyymmdd = function() {
                  var yyyy = this.getFullYear().toString();
                  var mm = (this.getMonth() + 1).toString();
                  var dd = this.getDate().toString();
                  return (mm[1] ? mm : "0" + mm[0]);
              }

              
              var tempCal;

                
              function fn_get_events(current_month){
		              if(tempCal != null){
		                 $('#calendar').fullCalendar('removeEventSource',tempCal);
		              }
		             var m;
		             if(current_month>0){
		                m = current_month;
		             }else{
		              var date = new Date();
		              m = date.getMonth()+1;
		              }
		              var user_id = $('[name=user_id]').val();
		              var data = $("[name=resForm]").serialize() + "&month="+m+"&user_id="+user_id
		             
		              console.log(data);  

		             // alert(data) 
		              
		              $.ajax({
		                 url: '/posbis/resCntProc.do' 
		                 ,Type: "post" 
		                 ,data : data
		                 ,dataType:"json"
		                 ,success : function(data){
			                   // console.log("#@# === " + data.data.length);
			                   //alert("아아아아 = = =" + data.data);
			                tempCal = data.data;
			                 $('#calendar').fullCalendar('addEventSource',data.data);
		                 }
		                 
		                 ,error:function(request,status,error){
		                      console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                  }
		              }); 
               
           		 }

//----------------------------------------------------------------------------------------------------------------------------
            // 받은 날짜값을 date 형태로 형변환 해주어야 한다.
              function convertDate2(date) {
                  var date = new Date(date);
                  //console.log(date.yyyymmdd());
                  return date.yyyymmdd2();
              }
              
              Date.prototype.yyyymmdd2 = function() {
                  var yyyy = this.getFullYear().toString();
                  var mm = (this.getMonth() + 1).toString();
                  var dd = this.getDate().toString();
                  return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
              }

              var checkdata;

              
              
               function goResList(date) {
	               // 날짜 클릭시 예약 목록 불러올 함수 넣기
	               //alert("goResList"+date);
	               console.log(convertDate2(date));

	               
	
	               var res_date = convertDate2(date);
	               
	                var user_id = $('[name=user_id]').val();
	                
	                var data = $("[name=resForm]").serialize()  + "&res_date="+res_date
	                
	                //alert(data) 
		               
	                if(checkdata != null){
	                   $('#resList > tbody') .empty();
	                }
	                   
	               $.ajax({
	                   url: '/posbis/resListProc.do' 
	                   ,Type: "post" 
	                   ,data : data
	                   ,dataType:"json"
	                   ,success : function(data){
	                      	                      
	                      checkdata = data.data;
	                     for(var i=0; i<data.data.length; i++){
	                        console.log("#@#  ====== " +data.data[i]["res_date"].substr(0,10).toString());
	                        
	                        var t = "'"+data.data[i]["res_date"].substr(0,10).toString()+"'";
                           var time = "'"+data.data[i]["res_time"].toString()+"'";
                           
                           // 예약현황이 normal 이면 버튼 두개 보여줌.            
                           if(data.data[i]["res_result"]=='normal'){
                               //alert("1")
                              $('#resList > tbody').append(
                                     '<tr style="cursor:pointer" >'+
                                              <!-- 순서번호 -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');" >'+(i+1)+'</td>' +
                                              <!-- 각 행의 가게 이름 출력 -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["business_name"]+'</td>'+
                                              <!-- 각 행의 예약자 이름 출력 -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_name"]+'</td>'+
                                              <!-- 각 행의 예약날짜 출력  -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_date"]+'</td>'+
                                              <!-- 각 행의 예약시간 출력  -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_time"]+'</td>'+
                                              <!-- 각 행의 예약자 인원수 출력  -->
                                              '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_guest"]+'</td>'+
                                              <!-- 각 행의 예약자 휴대폰번호 출력  -->
                                             '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_phone"]+'</td>'+
                                             <!-- 각 행의 예약현황 출력  -->
                                             '<td align=center ><input type=button  value=방문 style="width:50px; height:35px; font-size:20" onClick="changeSuccess('+data.data[i]["r_no"]+', '+t+','+time+');">&nbsp;<input type=button  value=노쇼 style="width:50px; height:35px; font-size:20" onClick="changeNoshow('+data.data[i]["r_no"]+', '+t+','+time+');">'+'</td>'+
                                             <!-- 각 행의 비고란 내용 출력  -->
                                             '<td align=center onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+data.data[i]["res_text"]+'</td>'+
          
                                     '</tr>'
                                  );

                          }
	                        else{
		                        //alert("2")
		                        
		                         if(data.data[i]["res_result"]=='success'){
			                        $('#resList > tbody').append(
			                           '<tr style="cursor:pointer" onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+
			                                    <!-- 순서번호 -->
			                                    '<td align=center >'+(i+1)+'</td>' +
			                                    <!-- 각 행의 가게 이름 출력 -->
			                                    '<td align=center >'+data.data[i]["business_name"]+'</td>'+
			                                    <!-- 각 행의 예약자 이름 출력 -->
			                                    '<td align=center >'+data.data[i]["res_name"]+'</td>'+
			                                    <!-- 각 행의 예약날짜 출력  -->
			                                    '<td align=center >'+data.data[i]["res_date"]+'</td>'+
			                                    <!-- 각 행의 예약시간 출력  -->
			                                    '<td align=center >'+data.data[i]["res_time"]+'</td>'+
			                                    <!-- 각 행의 예약자 인원수 출력  -->
			                                    '<td align=center >'+data.data[i]["res_guest"]+'</td>'+
			                                    <!-- 각 행의 예약자 휴대폰번호 출력  -->
				                                '<td align=center >'+data.data[i]["res_phone"]+'</td>'+
				                                <!-- 각 행의 예약현황 출력  -->
				                                '<td align=center >방문완료</td>'+
				                                <!-- 각 행의 비고란 내용 출력  -->
				                                '<td align=center >'+data.data[i]["res_text"]+'</td>'+
			
			                           '</tr>'
			                        );
		                         }
		                         else{
		                        	 $('#resList > tbody').append(
			                           '<tr style="cursor:pointer" onClick="goResUpDelForm('+data.data[i]["r_no"]+', '+t+');">'+
			                                    <!-- 순서번호 -->
			                                    '<td align=center >'+(i+1)+'</td>' +
			                                    <!-- 각 행의 가게 이름 출력 -->
			                                    '<td align=center >'+data.data[i]["business_name"]+'</td>'+
			                                    <!-- 각 행의 예약자 이름 출력 -->
			                                    '<td align=center >'+data.data[i]["res_name"]+'</td>'+
			                                    <!-- 각 행의 예약날짜 출력  -->
			                                    '<td align=center >'+data.data[i]["res_date"]+'</td>'+
			                                    <!-- 각 행의 예약시간 출력  -->
			                                    '<td align=center >'+data.data[i]["res_time"]+'</td>'+
			                                    <!-- 각 행의 예약자 인원수 출력  -->
			                                    '<td align=center >'+data.data[i]["res_guest"]+'</td>'+
			                                    <!-- 각 행의 예약자 휴대폰번호 출력  -->
				                                '<td align=center >'+data.data[i]["res_phone"]+'</td>'+
				                                <!-- 각 행의 예약현황 출력  -->
				                                '<td align=center >노쇼</td>'+
				                                <!-- 각 행의 비고란 내용 출력  -->
				                                '<td align=center >'+data.data[i]["res_text"]+'</td>'+
			
			                           '</tr>'
			                        );
			                     }
	                        }
	                     }
	                        
	                     //console.log(data.data);
	                   }
	                   ,error:function(request,status,error){
	                        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                    }
	                }); 
	
	            }


//----------------------------------------------------------------------------------------------------------------------------

               // 확인 버튼 클릭 시
                  function changeSuccess(number, res_date, res_time){
                  //alert("1");
                  var data = "&r_no="+number;
            
                      var now_date = new Date();
                    
                      //alert(data);
                      //alert(res_date);
                      //alert(now_date);
                      //alert(res_time);

                  var yyyy = res_date.substr(0,4);
                  var mm = res_date.substr(5,2);
                  var dd = res_date.substr(8,2);
                      var hh =  res_time.substr(3,2);
                      var mi = res_time.substr(6,2);

                      //alert(yyyy+mm+dd+hh+mi);
                      if(res_time.substr(0,2)=='오후' && hh != '12'){
                     hh = hh*1;
                         hh = hh+12;
                      }
                      //alert(yyyy+mm+dd+hh+mi);
                  res_date = new Date(yyyy, mm-1, dd, hh, mi);

                      //alert(res_date);
                      if( res_date > now_date){
                     alert("예약 시간이 지난 후 현황 선택이 가능합니다.");
                     //alert("res_date==>  "+res_date);
                     //alert("now_date==>  "+now_date);
                       }else{
                      

                            if(confirm("확인 완료 하시겠습니까?")==false) {
                            return;
                         }
                          else{
                         
                           $.ajax({
                               url: '/posbis/changeSuccessProc.do' 
                               ,Type: "post" 
                               ,data : data
                               ,dataType:"json"
                               ,success : function(updateChangeSuccess){
                                                           
                                //alert("조회");
                                   chartDraw();
                                     var date = $("#calendar").fullCalendar("getDate");
                                     convertDate(date);
                                     var date2 = parseInt(convertDate(date));
                                   //alert(date2);
                                   fn_get_events(date2);
                                   //alert(selectDate);
                                   goResList(selectDate);
         
                               }
                               ,error:function(request,status,error){
                                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                }
                            });
                         }
                           
                        }
                 }

               // 노쇼 버튼 클릭 시
                  function changeNoshow(number, res_date, res_time){
                     var data = "&r_no="+number;
                     // alert(data);

                      var now_date = new Date();
                       
                         //alert(data);
                         //alert(res_date);
                         //alert(now_date);
                         //alert(res_time);

                     var yyyy = res_date.substr(0,4);
                     var mm = res_date.substr(5,2);
                     var dd = res_date.substr(8,2);
                         var hh =  res_time.substr(3,2);
                         var mi = res_time.substr(6,2);

                         //alert(yyyy+mm+dd+hh+mi);
                         if(res_time.substr(0,2)=='오후'  && hh != '12'){
                        hh = hh*1;
                            hh = hh+12;
                         }
                         //alert(yyyy+mm+dd+hh+mi);
                     res_date = new Date(yyyy, mm-1, dd, hh, mi);

                         //alert(res_date);
                         if( res_date > now_date){
                        alert("예약 시간이 지난 후 현황 선택이 가능합니다.");
                          }else{
                     
                     
                               if(confirm("노쇼로 등록하시겠습니까?")==false) {
                               return;
                            }
                            else{
                            
                              $.ajax({
                                  url: '/posbis/changeNoshowProc.do' 
                                  ,Type: "post" 
                                  ,data : data
                                  ,dataType:"json"
                                  ,success : function(updateChangeNoshow){
                                                              
                                   //alert("조회");
                                      chartDraw();
                                        var date = $("#calendar").fullCalendar("getDate");
                                        convertDate(date);
                                        var date2 = parseInt(convertDate(date));
                                      //console.log(date2);
                                      fn_get_events(date2);
                                      goResList(selectDate);
            
                                  }
                                  ,error:function(request,status,error){
                                       console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                   }
                               });
                            }
                           }
                   }
                   

            // 예약하기 팝업 띄우기
               function wrapWindowByMask(){

            	   //시연 데이터 넣기
                   $('[name=pop_businessNo]').val("543-21-54321");
                    $('[name=res_name]').val("홍길동");
                    $('[name=res_year]').val("2020");
                    $('[name=res_month]').val("02");
                    $('[name=res_day]').val("29");
                    $('[name=res_time]').val("15:00");
                    $('[name=res_guest]').val("3");
                    $('[name=phone1]').val("010");
                    $('[name=phone2]').val("1234");
                    $('[name=phone3]').val("5678");
                   
                   
                   //화면의 높이와 너비를 구한다.
                   var maskHeight = $(document).height();  
                   var maskWidth = $(window).width();
                   var popupX = (window.screen.width / 2) - (500 / 2);
                 // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
      
                  var popupY= (window.screen.height / 2) - (500 / 2);
                 // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
                 
                   //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
                   $("#mask").css({"width":maskWidth,"height":maskHeight});
            
                   //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
                   $("#mask").fadeIn(0);      
                   $("#mask").fadeTo("slow",0.6);    
   
                   $(".window").css({"left":popupX+"px"});
	               $(".window").css({"top":popupY+"px"});
	               $('#reg_button').show();

	               //(수정 및 추가) 
	               $('#upDel_button').hide();
	               $('.reg_business').show();
	               $('#reg_obj').show();
	               $('#upDel_obj').hide();
	               //(수정 및 추가 끝)
            
                   //윈도우 같은 거 띄운다.
                   $(".window").show();
         
               }

             // 예약하기 화면에서 예약 클릭시 유효성 체크 및 예약등록
             function checkReservation(){

 				// (수정) name변경
	            var business_no = $('[name=pop_businessNo]').val();
				// 변경끝
	            
	            var user_id = $('[name=user_id]').val();
	            var res_name = $('[name=res_name]').val();
	            var res_year = $('[name=res_year]').val();
	            var res_month = $('[name=res_month]').val();
	            var res_day = $('[name=res_day]').val();
	            var res_guest = $('[name=res_guest]').val();
	            var res_text = $('[name=res_text]').val();
	            var phone1 = $('[name=phone1]').val();
	            var phone2 = $('[name=phone2]').val();
	            var phone3 = $('[name=phone3]').val();
	            var res_date = res_year+res_month+res_day
	            var res_time = res_date+" "+$('[name=res_time]').val();
	            var res_phone = phone1+"-"+phone2+"-"+phone3
            
          		//(수정) data 위치변경
          		//var data = "business_no="+business_no+"&user_id="+user_id+"&res_name="+res_name+"&res_date="+res_date+"&res_time="+res_time+"&res_guest="+res_guest+"&res_phone="+res_phone+"&res_text="+res_text;

	            //지난 일정 체크
	            var date= new Date();
	            var year = date.getFullYear();   
	            var month = date.getMonth()+1;     
	            var date = date.getDate();

	            if((res_year==year)&&(res_month<=month)&&(res_day<date)){
	                 alert("지난 일정은 예약할 수 없습니다.");
	                 //(수정) 지난 일정 예약시 value 변경
	                 $("[name=res_year]").val("");
	                 $("[name=res_month]").val("");
	                 $("[name=res_day]").val("");
	                 //(수정 끝)
	                 return;
	            }
	         	   // (추가 및 수정) 유효성 검사 순서 및 추가
	               if(is_empty("[name=pop_businessNo]")){
	                   alert("사업자번호를 선택해주세요.");
	                   $("[name=pop_businessNo]").focus();
	                   return;
	               }// (추가 끝)
	            
	               if(is_empty("[name=res_name]")){
	                   alert("예약자 이름을 입력해주세요.");
	                   $("[name=res_name]").focus();
	                   return;
	               }
	               if(is_empty("[name=res_year]")){
	                    alert("예약년도 입력해주세요.");
	                    $("[name=res_year]").focus();
	                    return;
	               }
	               if(is_empty("[name=res_month]")){
	                    alert("예약월을 입력해주세요");
	                    $("[name=res_month]").focus();
	                    return;
	               }
	               if(is_empty("[name=res_day]")){
	                    alert("예약일자를 입력해주세요");
	                    $("[name=res_day]").focus();
	                    return;
	               }
	               if(is_empty("[name=res_time]")){
	                   alert("예약시간을 입력해주세요");
	                   $("[name=res_time]").focus();
	                   return;
	               }
	               if(is_empty("[name=res_guest]")){
	                  alert("인원수를 입력해주세요.");
	                  $("[name=res_guest]").focus();
	                  return;
	               }
	               if (is_valid_pattern($("[name=res_guest]"), /^[0-9]{1,15}$/)==false){
		           		alert("인원수 숫자 입력 바랍니다."); 
		           		$("[name=res_guest]").val("");
		           		$("[name=res_guest]").focus();
		           	 	return;
				   }
	               if(is_valid_pattern($("[name=phone1]"),/^(010|011|016|017|019)$/)==false){
	            	   alert("올바른 번호 입력 바랍니다."); 
	            	   $("[name=phone1]").focus();
	            	   return;
	               }
	               if(is_valid_pattern($("[name=phone2]"),/^[0-9]{3,4}$/)==false){
	            	   alert("올바른 번호 입력 바랍니다."); 
	            	   $("[name=phone2]").focus();
	            	   return;
	               }
	               
	               if(is_valid_pattern($("[name=phone3]"),/^[0-9]{4}$/)==false){
	            	   alert("올바른 번호 입력 바랍니다."); 
	            	   $("[name=phone3]").focus();
	            	   return;
	               }
	               if(confirm("예약 하시겠습니까?")==false) {return;}
	               // (추가끝)
	  	           var data = "business_no="+business_no+"&user_id="+user_id+"&res_name="+res_name+"&res_date="+res_date+"&res_time="+res_time+"&res_guest="+res_guest+"&res_phone="+res_phone+"&res_text="+res_text;
	 	                              

                $.ajax({
                  // 서버 쪽 호출 URL 주소 지정
                  url : "/posbis/resRegProc.do"
                     
                  // 전송 방법 설정
                  , type : "post"
                     
                  // 서버로 보낼 파라미터명과 파라미터값을 설정
                  
                  , data : data
                  
                  , success : function(resRegCnt){

                     if(resRegCnt==1){
                        alert(res_name+"님 예약이 완료되었습니다.");
                        location.replace("/posbis/resManagerForm.do");
                     }
                  // [메뉴 등록 행 적용 개수]가 1개가 아니면 경고하기
                     else{
                        alert("예약 등록 실패! 관리자에게 문의 바랍니다.");
                     }
                  }
                  // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
                  , error : function(){
                     alert("서버 접속에 실패하였습니다.");
                  }
               });

                }

          // (수정 및 추가) 예약내역 상세 보기 띄우기
          // 예약내역 상세보기 및 수정삭제까지 모두 수정
             function goResUpDelForm(r_no, res_date){
                 console.log(res_date);
                 var user_id = $('[name=user_id]').val();

                 var data = "r_no="+r_no+"&user_id="+user_id+"&res_date="+res_date;

                 //console.log(typeof(r_no));
                 //console.log(typeof(user_id));
                 //console.log(typeof(res_date));
                 //console.log("goResUpDelForm====>" + data);
                 
                     $.ajax({
                       // 서버 쪽 호출 URL 주소 지정
                       url : "/posbis/resUpDelForm.do"
                          
                       // 전송 방법 설정
                       , type : "post"
                          
                       , data : data
                       
                       , success : function(data){
						  
	     	               	  var phone = data.data[0]['res_phone']
	     	               			phone = phone.split("-");
	     	                  var date = data.data[0]['res_date']
	     	                  		date = date.split("-");
	
	                   		 
	                     	  var time1 = data.data[0]['res_time']
	                     	  	  time1 = time1.substring(0,2)
	                     	  var time2 = data.data[0]['res_time']
	                     			time2 = time2.substring(3,5)
	                     	  var time3 = data.data[0]['res_time']
	               					time3 = time3.substring(6,8)
	               					
	     	          			if(time1=='오후'){
	     	                        	time2 = time2 * 1
	     	     						time2 = 12+time2
	     	                    }
	                     	  var reser_time = time2 + ':' + time3
	
	
	     	                  //화면의 높이와 너비를 구한다.
	     	                   var maskHeight = $(document).height();  
	     	                   var maskWidth = $(window).width();
	     	                   var popupX = (window.screen.width / 2) - (500 / 2);
	     	                   // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	     	      
	     	                   var popupY= (window.screen.height / 2) - (500 / 2);
	     	                   // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	     	                 
	     	                   //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	     	                   $("#mask").css({"width":maskWidth,"height":maskHeight});
	     	            
	     	                   //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
	     	            
	     	                   $("#mask").fadeIn(0);      
	     	                   $("#mask").fadeTo("slow",0.6);    
	     	   
	     	                   $(".window").css({"left":popupX+"px"});
	     		               $(".window").css({"top":popupY+"px"});
	
	     		               $('#r_no').val(data.data[0]['r_no'])
	     	                   $('#res_name').val(data.data[0]['res_name']);
	     	                   $('#res_guest').val(data.data[0]['res_guest']);
	     	                   $('#res_text').val(data.data[0]['res_text']);
	     	                   $('#phone1').val(phone[0]);
	     	                   $('#phone2').val(phone[1]);
	     	                   $('#phone3').val(phone[2]);
	     	                   $('[name=res_year]').val(date[0]);
	     	                   $('[name=res_month]').val(date[1]);
	     	                   $('[name=res_day]').val(date[2]);
	     	                   $('[name=res_time]').val(reser_time);
	     	                   $('#reg_button').hide();
	     	                   $('.reg_business').hide();
	     	                   $('#upDel_button').show();
	     		               $('#reg_obj').hide();
	     		               $('#upDel_obj').show();
	     	                   $(".window").show();
	     	                   
	     	              }
	                           
                           
                       , error : function(){
                          alert("서버 접속에 실패하였습니다.");
                          
                       }
                  });
              }
     		
             // (추가)예약내역 수정 및 삭제
             function upDelReservation(upDel){

     			var r_no = $('#r_no').val();
                 var user_id = $('[name=user_id]').val();
                 var res_name = $('[name=res_name]').val();
                 var res_year = $('[name=res_year]').val();
                 var res_month = $('[name=res_month]').val();
                 var res_day = $('[name=res_day]').val();
                 var res_guest = $('[name=res_guest]').val();
                 var res_text = $('[name=res_text]').val();
                 var phone1 = $('[name=phone1]').val();
                 var phone2 = $('[name=phone2]').val();
                 var phone3 = $('[name=phone3]').val();
                 var res_date = res_year+res_month+res_day
                 var res_time = res_date+" "+$('[name=res_time]').val();
                 var res_phone = phone1+"-"+phone2+"-"+phone3
                 var date= new Date();
                 var year = date.getFullYear();   
                 var month = date.getMonth()+1;     
                 var date = date.getDate();

                 console.log(upDel);
                 
     			if(upDel=='del'){
     				$("[name=upDel]").val("del");
     				if(confirm("정말 삭제 하시겠습니까?")==false) {return;}
     				
     			}else if(upDel=='up'){
	     	          if(is_empty("[name=res_name]")){
	     	              alert("예약자 이름을 입력해주세요.");
	     	              $("[name=res_name]").focus();
	     	              return;
	     	          }
	     	          if(is_empty("[name=res_year]")){
	     	               alert("예약년도 입력해주세요.");
	     	               $("[name=res_year]").focus();
	     	               return;
	     	          }
	     	          if(is_empty("[name=res_month]")){
	     	               alert("예약월을 입력해주세요");
	     	               $("[name=res_month]").focus();
	     	               return;
	     	          }
	     	          if(is_empty("[name=res_day]")){
	     	               alert("예약일자를 입력해주세요");
	     	               $("[name=res_day]").focus();
	     	               return;
	     	          }
	     	          if(is_empty("[name=res_time]")){
	     	              alert("예약시간을 입력해주세요");
	     	              $("[name=res_time]").focus();
	     	              return;
	     	          }
	     	          if(is_empty("[name=res_guest]")){
	     	             alert("인원수를 입력해주세요.");
	     	             $("[name=res_guest]").focus();
	     	             return;
	     	          }
	     	          if (is_valid_pattern($("[name=res_guest]"), /^[0-9]{1,15}$/)==false){
	     	          		alert("인원수 숫자 입력 바랍니다."); 
	     	          		$("[name=res_guest]").val("");
	     	          		$("[name=res_guest]").focus();
	     	          	 	return;
	     			   }
	     	          if(is_valid_pattern($("[name=phone1]"),/^(010|011|016|017|019)$/)==false){
	     	       	   alert("올바른 번호 입력 바랍니다."); 
	     	       	   $("[name=phone1]").focus();
	     	       	   return;
	     	          }
	     	          if(is_valid_pattern($("[name=phone2]"),/^[0-9]{3,4}$/)==false){
	     	       	   alert("올바른 번호 입력 바랍니다."); 
	     	       	   $("[name=phone2]").focus();
	     	       	   return;
	     	          }
	     	          
	     	          if(is_valid_pattern($("[name=phone3]"),/^[0-9]{4}$/)==false){
	     	       	   alert("올바른 번호 입력 바랍니다."); 
	     	       	   $("[name=phone3]").focus();
	     	       	   return;
	     	          }
	     	          if(confirm("수정 하시겠습니까?")==false) {
							return;
	     	          }

      			}
     			
      	           var data = "upDel="+upDel+"&r_no="+r_no+"&res_name="+res_name+"&res_date="+res_date+"&res_time="+res_time+"&res_guest="+res_guest+"&res_phone="+res_phone+"&res_text="+res_text;

                $.ajax({
                  // 서버 쪽 호출 URL 주소 지정
                  url : "/posbis/resUpDelProc.do"
                    
                  // 전송 방법 설정
                  , type : "post"
                     
                  // 서버로 보낼 파라미터명과 파라미터값을 설정
                  , data : data
                  
                  , success : function(upDelCnt){
                 	 if(upDel=='up'){
     						if(upDelCnt==1){
     						alert(res_name+"님 예약내역 수정이 완료되었습니다.");
     							location.replace("/posbis/resManagerForm.do");
     						}else{
     							alert("서버쪽 DB 연동 실패!");
     						}
     					}else if(upDel=='del'){
     						if(upDelCnt==1){
     						alert(res_name+"님 예약이 삭제되었습니다.");
     						location.replace("/posbis/resManagerForm.do");
     						}else{
     							alert("서버쪽 DB 연동 실패!");
     						}
     					}
                  }
                  // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
                  , error : function(request,status,error){
                     alert("서버 접속에 실패하였습니다.");
                     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  }
               });
     		  
     	      // console.log("updel======>"+ data);
             }

 			// 수정 및 추가끝
		


           //===========================================================================================수민
             function chartDraw(){

            	 var date = $("#calendar").fullCalendar("getDate");
                 convertDate(date);
                 
                 var res_date = convertDate2(date);
                 var user_id = $('[name=user_id]').val();
                 var business_no = $('[name=business_no]').val();
                 var data = $("[name=resForm]").serialize() + "&user_id=" + user_id + "&res_date="+res_date

					//alert(data);
                 
                 $.ajax({
                     url: '/posbis/noShowChartProc.do' 
                     ,Type: "post" 
                     ,data : data
                     //,dataType:"json"
                     ,success : function(noShowChartMap){

                         var res_all_cnt = parseInt(noShowChartMap.res_all_cnt);
                         var no_show_cnt = parseInt(noShowChartMap.no_show_cnt);
                         var res_guest = parseInt(noShowChartMap.res_guest);
                         var no_show_guest = parseInt(noShowChartMap.no_show_guest);
                         var res_date = noShowChartMap.res_date;
                         
                         //alert(res_all_cnt);
                         //alert(no_show_cnt);
                         //alert(res_guest);
                         //alert(no_show_guest);
                         //alert(res_date);
                         
                         //alert(typeof(res_all_cnt));

                         	
							$("#chart_div").remove();
							$("#chart_div2").remove();
							
							$("#tdComment1").empty();
							$("#tdComment2").empty();
							$("#title").empty();
							$("#noRes").empty();

	                         if(res_all_cnt >=0 ){
								
							$("#title").append('<h1 style="font-size:35;margin:33 0 36 0">[ 완료된 예약 노쇼 현황 ]</h1>');
							$("#tdChart1").append('<div id="chart_div" style="width: 100%; height: 100%;"></div>');
							$("#tdComment1").append('<h1 style="font-size:30">'+res_date+'<br><br>예약완료(건) : '+res_all_cnt+'건<br><br>노&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쇼(건)&nbsp;: '+no_show_cnt+'건</h1>');
							$("#tdChart2").append('<div id="chart_div2" style="width: 100%; height: 100%;"></div>');
							$("#tdComment2").append('<h1 style="font-size:30">'+res_date+'<br><br>예약완료(명) : '+res_guest+'명<br><br>노&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쇼(명)&nbsp;: '+no_show_guest+'명</h1>');

							
							
                         google.charts.load('current', {'packages':['gauge']});
                         google.charts.setOnLoadCallback(drawChart);

                         function drawChart() {

                           var data = google.visualization.arrayToDataTable([
                             ['Label', 'Value'],
                             ['', { v: Math.round((no_show_cnt/res_all_cnt)*100), f: Math.round((no_show_cnt/res_all_cnt)*100)+'%' }]			//예약 건 수/ 예약 인원 수, value
                           ]);
                           
                           var data2 = google.visualization.arrayToDataTable([
                               ['Label', 'Value'],
                               ['', { v: Math.round((no_show_guest/res_guest)*100), f: Math.round((no_show_guest/res_guest)*100)+'%' }]			//예약 건 수/ 예약 인원 수, value
                           ]);

  
                           var options = {
                             width: 500, height: 300,
                             redFrom: 75, redTo: 100, //노쇼비율 70~100%은 적색으로 지정
                             yellowFrom:25, yellowTo: 75, //노쇼비율 20~70%은 황색으로 지정
                             greenFrom:0, greenTo: 25,	//노쇼비율 0~20%은 녹색으로 지정
                             minorTicks: 5,	//눈금 표시선
                             min:0, max:100	//max값은 전체 예약건수 or 인원수
                             };
                           
                           var options2 = {
                             width: 500, height: 300,
                             redFrom: 75, redTo: 100, //노쇼비율 70~100%은 적색으로 지정
                             yellowFrom:25, yellowTo: 75, //노쇼비율 20~70%은 황색으로 지정
                             greenFrom:0, greenTo: 25,	//노쇼비율 0~20%은 녹색으로 지정
                             minorTicks: 5,	//눈금 표시선
                             min:0, max:100	//max값은 전체 예약건수 or 인원수
                           };

                           

                           var chart = new google.visualization.Gauge(document.getElementById('chart_div'));
	           			      var chart2 = new google.visualization.Gauge(document.getElementById('chart_div2'));

                           chart.draw(data, options);
	        			   chart2.draw(data2, options2);
                         }

						}else{
							$("#title").append('<h1 style="font-size:35;margin:33 0 36 0">[ 완료된 예약 노쇼 현황 ]</h1>');
							$("#noRes").append('<h1 style="font-size:30">해당 월은 완료된 예약이 없습니다.');
						}

                       }
                     ,error:function(request,status,error){
                          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                      }
                  }); 
	            }
	            //창 크기 조절 시 차트그리기 재실행
 		    $(window).resize(function(){
 		    	chartDraw();
 		    });

             //==================================================================================수민 끝
 		  
 		  	
 		  	 
   

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
               //예약관리
                function goResManagerForm(){
                    //alert("예약관리로 이동");
                    location.replace("/posbis/resManagerForm.do");
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

      </script>
      
   </head>

<body>
<!-- (수정) 팝업창 마스크 위치 변경 -->
<div id="mask"></div>
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
            
            <li><a style="color:#fff; cursor:pointer; font-size:20; margin:0 55 4 0">매장관리</a>
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
               <a class="active" style="cursor:pointer; font-size:20; margin:0 55 4 0">예약관리</a>
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
   <section class="page-top-section set-bg" data-setbg="resources/bootstrap/img/page-top-bg/revBg.jpg">
      <div class="container"  style="margin: -25px 0 0 250px;">
         <h2 style="font-size:65px"><strong>예약목록</strong></h2>
         <div style=" color:#fff; width:30%">
         <nav class="site-breadcrumb">
               <span class="sb-item active" style="font-size:20px">
            <i class="fas fa-calendar-check"></i> 예약관리 > </span><span class="sb-item active" style="font-size:20px">
            <i class="fas fa-list-alt"></i> 예약목록</span>
            </nav>
         </div>
      </div>
   </section>
   <!-- Page top Section end -->

  
<!--==========================
      예약관리
    ============================-->
<main id="main">
<section id="main-content">
<section class="wrapper">
     <div class="col-lg-11" align="center">
          <section class="panel">
          <header class="panel-heading" style="background-color:#7f9ed436;">
                    <font color="#39485f">예약관리</font>
            </header>
             <div class="panel-body">
         
                <!-- ============================================================== -->
                <!-- events calendar -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                           <!-- 사업자 번호 선택 -->
                           <div style="width:100%; height:7%;">
	                          <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                           <!-- 사업자 번호 선택 -->
                           <form name="resForm" method="post" action="/posbis/resManagerForm.do">
                           <div style="width:70%; height:10%; text-align:left;margin:30 0 30 70; float:left">
	                          
	                          
	                          <%-- <select id="select_business_no" name=business_no style="width:200px;height:25px; text-align-last: center">   <!-- 중요! -->
	                            <option value="">사업자 번호를 선택해주세요
	                            <c:forEach items="${businessNoList}" var="businessNoList">
	                                 <option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
	                                 </option>
	                           </c:forEach>
	                           
		                        </select> --%>
		                        
		           <%--              
		                        <table><tr><td style="color:#330066">
					               [ 사업자 번호 ]&nbsp; : &nbsp;
					                  <td><input type = "checkbox" name="chooseAllBusinessNo"> 모두선택
					               <tr><td>
					            <c:forEach items="${businessNoList}" var="businessNoList" varStatus="status">
					              <td><input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
					                    <c:if test="${(status.index+1)%3!=0}">
					                     <c:if test="${!status.last }">
					                        <td width="40">
					                     </c:if>
					                    </c:if>
					                    <c:if test="${(status.index+1)%3==0}">
					                     <c:if test="${!status.last }">
					                        <tr><td>
					                     </c:if>
					                  </c:if>   
					            </c:forEach>
					            </table>
									             --%>
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
		                        
		                        
		                     </div>
		                     <div style="width:20%; height:10%; float:right; margin:63 70 0 0">
		                    	 <input type=button  value=조회 style="width:110px; height:45px; font-size:25" onClick="lookUp();">
		                    	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    	<input type="button"  value="예약" style="width:110px; height:45px; font-size:25" onClick="wrapWindowByMask();">
		                    </div>
		                    </form>
		                     <br>
		                     </div>
                     
                     <!-- 달력 및 예약내역 form -->
                            <div class="card-body">
                                <div id='wrap' class='cal'>
                                   <form id="resManager" >
                                    
                                    <!-- 달력 -->
                                    <div id='calendar' style="width:50%; float:left; margin:28 0 0 47"></div> 
                                    
                                    <!-- 차트 -->
									<div style="width:45%; float:right;">
										<table id="chartTable">
												<tr align="center"><td colspan="3" id="title">
												<tr align="center">
														<td style="width: 50%; height: 15%;" id="tdChart1">
															<div id="chart_div" style="width: 100%; height: 100%;"></div>
														<td>&nbsp;&nbsp;
														<td id="tdComment1" align="left">
														<br>
												<tr align="center">
														<td style="width: 50%; height: 15%;" id="tdChart2">
															<div id="chart_div2" style="width: 100%; height: 100%;"></div>
														<td>&nbsp;&nbsp;
														<td id="tdComment2" align="left">
												<tr align="center"><td id="noRes" colspan="2">
										</table>
									</div>
                                    
                                    
                                    <div style='clear:both'></div>
                                      </form>
                                </div>
                            </div>
                            <br><br>
                            <!-- 예약내역 -->
                            <form name="updateForm" method="post" action="/posbis/resManagerForm.do">
                                    <div style="width:80%; height:600;  margin: -8px; border-top:ridge;">
                                    
                                    	<div style="margin:40 0 50 0">
	                                    <font style="font-size: 27px;; color:#3D405C;">예약내역
	                                    </font>
			                           </div>
			                               <table class="table table-striped table-advance table-hover" id="resList">
			                                 <thead>
			                                 <tr style="background-color:#7f9ed436;">
			                                   <th align=center width="5%"><font color="#39485f">NO</font></th>
			                                   <th align=center width="12%"><font color="#39485f">가게명</font></th>
			                                   <th align=center width="9%"><font color="#39485f">예약자</font></th>
			                                   <th align=center width="12%"><font color="#39485f">예약일자</font></th>
			                                   <th align=center width="9%"><font color="#39485f">예약시간</font></th>
			                                   <th align=center width="5%"><font color="#39485f">인원수</font></th>
			                                   <th align=center width="12%"><font color="#39485f">휴대폰번호</font></th>
			                                   <th align=center width="12%"><font color="#39485f">예약현황</font></th>
			                                   <th align=center width="9%"><font color="#39485f">비고</font></th>
			                                 </tr>
			                                 </thead>
			                              <tbody >
			                              </tbody>
			                              </table>
                                    </div>
                               </form>     
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end events calendar -->
                <!-- ============================================================== -->
               </div>
            </div>
            
            <!-- 예약하기 팝업 -->
         
         <div id ="wrap"> 
              <div id = "container">  
                  <!-- <div id="mask"></div> 위치 변경 -->
                     <form name = "resRegForm" method="post" action="/posbis/resRegProc.do" id ="res_reset"><!-- (추가) id 추가 -->
                     <div class="window">
                         <p style="width:fit-content; height:fit-content; text-align:center;vertical-align:middle; color: aliceblue; font-size:17px;">
                         	<font id="reg_obj">예약하기</font><!-- (추가) id 에 따른 팝업 상단 메세지 뜨도록 추가 -->
                         	<font id="upDel_obj">예약상세보기</font> <!-- (추가) id 에 따른 팝업 상단 메세지 뜨도록 추가 -->
                         <a href="#" class="close" style="color: aliceblue; font-size:30px;">X&nbsp;</a>
                         <table class="popCont">
                          <tr>
                             <th colspan="2">
                        <tr>
                           <th class="reg_business">사업자번호
                           <td><select id="select_business_no" name=pop_businessNo class="reg_business" style="width:373px;height:30px; text-align-last: auto; font-size:17px;">
									<option value="">사업자 번호를 선택해주세요
										<c:forEach items="${businessNoList}" var="businessNoList">
											<option value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name}) 
	                                 		</option>
	                           			</c:forEach>
		                        </select>
		                        
                        <tr>
                           <th>예&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;자&nbsp;
                           <td><input type="text" size="30" maxlength="20" name="res_name" style="height: 25px;" id="res_name"><!-- (추가) id 값 변경 -->
                        <tr>
                           <th>예약&nbsp;&nbsp;&nbsp;일자&nbsp;
                           <td>
                               <select name="res_year" style="width:60px">
                              <option value = "">
                                 <script>
                                 var date=new Date();
                           var year= date.getFullYear();
                           
                              for(var i=year; i<=new Date().getFullYear()+5; i++){
                                 document.write("<option value="+i+">"+i);
                              }
                                 </script>
                              </select>&nbsp;년&nbsp;
                              <select name="res_month" style="width:40px">
                              <option value = "">
                                 <script>
                                    for(var i=1; i<=12; i++){
                                       var m = (i<10)?"0"+i:i;
                                       document.write("<option value="+m+">"+m);
                                    }
                                 </script>
                              </select>&nbsp;월&nbsp;
                              
                              <!-- (추가) 일 selset박스 수정 -->
                              <select name="res_day" style="width:40px; height: 30px;">
	                              <option value = "">
	                                <script>
                                    for(var i=1; i<=30; i++){
                                       var m = (i<10)?"0"+i:i;
                                       document.write("<option value="+m+">"+m);
                                    }
                                 </script> 
                              </select>&nbsp;일&nbsp;
                              
                              <select name="res_time" style="width:74px">
                              <option value = "">
                                 <script>
                                    for (i = 0; i < 48; i++) {
                                        var hour = '';
                                        var min = ':00';

                                        if ((Math.ceil(i / 2)) < 13) {
                                            hour = (Math.floor(i / 2));
                                        } else {
                                            hour = (Math.floor(i / 2));
                                        }
                                        if (i % 2 != 0) {
                                            min = ':30';
                                        }

                                        if(hour<10){
                                          hour = "0" + hour;
                                       }
                                       if(min<10){
                                          min = "0" + min;
                                       }
                                        document.write('<option value=' + hour + min + '>' + hour + min + '</option>');
                                    }   
                                 </script>
                              </select>
                        <tr>
                           <th>인&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;수&nbsp;
                           <td><input type="text" size="28" maxlength="20" name="res_guest" style="height: 25px;" id="res_guest">명<!-- (추가) id 추가 -->
                        <tr>
                           <th>휴대폰번호&nbsp;
                           <td><input type="text" size="30" maxlength="3" name="phone1" style="height: 25px; width:89px" id = "phone1">&nbsp;-&nbsp;<!-- (추가) id 추가 -->
                              <input type="text" size="30" maxlength="4" name="phone2" style="height: 25px; width:89px" id = "phone2">&nbsp;-&nbsp;<!-- (추가) id 추가 -->
                              <input type="text" size="30" maxlength="4" name="phone3" style="height: 25px; width:89px" id = "phone3"><!-- (추가) id 추가 -->
                        <tr>
                           <th>비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;
                           <td><textarea rows="5" cols="35" name= "res_text" maxlength="200" width="200" id="res_text"></textarea> <!-- (추가) id 추가 --> 
                        
                        <!-- (수정)등록 삭제 onClick 다르게 보여지도록 구현 및 호출 함수변경 -->
                        <tr id="reg_button">
                           <th colspan="2"><input type="button" value="등록"  onClick="checkReservation();" style="width:60px; height:30px; float:right; margin: 8 0 18 0;">
                        <tr id="upDel_button">
                           <th colspan="2"><input type="button" value="삭제" onClick="upDelReservation('del');" style="width:60px; height:30px; float:right; margin: 8 0 18 10;">
										   <input type="button" value="수정" onClick="upDelReservation('up');" style="width:60px; height:30px; float:right; margin: 8 0 18 10;">
                           <!-- (수정)input 변경 -->
                           <input type="hidden" name="user_id" value="${user_id}">
                           <input type="hidden" id="r_no" name="r_no">
                     </table>
                         </p>
                         </div>
                       </div>
              </div> 
          </div>
          
          <!-- 예약하기 팝업 끝 -->

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
  
     <!-- 예약관리 부트스트랩 -->
     <script src="resources/pos/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/pos/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="resources/pos/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/moment.min.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/fullcalendar.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/jquery-ui.min.js'></script>
    <script src='resources/pos/assets/vendor/full-calendar/js/calendar.js'></script>
    <script src="resources/pos/assets/libs/js/main-js.js"></script>

</body>
</html>
 