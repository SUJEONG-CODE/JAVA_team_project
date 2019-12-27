<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!--page language="java" 생략 가능 -->
<%@ page import="java.util.*" %>
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="/WEB-INF/views/common.jsp" %>

<html>
   <head>
       <title> new document </title>
      <meta charset="utf-8">
      <script>         
      
		$(document).ready(function(){
			
		    $('#sales').hide();
		    $('.pagingDiv').hide();
		    $('#select').hide();
						
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
					,"15"								//페이지 당 보여줄 페이지번호 개수
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
 			//==============================================================================================

             
		    $('#sales').show();
		    $('.pagingDiv').show();
		    $('#select').show();
			
	       var sumC = 0;
	       $('tr').find('.sales_count').each(function () {
	           var sales_count = $(this).text();
	           if (!isNaN(sales_count) && sales_count.length !== 0) {
	        	   sumC += parseFloat(sales_count);
	           }
	       });
	       $('.total-sales_count').html(sumC);

	       var sumA = 0;
	       $('tr').find('.sales_amount').each(function () {
	           var sales_amount = $(this).text();
	           if (!isNaN(sales_amount) && sales_amount.length !== 0) {
	        	   sumA += parseFloat(sales_amount);
	           }
	       });
	       $('.total-sales_amount').html(sumA);

	       var sumI = 0;
	       $('tr').find('.sales_income').each(function () {
	           var sales_income = $(this).text();
	           if (!isNaN(sales_income) && sales_income.length !== 0) {
	        	   sumI += parseFloat(sales_income);
	           }
	       });
	       $('.total-sales_income').html(sumI);



//=====================================================================================================
    	  $(".sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum + "원");
	      });
    	  $(".total-sales_amount").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
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
  	  	  $(".total-sales_count").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum);
	      });
  	  	  $(".sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
	      });
	  	  $(".total-sales_income").each(function() {
	      	    var num = $(this).text();
	      	    var commaNum = numberWithCommas(num);
	      	    $(this).text(commaNum+ "원");
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
 			document.salesForm.submit();
         }

//=====================================================================================================
       function goMainForm(){
           location.replace("/posbis/mainForm.do");
        }

       function goMenuForm(){
          location.replace("/posbis/menuForm.do")
       }
     
       function goSalesForm(){
          location.replace("/posbis/salesForm.do")
       }
     
       // 프리미엄으로 이동 시일반 회원은 프리미엄 부분에 들어가지 못하게 하는 함수
	    function goPreChartForm(){
			 var rank_code = ${rank_code};
	         if(rank_code == 2){
	         	location.replace("/posbis/preChartForm.do");
	         }
	         else{
	        	 if(confirm("프리미엄 회원 등록을 위해 카드결제 화면으로 이동하시겠습니까?")==false) {
						return;
					}
	        	 else{
	        		 location.replace("/posbis/payForm.do");
	             }
	         }
	      }

       function goMainForm(){
          location.replace("/posbis/mainForm.do")
       }
       
       function goInfoUpdateForm(){
          location.replace("/posbis/infoUpdateForm.do")
       }
       
       function gowithdrawalForm(){
          location.replace("/posbis/withdrawalForm.do")
       }
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

      </script>

   </head>


   <body><center>
    <div class="right"><input type=button value="메인으로" onClick="goMainForm()"></div>&nbsp;&nbsp;
    
    
      <div style="border:1px solid; 20px, margin:10px; height:100%; width: 100%; ">

         <!---------------- 상단바 ------------------------->
         <div style="float: left; border:1px solid; 20px, margin:10px; height:15%; width: 100%;">
         <center><h2>상단바</h2></center>
         </div>
      
         <div style="display:table; border:1px solid; 20px, margin:10px; height:85%; width: 100%; ">
            <!------------------ 사이드바 ---------------------->
            <div style="float:left; width: 15%; border:1px solid; padding:30px; height:90%;"><br><Br>
               <h3>마이페이지</h3><br>
                  <a onClick="goMyPageForm()">내 정보관리</a><br><br>
                  <a onClick="goMenuForm()">메뉴관리</a><br><br>
                  <a onClick="goSalesForm()">매출관리</a><br><br>
                  <a onClick="goPreChartForm()">프리미엄</a><br><br>
            </div>
       <br>

    <form name = "salesForm" method="post" action="/posbis/salesForm.do">
	<div style="width:800"  z-index:4;>
	
	       <!-- ================================================================================================================================================ -->
		       사업자번호:
		       	<input type = "checkbox" name="chooseAllBusinessNo"> 모두선택
		      <c:forEach items="${businessNoList}" var="businessNoList">
		        <input type ="checkbox" name="chooseBusinessNo" value="${businessNoList.business_no}">${businessNoList.business_no}(${businessNoList.business_name})
		      </c:forEach>
		   <!-- ================================================================================================================================================ -->
			
			
     
               <h2>[매출관리]</h2>

               [키워드] : <input type = "text" name="keyword" class="keyword">&nbsp;

               [기간선택]
               <input type = "radio" name="sales_date" class="sales_date" value="1" >금일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="2" >최근 일주일매출&nbsp;
               <input type = "radio" name="sales_date" class="sales_date" value="3" >이번달매출<br><br>
               
				[기간설정]: <input type="date" name="sales_date_t1" class="sales_date_t1"> ~ <input type="date" name="sales_date_t2" class="sales_date_t2">
               
               <input type="button" value="검   색" onClick="goSearch();">&nbsp;
               <input type="button" value="모두 검색" onClick="goSearchAll();">&nbsp;
             
               <a href="javascript:;" onclick="showMenuSales();" >[메뉴별 매출관리]로 이동</a>&nbsp;&nbsp;

		
		<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
		<!-- 선택한 페이지번호는 DB 연동시 아주 중요한 역할을 한다 -->
		<!-- 개발중에는 테스트를 위해 type을 text로 바꿔놓으면 눈에 보여서 편하다 -->
		<input type="hidden" name="selectPageNo"> 
		<input type="hidden" name="user_id" value="${user_id}">  
				
	</div>	
	<table border=0 width=700 id="select">
		<tr>
			<td align=right>
				<!-- EL 문법으로 게시판 검색 총 개수 출력하기 -->
				<!-- EL문법은 주석문 안에 들어가더라도 소스보기 했을 때 실행결과가 삽입된다. 문법에 맞지 않는 내용을 삽입할 시에는 에러발생 -->
				<!-- 달러{salesAllCnt} 은  컨트롤러 클래스 내부에 -->
				<!-- ModelAndView 객체에 salesAllCnt 라는 키값으로 저장된 -->
				<!-- 데이터를 EL로 표현하여 삽입하라는 뜻이다. -->
				[거래 건수]: ${salesListAllCnt}&nbsp;&nbsp;
				 ${salesList[1].business_name}
				<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기 -->
				<!-- 행의 개수는 DB 연동시 아주 중요한 역할을 한다. -->
				<select name="rowCntPerPage">
					<option value="10">10
					<option value="15">15
					<option value="20">20
					<option value="25">25
					<option value="30">30
				</select>

	</table>
   </form>
				   	<form name="menuSalesForm" method="post" action="/posbis/menuSalesForm.do">
					</form>
	
        <!-- 페이징 번호를 삽입할 span 태그 선언하기  -->
		<div class="pagingDiv">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		
            <table border=1 cellspacing=0 cellpadding=5 align=center width="800" id="sales">
                                 
             <thead>
                <tr>
                  <th>no
                  <th>상호명
                  <th>카테고리
                  <th>메뉴
                  <th>가격
                  <th>수량
                  <th>총매출
                  <th>순매출
                  <th>판매일
                </tr>
             </thead>
             <tbody>
               <c:forEach items="${salesList}" var="sales" varStatus="loopTagStatus">  <!-- requestScope.은 생략 가능 -->
				<tr>
					<td align=center>
					<%-- 게시판 목록 중에 각 행의 정순 일련번호 출력--%>
					${salesSearchDTO.selectPageNo*salesSearchDTO.rowCntPerPage-salesSearchDTO.rowCntPerPage+1
																					+loopTagStatus.index}  
					<!-- 각 행의 상호명 출력 -->
					<td align=center>${sales.business_name}
					<!-- 각 행의 메뉴카테고리 출력 -->
					<td align=center>${sales.menu_category_code}
					<!-- 각 행의 메뉴 이름 출력 -->
					<td align=center>${sales.menu_name}
					<!-- 각 행의 메뉴 가격 출력 -->
					<td align=center class="menu_price">${sales.menu_price}
					<!-- 각 행의 판매 수량 출력 -->
					<td align=center class="sales_count">${sales.sales_count}
					<!-- 각 행의 총매출 출력 -->
					<td align=center class="sales_amount">${sales.sales_amount}
					<!-- 각 행의 순매출 출력 -->
					<td align=center class="sales_income">${sales.sales_income}
					<!-- 각 행의 판매 날짜 출력 -->
					<td align=center>${sales.sales_date}
					
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td align=center>total
				<td align=center>
				<td align=center>
				<td align=center>
				<td align=center>
				<td align=center class="total-sales_count">
				<td align=center class="total-sales_amount">
				<td align=center class="total-sales_income">
				<td>
			</tfoot>
            </table><br>
   
       <!-- ==================================================================================== -->     
	<c:if test="${empty salesList}">
		검색결과 없음
	</c:if> 
</center>


	</div>
</div>
    
   </body>

</html>