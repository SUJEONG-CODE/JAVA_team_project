<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>시장분석</title>

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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3722b49440c597beb030106d9ed0a40&libraries=services,clusterer,drawing"></script> 

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
 
 
<script>

   
var markers = [];
var customOverlays = [];

   
   
     $(document).ready(function(){

         
        
         //alert("ready!");
         
         //월매출 콤마 넣기
          $(".month_sales").each(function() {
        var num = $(this).text();
        var commaNum = numberWithCommas(num);
        $(this).text(commaNum);
          });
         
   
         
          $('[name=rowCntPerPage]').change(function(){
             goPreSearch();
         }); 
   
          
         //페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입
            $(".pagingNumber").html(
               getPagingNumber(
                  "${preResultAllCnt}"                //검색 결과 총 행 개수
                  ,"${preSearchDTO.selectPageNo}"   //선택된 현재 페이지 번호
                  ,"${preSearchDTO.rowCntPerPage}"   //페이지 당 출력행 개수
                  ,"10"                        //페이지 당 보여줄 페이지번호 개수
                  ,"goPreSearch();"                  //페이지 번호 클릭 후 실행할 자스코드
               )
            ); 
         
   
         
         
         $('[name=business_type_name1]').change(function(){
            getBusinessTypeName2();
            
         }); 
   
         $('[name=addr_gu1]').change(function(){
            getAddrDong1();
            inputData("[name=addr_dong1]","");
         }); 
         
                     
   
         
         inputData("[name=rowCntPerPage]","${preSearchDTO.rowCntPerPage}");
         inputData("[name=selectPageNo]","${preSearchDTO.selectPageNo}");
         inputData("[name=business_type_name1]","${preSearchDTO.business_type_name1}");
          if("${preSearchDTO.business_type_name2}" == null){
            inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
            }else{
               getBusinessTypeName2();
          }
         inputData("[name=addr_gu1]","${preSearchDTO.addr_gu1}");
          inputData("[name=addr_dong1]","${preSearchDTO.addr_dong1}");
          if("${preSearchDTO.addr_dong1}" == null){
           inputData("[name=addr_dong1]","${preSearchDTO.addr_dong1}");
          }else{
             getAddrDong1();
         } 
         inputData("[name=month_sales]","${preSearchDTO.month_sales}");
         inputData("[name=sort]","${preSearchDTO.sort}");






         //================ M A P=====================================================================================
         
          var markerImage_1 = new kakao.maps.MarkerImage(
                 'resources/bootstrap/img/MAPmarker.png',
                 new kakao.maps.Size(30,30), new kakao.maps.Point(15, 15));
          var markerImage_3 = new kakao.maps.MarkerImage(
                 'resources/bootstrap/img/MAPmarker.png',
                 new kakao.maps.Size(50,50), new kakao.maps.Point(25, 25));
          var markerImage_5 = new kakao.maps.MarkerImage(
                 'resources/bootstrap/img/MAPmarker.png',
                 new kakao.maps.Size(80,80), new kakao.maps.Point(40, 40));
          
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
              maxLevel:10,
              level: 8 // 지도의 확대 레벨
          };  


         
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption); 
   

         // 구, 동 검색했을 때
         if( ${preSearchDTO.addr_gu1!=null && preSearchDTO.addr_gu1!=""}){


            
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                 maxLevel:7,
                 minLevel:7,
                 level: 8 // 지도의 확대 레벨
             };  
   
            
            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            
            map.setDraggable(false);   
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            
   
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch("${preSearchDTO.addr_gu1} ${preSearchDTO.addr_dong1}", function(result, status) {
               //alert("${preSearchDTO.addr_gu1}");
                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {
                    //var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                   var imageSrc = 'resources/bootstrap/img/MAPmarker.png', // 마커이미지의 주소입니다    
                      imageSize = new kakao.maps.Size(300, 300), // 마커이미지의 크기입니다
                      imageOption = {offset: new kakao.maps.Point(150,150)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                  
                    
                  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                      markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다
   
                   // 마커를 생성합니다
                      var marker = new kakao.maps.Marker({
                        position: markerPosition,
                        image: markerImage // 마커이미지 설정 
                      });
   
                   // 마커가 지도 위에 표시되도록 설정합니다
                      marker.setMap(map);  
                      
                   // 커스텀 오버레이에 표시할 내용입니다     
                   // HTML 문자열 또는 Dom Element 입니다 
                   var content = '<div class ="label" style="font-size:8;"><span class="left"></span><span class="center" style="font-size:30; align-content: center;">${preSearchDTO.addr_gu1} ${preSearchDTO.addr_dong1}<br><br><div style="align:center; font-size:26">${preResultAllCnt} 점포</div></span><span class="right"></span></div>';
                   
                   // 커스텀 오버레이가 표시될 위치입니다 
                      var position = new kakao.maps.LatLng(result[0].y, result[0].x);  
   
                      // 커스텀 오버레이를 생성합니다
                      var customOverlay = new kakao.maps.CustomOverlay({
                          position: position,
                          content: content   
                      });
   
                      // 커스텀 오버레이를 지도에 표시합니다
                      customOverlay.setMap(map);
   
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(position);
                     if("${preSearchDTO.addr_dong1}"!=null && "${preSearchDTO.addr_dong1}"!=""){
                     map.setLevel(4);
                  }
                    else{map.setLevel(7);}
                }  
                 map.getZoomable(false);
            });  
         }  
   
   
         else if( ${preSearchDTO.addr_gu1==null || preSearchDTO.addr_gu1==""} ){

               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                    maxLevel:10,
                    level: 8 // 지도의 확대 레벨
                };  
   
   
               
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 
               
      
               var positions=[];
               var contents=[];
       
                     
      
               <c:forEach items="${addrGu1List}" var="addrGu" varStatus="Status">
               //alert(${Status.index});
                     // 주소-좌표 변환 객체를 생성합니다
                     var geocoder = new kakao.maps.services.Geocoder();
                     // 주소로 좌표를 검색합니다
                     geocoder.addressSearch("${addrGu.addr_gu1}", function(result, status) {
                            // 정상적으로 검색이 완료됐으면 
                             if (status === kakao.maps.services.Status.OK){
                                   positions.push(
                                       { latlng: new kakao.maps.LatLng(result[0].y, result[0].x) }
                                 );
                                   contents.push(
                                       {addrGu : "<div class ='label' style='font-size:8;'><span class='left'></span><span class='center' style='font-size:20; align-content: center;'>${addrGu.addr_gu1}<br><div style='align:center; font-size:14'>${cntPerGu[Status.index].cntPerGu} 점포</div></span><span class='right'></span></div>" }
                                 );
      
      
      
      
                               <c:if test="${Status.last eq true}">
                                    //alert("success")
      
                                     for (var j = 0; j < positions.length; j ++) {
      
                                            var imageSrc = 'resources/bootstrap/img/MAPmarker.png', // 마커이미지의 주소입니다    
                                                  imageSize = new kakao.maps.Size(130, 130), // 마커이미지의 크기입니다
                                                  imageOption = {offset: new kakao.maps.Point(65,65)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                                        
                                          
                                           // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                                           var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
                                            
                                              
                                              
                                               var marker = new kakao.maps.Marker({
                                                   //map: map, // 마커를 표시할 지도
                                                   position: positions[j].latlng, // 마커를 표시할 위치
                                                   image : markerImage // 마커 이미지 
                                               });
                                              marker.setMap(map);
                                              markers.push(marker);

                                               // 커스텀 오버레이를 생성합니다
                                               var customOverlay = new kakao.maps.CustomOverlay({
                                                   map: map,
                                                   position: positions[j].latlng, 
                                                   content: contents[j].addrGu 
                                               }); 
                                              customOverlay.setMap(map);  
                                              customOverlays.push(customOverlay);
                                     }  //  /마커, 오버레이 찍기 위한 for문 끝 
                                  </c:if>   
                                  geocoder.addressSearch("용산구", function(result, status) {
                                      if (status === kakao.maps.services.Status.OK){
                                         map.setCenter( new kakao.maps.LatLng(result[0].y, result[0].x) );
                                      }
                                  });            
                                       
                             }   //   /검색 성공시 끝 
                     });  //   /주소 검색 끝  
      
      
               </c:forEach>   //   주소찾아서 마커,오버레이찍기 전체 for문 끝
         
                   
         }   



          kakao.maps.event.addListener(map, 'zoom_changed', function() {


             // 줌 레벨에 따라 마커 보이기,안보이기             
             if(map.getLevel()>9){
                setMarkers(null);
             }
             else if(map.getLevel()<=9){
                setMarkers(map);
            }

/*              if(1 <= map.getLevel() && map.getLevel() <= 4) {
                var markerImage = new kakao.maps.MarkerImage(
                       'resources/bootstrap/img/MAPmarker.png',
                       new kakao.maps.Size(30,30), new kakao.maps.Point(15, 15));
                   marker.setImage(markerImage);
             } else if(5 <= level && level <= 7) {

             }  else if(8 <= level && level <= 10) {

             }  */
            
          });




             

//================ /  M A P   끝=====================================================================================
   
   
     });    


      
      // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
        function setMarkers(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
                customOverlays[i].setMap(map);
            }            
      }
        
   
   // addr_dong1 List
      function getAddrDong1(){
   
         $.ajax({
            url : "/posbis/getAddrDong1Proc.do"
            , type : "post"
            , data : "addr_gu1="+$('[name=addr_gu1]').val()
            , success : function(data){
                  $("[name=addr_dong1]").empty();
                  $("[name=addr_dong1]").append("<option value=''>&nbsp;----동선택----</option>");
                  for( var i=0; data.length>i; i++){
                     //alert();
                     $('[name=addr_dong1]').append("<option value="+data[i]+">&nbsp;"+data[i])
   
                  }
                  if("${preSearchDTO.addr_dong1}"!=null){
                     inputData("[name=addr_dong1]","${preSearchDTO.addr_dong1}");
                  }
                  else{
                     inputData("[name=addr_dong1]","");
                  }
                  
            }
            , error : function(){
               alert("서버 접속 실패");
            }
         })
      }
   
   
     
   
      // 업종 소분류
      function getBusinessTypeName2(){
   
         $.ajax({
            url : "/posbis/getBusinessTypeName2Proc.do"
            , type : "post"
            , data : "business_type_name1="+$('[name=business_type_name1]').val()
            , success : function(data){
                  $("[name=business_type_name2]").empty();
                  $("[name=business_type_name2]").append("<option value=''>&nbsp;----소분류----</option>");
                  //alert("business_type_name2///"+data[0]);
                  for( var i=0; data.length>i; i++){
                     //alert();
                     $('[name=business_type_name2]').append("<option value="+data[i]+">&nbsp;"+data[i])
   
                  }
                  if("${preSearchDTO.business_type_name2}"!=null){
                     inputData("[name=business_type_name2]","${preSearchDTO.business_type_name2}");
                  }
                  else{
                     inputData("[name=business_type_name2]","");
                  }
                  
            }
            , error : function(){
               alert("서버 접속 실패");
            }
         })
      }
   
   
   
      
   
      //월매출 콤마 넣기 함수
     function numberWithCommas(number) {
         var parts = number.toString().split(".");
         parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         return parts.join(".");
     }
   

//----------- 추천메뉴 여러개 일 때 생략된 것들 alert로 보여주는 부분 (랭킹 1 2 3위) --------------
      
     function goAlert1(){
            var result="";
         
            <c:forEach items="${bestMenuList}" var="bestMenu">
               if("${bestMenu.RANKING}"==1 ){
                  result= result+", "+"${bestMenu.MENU_NAME}"
                  //alert("${bestMenu.MENU_NAME}");
               }
            </c:forEach>
               while( result.charAt(0) == "," && result.length>1){
                  result = result.substring(1);
                }
            alert(result);
      }


      

     function goAlert2(){
            var result="";
         
            <c:forEach items="${bestMenuList}" var="bestMenu">
               if("${bestMenu.RANKING}"==2 ){
                  result= result+", "+"${bestMenu.MENU_NAME}"
                  //alert("${bestMenu.MENU_NAME}");
               }
            </c:forEach>
               while( result.charAt(0) == "," && result.length>1){
                  result = result.substring(1);
                }
            alert(result);
      }


      
     function goAlert3(){
            var result="";
         
            <c:forEach items="${bestMenuList}" var="bestMenu">
               if("${bestMenu.RANKING}"==3 ){
                  result= result+", "+"${bestMenu.MENU_NAME}"
                  //alert("${bestMenu.MENU_NAME}");
               }
            </c:forEach>
               while( result.charAt(0) == "," && result.length>1){
                  result = result.substring(1);
                }
            alert(result);
      }
   
//--------------------------------------------------------------------------------------   
   
         
     function goPreSearch(){          
   /*
                $.ajax({
               url : "/posbis/getPreResultProc.do"
               , type : "post"
               , data : $("[name=preSearchForm]").serialize() 
               , success : function(data){
                  alert("성공");
   
                  $("[name=preResultTable] tbody").empty();
            
                  for ( var i=0; i<data.rowCntPerPage; i++){
                     
                     $("[name=preResultTable] tbody").append("<tr><td  align=center>"+data.preResultList[i].PAGINGRNUM
                                                                                 +"<td  align=center>"+data.preResultList[i].RANKING
                                                                                 +"<td  align=right class=month_sales>"+data.preResultList[i].MONTH_SALES
                                                                                 +"<td  align=center>"+data.preResultList[i].BUSINESS_TYPE
                                                                                 +"<td  align=center>"+data.preResultList[i].BEST_MENU_TYPE
                                                                                 +"<td  align=center>"+data.preResultList[i].ADDR_GU+" "+data.preResultList[i].ADDR_DONG+"</tr");
                  
                  }
                  alert(data.selectPageNo)
                  
               }
               , error : function(request,status,error){
                  alert("서버 접속 실패");
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               
               }
            }) 
         */
         $.ajax({
            url : "/posbis/getPreResultProc.do"
               , type : "post"
               , data : $("[name=preSearchForm]").serialize() 
               , success : function(data){
                  //alert("성공");
   
                     
                     $("body").load("/posbis/preSearchForm.do",$("[name=preSearchForm]").serialize());
                  
                  
               }
               , error : function(request,status,error){
                  alert("서버 접속 실패");
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               
               }
            }) 
            
            //document.preSearchForm.submit(); 
      }   
   
   
     
      //검색 조건 초기화
      function goSearchReset(){
         
            document.preSearchForm.reset( );  
            inputData("[name=selectPageNo]" ,"1");
             inputData("[name=rowCntPerPage]","${preSearchDTO.rowCntPerPage}");
             inputData("[name=addr_gu1]","");
             inputData("[name=addr_dong1]","");
             inputData("[name=business_type_name1]","");
             inputData("[name=business_type_name2]","");
             inputData("[name=month_sales]","0");
            
   
      }
   
   
   
   
   function goPreSearchAll(){
         document.preSearchForm.reset( );
         $("[name=preSearchForm] [name=selectPageNo]").val("1");
         $("[name=preSearchForm] [name=rowCntPerPage]").val("10");
         goPreSearch();
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
         <h2 style="font-size:65px"><strong>시장분석</strong></h2>
         <div style=" color:#fff; width:30%">
         <nav class="site-breadcrumb">
               <span class="sb-item active" style="font-size:20px">
            <i class="icon-location-pin"></i> 업계동향 > </span><span class="sb-item active" style="font-size:20px">
            <i class="icon-magnifier"></i> 시장분석</span>
            </nav>
         </div>
      </div>
   </section>
   <!-- Page top Section end -->

 
 

  <!--==========================
   검색관리
  ============================-->
  <main id="main">
   <section id="main-content">
   <section class="wrapper">
       <div class="col-lg-11" align="center">
            <section class="panel">
              <header class="panel-heading" style="background-color:#7f9ed436;">
                      <font color="#39485f">시장 분석</font>
              </header>
              
              <div class="panel-body">
         
      <div class="container" style="max-width:1400">
      <br>
<!--======================-->

<!--======================-->
<!-- 검색 결과 멥 -->
<!--======================-->
   <!--==========================
      Services Section
    ============================-->
 <!-- ============================= MAP =========================================================-->     
     <section id="services" class="section-bg">
      <div class="container">


<div class="map_wrap">
    <div id="map" style="width:100%;height:60%;position:relative;overflow:hidden;"></div>
</div>
              

      </div>
    </section>   
 <!-- ============================= MAP 끝 =========================================================-->  

<br><br>


               <!--======================-->
               <!------검     색        조      건-------------->
               <!--======================-->

               <!-- 검색조건 form -->
               <form name="preSearchForm" method="post"
                  action="/posbis/preSearchForm.do">

                   <div style="border:1px solid #d2d2d2;">
                     <br>
                     <table width="80%" style="margin:0 -160 0 235">
                        <tr>
                           <td style="color:#330066; ">
                             <b> [지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  역]&nbsp;&nbsp;:&nbsp;&nbsp;</b>
                           <td>
                              <div class="form-group"> 
                                 <div style="float:left; padding:3 5 3 5px; margin: 0 0 0 -80">
                                    <!-- <select name="addr_gu1" size=1   class="form-control" id="exampleInputEmail1" >  -->
                                    <select name="addr_gu1" size=1   style="width:160px; height:35px;"> 
                                       <option value="">&nbsp;-----구선택-----</option>
                                       <c:forEach items="${addrGu1List}" var="addrGu1">
                                          <option value="${addrGu1.addr_gu1}">&nbsp;${addrGu1.addr_gu1}</option>
                                       </c:forEach>
                                      </select> 
                                 </div>
                                 
                                 <div style="float:left; padding:3 5 3 5px;"><span style="font-size:25; margin:20 0 0 0px;">&nbsp;>&nbsp;</span></div>
                              
                                 <div  style="float:left; padding:3 5 3 5px;">
                                    <!-- <select name="addr_dong1" size=1    class="form-control" id="exampleInputEmail1" > -->
                                    <select name="addr_dong1" size=1    style="width:160px; height:35px;" >
                                       <option value="">&nbsp;-----동선택-----</option>
                                    </select> 
                                 </div>
                              </div>
                                       
                        <tr>
                           <td style="color:#330066; padding:15 0 0 0"> <b>[업 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;종]&nbsp;&nbsp;:&nbsp;&nbsp;</b>
                           <td style="padding:15 0 0 0">
                              <div class="form-group"> 
                                    <div style="float:left; padding:3 5 3 5px; margin: 0 0 0 -80">
                                    <!-- <select name="business_type_name1"   class="form-control" id="exampleInputEmail1" > -->
                                    <select name="business_type_name1" size=1    style="width:160px; height:35px;"  >
                                       <option value="">&nbsp;-----대분류-----
                                          <c:forEach items="${businessTypeName1List}"
                                             var="businessTypeName1">
                                             <option value="${businessTypeName1.business_type_name1}">&nbsp;${businessTypeName1.business_type_name1}
                                             </option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    
                                    <div style="float:left; padding:3 5 3 5px;"><span style="font-size:25; margin:20 0 0 0px;">&nbsp;>&nbsp;</span></div>
                                    
                                    <div  style="float:left; padding:3 5 3 5px;">
                                    <select name="business_type_name2"     style="width:160px; height:35px;" >
                                          <option value="">&nbsp;-----소분류-----
                                    </select>
                                    </div>
                           </div>
                        <tr >
                           <td style="color:#330066;padding:10 0 0 0"><b>[&nbsp;월&nbsp;&nbsp;매 출&nbsp;]&nbsp;&nbsp;:&nbsp;&nbsp;<br>(지난달 기준)</b>
                           <td style="padding:10 0 0 0"> <input type="radio" style="margin: 0 0 0 -80" id="month_sales_all" name="month_sales" class="month_sales" value="0"><label for="month_sales_all"> 모두 </label>&nbsp;&nbsp;
                                             <input type="radio" id="month_sales_2"  name="month_sales" class="month_sales" value="1000000"><label for="month_sales_2"> 100만원 이상</label>&nbsp;&nbsp;
                                             <input type="radio" id="month_sales_all_5"  name="month_sales" class="month_sales" value="3000000"><label for="month_sales_all_5"> 300만원 이상 </label>&nbsp;&nbsp;
                                             <input type="radio" id="month_sales_all_10"  name="month_sales" class="month_sales" value="5000000"><label for="month_sales_all_10"> 500만원 이상</label>&nbsp;&nbsp;
                        <tr>
                           <td>
                           <td style="padding:20 0 0 0"> 
                           
                                 <button type="button" class="btn btn-default"style="margin:0 20 0 -80" onClick="goPreSearch();">검      색</button>&nbsp;
                                 <button type="button" class="btn btn-default"style="margin:0 10 0 0" onClick="goPreSearchAll();">모두검색</button>&nbsp;
                                        <a href="javascript:goSearchReset();" ><u>검색조건 초기화</u>
                     </table>
                     <br>
               </div>
               
                   <br>
                  
                    <div class="col-sm-12" align="center">
                    
                   
               
                  <input type="hidden" name="selectPageNo">      
                  <input type="hidden" name="sort" value="ranking asc">      
               </form>
               <!-- /preSearchForm  -->
               <br>

                 
                     
                     
            <!-- ====== 행보기 ==========================================================  -->
              <table class="table table-striped table-advance table-hover"  id="select">
                   <thead>
                             <tr>
                     <td align=right>
                        <!-- EL 문법으로 게시판 검색 총 개수 출력 -->
                        <!-- 달러{boardListAllCnt}(EL은 주석문에서 유효) 은 컨트롤러 클래스 내부에
                           ModelAndView 객체에 boardListAllCnt 라는 키갑스올 저장된 데이터를
                           EL 로 표현하여 삽입 -->   
                        [검색 총 개수] : ${preResultAllCnt}&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력 양식 -->
                        <!-- 선택한 페이지 번호는 DB 연동시 아주 중요한 역할 -->   
                        <select name="rowCntPerPage" style="width:50px;height:30px;">
                           <option value="10">&nbsp;10&nbsp;
                           <option value="15">&nbsp;15&nbsp;
                           <option value="20">&nbsp;20&nbsp;
                           <option value="25">&nbsp;25&nbsp;
                           <option value="30">&nbsp;30&nbsp;
                        </select> 행보기
               </table>
                     <!-- ====== / 행보기========================================================== -->
               
               
               <!-- 페이징 번호 삽입할 span 태그 선언 -->
               <div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
               
         <br>
                    <!-- ====== 결과 테이블 ========================================================== -->
                    <table class="table table-striped table-advance table-hover"  id="select">
                       <thead>
                            <tr style="background-color:#7f9ed436;">
            			 <th><font color="#39485f">NO</font>
                        
                     <!-- 순위-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='ranking desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();"><font color="#656565">매출순위▼</font>
                           </c:when>
                           <c:when test="${param.sort=='ranking asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking desc'); goPreSearch();"><font color="#656565">매출순위▲</font>
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('ranking asc'); goPreSearch();"><font color="#656565">매출순위</font>
                           </c:otherwise>
                        </c:choose>
                     <!-- 월매출-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='month_sales desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();"><font color="#656565">월 매 출 (지난달 기준)▼</font>
                           </c:when>
                           <c:when test="${param.sort=='month_sales asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales desc'); goPreSearch();"><font color="#656565">월 매 출 (지난달 기준)▲</font>
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('month_sales asc'); goPreSearch();"><font color="#656565">월 매 출 (지난달 기준)</font>
                           </c:otherwise>
                        </c:choose>
                        <!-- 업종-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='business_type1 desc, business_type2 desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 asc, business_type2 asc'); goPreSearch();"><font color="#656565">업&nbsp;&nbsp;종▼</font>
                           </c:when>
                           <c:when test="${param.sort=='business_type1 asc, business_type2 asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 desc, business_type2 desc'); goPreSearch();"><font color="#656565">업&nbsp;&nbsp;종▲</font>
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('business_type1 asc, business_type2 asc'); goPreSearch();"><font color="#656565">업&nbsp;&nbsp;종</font>
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='best_menu_type desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();"><font color="#656565">인기메뉴▼</font>
                           </c:when>
                           <c:when test="${param.sort=='best_menu_type asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type desc'); goPreSearch();"><font color="#656565">인기메뉴▲</font>
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('best_menu_type asc'); goPreSearch();"><font color="#656565">인기메뉴</font>
                           </c:otherwise>
                        </c:choose>
                        <!-- 인기메뉴분류-------------------------------------------------------------------------------------------------------------------  -->
                        <c:choose>
                           <c:when test="${param.sort=='addr_gu desc, addr_dong desc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu asc, addr_dong asc'); goPreSearch();"><font color="#656565">지역(동단위)▼</font>
                           </c:when>
                           <c:when test="${param.sort=='addr_gu asc, addr_dong asc'}">
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu desc, addr_dong desc'); goPreSearch();"><font color="#656565">지역(동단위)▲</font>
                           </c:when>
                           <c:otherwise>
                              <th style="cursor:pointer"
                                    onClick="$('[name=sort]').val('addr_gu asc, addr_dong asc'); goPreSearch();"><font color="#656565">지역(동단위)</font>
                           </c:otherwise>
                        </c:choose>
                          </tr>
                         </thead>
                     <tbody>


                     <c:forEach items="${preResultList}" var="preResult" varStatus="loopTagStatus">
                     <tr>
                        <td  align=center width="7%">${preResult.PAGINGRNUM}
                        <td  align=center width="10%">${preResult.RANKING}
                        <td  align=right  width="20%" class=month_sales>${preResult.MONTH_SALES} 원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <td  align=left  width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${preResult.BUSINESS_TYPE1} > ${preResult.BUSINESS_TYPE2}
                        <td   align=center  width="20%">${preResult.BEST_MENU_TYPE}
                        <td   align=center  width="20%">${preResult.ADDR_GU} ${preResult.ADDR_DONG} 
                     </c:forEach>
                  </table>
               <!--============================= /검색결과 ===========================-->
               <br>
               <br>
               <c:if test="${empty preResultList}">
               검색 결과가 없습니다.
               <br><br><br>
               </c:if>
               
               
         
                   <!-- ====== 추천 메뉴 ========================================================== -->
            <div style="border:1px solid #d2d2d2; padding:30 0 60 0">
                   
                       <table class="table-advance">
                   <thead>
                         <tr><th  align=center colspan="${fn:length(bestMenuList)}"  style="font-size:40; padding:10 0 15 0; color:#6993da">추천메뉴

                   </thead>
                   <c:if test="${!empty preResultList}">
                   <tbody>   
                                                <tr>                         
                             <td  align=center style="vertical-align:bottom; padding:60 20 0 40px" >
                             
                                 <i  class="icon-badge" style="color:#AEADAA;font-size:100px;">
                                 </i>
                                 <div style="margin:-80 -40 11 0 ">
                                    <span style="color:#AEADAA; margin:0 0 0 -40; font-size:50;"><strong>2</strong></span>
                                 </div>
                                  <br>
                                  <div  style="background-color:lightgray; width:230; height:120; line-height:4; margin:25 0 0 0">
                                  <div style="height:1"></div>
                                   
                                   <c:set var="loop_index" value="0"></c:set>
                                   <c:forEach items="${bestMenuList}" var="bestMenu" varStatus="loopTagStatus" >
                                      <a onClick="goAlert2();" style="cursor:pointer;">
                                      <c:if test="${bestMenu.RANKING!=2}">
                                         <c:set var="loop_index" value="${loop_index + 1}" />
                                      </c:if>
                                      <c:if test="${bestMenu.RANKING==2}">     
                                       <h5>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)<=2}">
                                      <strong style="font-size:25"> ${bestMenu.MENU_NAME}</strong>
                                       </c:if>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)==3}">
                                               <strong>...</strong>
                                            </c:if>   
                                            </h5>
                                      </c:if>
                                      </a>
                                   </c:forEach>
                                 </div>  
                                 
                                 
                             <td  align=center style="vertical-align:bottom; padding:30 20 0 40px" >
                             
                                 <i  class="icon-badge" style="color:#F3DA1B;font-size:100px;">
                                 </i>
                                 <div style="margin:-80 -40 11 0">
                                    <span style="color:#F3DA1B; margin:0 0 0 -40; font-size:50;"><strong>1</strong></span>
                                 </div>
                                  <br>
                                  <div  style="background-color:lightgray; width:230; height:150; line-height:6; margin:25 0 0 0">
                                  <div style="height:1"></div>
                                  
                                   <c:set var="loop_index" value="0"></c:set>
                                   <c:forEach items="${bestMenuList}" var="bestMenu" varStatus="loopTagStatus" >
                                      <a onClick="goAlert1();" style="cursor:pointer;">
                                      <c:if test="${bestMenu.RANKING!=1}">
                                         <c:set var="loop_index" value="${loop_index + 1}" />
                                      </c:if>
                                      <c:if test="${bestMenu.RANKING==1}">     
                                       <h5>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)<=3}">
                                       <strong style="font-size:25">${bestMenu.MENU_NAME}</strong>
                                       </c:if>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)==4}">
                                               <strong>...</strong>
                                            </c:if>   
                                            </h5>
                                      </c:if>
                                      </a>
                                   </c:forEach>
                                 </div>


                        <td  align=center style="vertical-align:bottom; padding:90 20 0 40px" >
                             
                                 <i  class="icon-badge" style="color:#DAA637;font-size:100px;">
                                 </i>
                                 <div style="margin:-80 -40 11 0 ">
                                    <span style="color:#DAA637; margin:0 0 0 -40; font-size:50;"><strong>3</strong></span>
                                 </div>
                                  <br>
                                  <div  style="background-color:lightgray; width:230; height:90; line-height:4; margin:25 0 0 0">
                                     <div style="height:1"></div>
                                     
                                     <c:set var="loop_index" value="0"></c:set>
                                   <c:forEach items="${bestMenuList}" var="bestMenu" varStatus="loopTagStatus" >
                                      <a onClick="goAlert3();" style="cursor:pointer;">
                                      <c:if test="${bestMenu.RANKING!=3}">
                                         <c:set var="loop_index" value="${loop_index + 1}" />
                                      </c:if>
                                      <c:if test="${bestMenu.RANKING==3}">     
                                       <h5>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)<=1}">
                                       <strong style="font-size:25">${bestMenu.MENU_NAME}</strong>
                                       </c:if>
                                       <c:if test="${(loopTagStatus.index-loop_index+1)==2}">
                                               <strong >...</strong>
                                            </c:if>   
                                            </h5>
                                      </c:if>
                                     </a>
                                   </c:forEach>
                                 </div>                 
                                                     
                                    
                             <%--                                          
                             <c:forEach items="${bestMenuList}" var="bestMenu" varStatus="loopTagStatus">   
                                <c:if test="${bestMenu.RANKING==1}">
                                <td  align=center style="vertical-align:bottom; padding:10 20 30 40px" >
                                    <i  class="fa fa-fw  fas fa-trophy" style="color:#F3DA1B;font-size:50px;"></i>
                                    <div style="margin:-42 -42 5 0 ">
                                       <span style="color:#fff; margin:0 0 0 -42; font-size:32;"><strong>1</strong></span>
                                    </div>
                                     <br>
                              <div style="background-color:lightgray; width:150; height:110; line-height:6;">${bestMenu.MENU_NAME}</div>
                                </c:if>
                                
                                <c:if test="${bestMenu.RANKING==3}">
                                <td  align=center style="vertical-align:bottom; padding:71px 20 30 40px" >
                                    <i  class="fa fa-fw  fas fa-trophy" style="color:#DAA637;font-size:50px;"></i>
                                    <div style="margin:-42 -42 5 0 ">
                                       <span style="color:#fff; margin:0 0 0 -42; font-size:32; "><strong>3</strong></span>
                                    </div>
                                     <br>
                              <div style="background-color:lightgray; width:150; height:50; line-height:4;">${bestMenu.MENU_NAME}</div>
                                </c:if> 
                              </c:forEach> --%>
                          </tbody>
                     </c:if>
                     
                     </table>
                     <br>
               <br>
                      <c:if test="${empty bestMenuList}">
                     추천 결과가 없습니다.
                     </c:if>
                 </div>
                     <!-- ====== / 추천 메뉴 ========================================================== -->
               
               
               


               

               
               <br>
               <br>

           
   

      
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
 